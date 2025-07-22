import 'dart:io';
import 'package:airbnb/airbnb_global_imports.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class OwnerPropertyController extends GetxController {

  var isLoading = false.obs;

  GlobalKey<FormState> addPropertyFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> editPropertyFormKey = GlobalKey<FormState>();

  TextEditingController propertyName = TextEditingController();
  TextEditingController propertyDistance = TextEditingController();
  TextEditingController availableDate = TextEditingController();
  TextEditingController propertyPrice = TextEditingController();
  TextEditingController propertyRatings = TextEditingController();

  // for multiple images
  var pickedImagesForUI = [].obs;
  var pickedSvgImagesForUI = [].obs;
  var multiplePickedFiles = []; // variable make outside -> for using in uploadImage method

  Future<void> pickImages() async {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      final picker = ImagePicker();

      multiplePickedFiles = await picker.pickMultiImage();

      if (multiplePickedFiles.isNotEmpty) {
        for (var file in multiplePickedFiles) {
          if (file.path.toLowerCase().endsWith('.svg')) {
            pickedSvgImagesForUI.add(await File(file.path).readAsString());
          } else {
            pickedImagesForUI.add(File(file.path));
          }
        }
      }
    }
  }

  // selected images url ..to upload in firebase
  var imageUrlsToUpload = [].obs;

  // upload image to imagekit , add property in firebase and edit property update in firebase
  Future<void> uploadImagesToImageKit({required bool isAdd,String? propertyId}) async {
    try {
      isLoading.value = true;
      imageUrlsToUpload.clear();
      if (multiplePickedFiles.isEmpty) {
        Get.snackbar(
          "No images selected",
          'Please select at least one image',
          backgroundColor: AppColor.pink,
        );
        return;
      }
      // ImageKit API details
      String apiUrl = "https://upload.imagekit.io/api/v1/files/upload";
      String privateApiKey = "private_FanKyRKRVNogDW4OhBxa8L6e6/s=:";
      String authHeader = "Basic ${base64Encode(utf8.encode('$privateApiKey:'))}";

      var response;
      for (var pickedFile in multiplePickedFiles) {
        Uint8List? imageBytes;
        String fileName = pickedFile.name;

        if (kIsWeb) {
          imageBytes = await pickedFile.readAsBytes();
        } else {
          File imageFile = File(pickedFile.path);
          imageBytes = await imageFile.readAsBytes();
        }

        var request = http.MultipartRequest("POST", Uri.parse(apiUrl));
        request.headers["Authorization"] = authHeader;

        request.fields["fileName"] = fileName;
        request.fields["folder"] = "/dummy/test/";

        request.files.add(http.MultipartFile.fromBytes(
          "file",
          imageBytes!,
          filename: fileName,
        ));

        response = await request.send();
        String responseData = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseData);
        imageUrlsToUpload.add(jsonResponse['url']);
      }

      if (response.statusCode == 200) {
        if (isAdd == true) {
          addProperty();
        }
        updateOwnerPropertyDetails(propertyId!);
      } else {
        SmartAlert.customSnackBar(
          title: "Something went wrong",
          desc: 'Error...Try again!',
        );
      }
      Get.back();
    } catch (e) {
      SmartAlert.customSnackBar(title: 'Error..Please try again', desc: '$e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addProperty() async {
    try {
      isLoading.value = true;
      await FirebaseFirestore.instance
          .collection("places")
          .add({
        "name": propertyName.text,
        "price": propertyPrice.text,
        "images": imageUrlsToUpload,
        "distance": propertyDistance.text,
        "available_dates": availableDate.text,
        "rating": propertyRatings.text,
        "uuid": FirebaseAuth.instance.currentUser!.uid.toString(),
        "created_at": FieldValue.serverTimestamp(),
      });
      Get.back();
      SmartAlert.customSnackBar(
        title: 'Property added Successfully',
        desc: "Now you can see your properties.",
      );
    } catch (e) {
      SmartAlert.customSnackBar(title: "Failed..Try again", desc: '$e');
    } finally {
      isLoading.value = false;
    }
  }

  // edit property
  Future<dynamic> fetchOwnerPropertyDetails(String propertyId) async {
    try {
      try {
        var userId = await FirebaseFirestore.instance
            .collection('places')
            .doc(propertyId)
            .get();
        return userId.data();
      } on FirebaseFirestore catch (e) {
        SmartAlert.customSnackBar(
          title: 'Error!',
          desc: 'Something went wrong. $e',
        );
      }
    } on FirebaseFirestore catch (e) {
      SmartAlert.customSnackBar(
        title: 'Error!',
        desc: 'Something went wrong. $e',
      );
    }
  }

  var ownerPropertyImagesFromFirebase = [].obs;

  void deleteImageFromFirebase(String fileUrl,String propertyId) async {
    try {
      isLoading.value = true;
      await FirebaseFirestore.instance
          .collection('places')
          .doc(propertyId)
          .update(
        {
          'images': FieldValue.arrayRemove([fileUrl]),
        },
      );
    } on FirebaseFirestore catch (e) {
      SmartAlert.customSnackBar(title: 'Failed..Please try again', desc: 'Delete again. $e');
    } finally {
      isLoading.value = false;
      Get.back();
    }
  }

  // update property details method
  Future<void> updateOwnerPropertyDetails(String propertyId) async {
    try {
      isLoading.value = true;
      await FirebaseFirestore.instance
          .collection('places')
          .doc(propertyId)
          .update(
        {
          "name": propertyName.text,
          "price": propertyPrice.text,
          "images": FieldValue.arrayUnion(imageUrlsToUpload),
          "distance": propertyDistance.text,
          "available_dates": availableDate.text,
          "rating": propertyRatings.text,
          "created_at": FieldValue.serverTimestamp(),
        },
      );
      Get.back();
      SmartAlert.customSnackBar(title: 'Successfully edited your property.', desc: 'Now you can see.',);
    } on FirebaseFirestore catch (e) {
      SmartAlert.customSnackBar(
        title: 'Error!',
        desc: 'Something went wrong. $e',
      );
    } finally {
      isLoading.value = false;
    }
  }

  // owner all properties
  Stream<dynamic> getAllPropertiesByOwnerId(String documentId)  {
    try {
      return FirebaseFirestore.instance
          .collection('places')
          .where('uuid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .map((querySnapshot) {
        Map<String, Map<String, dynamic>> documents = {};
        for (var doc in querySnapshot.docs) {
          documents[doc.id] = doc.data();
        }
        return documents;
      });
    } catch (e) {
      return Stream.error('Something went wrong. $e');
    }
  }
}
