import 'dart:io';
import 'package:airbnb/airbnb_global_imports.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ExploreScreenController extends GetxController {
  var activeDots = [].obs;
  void updateActiveDots(int homeI, int imageI){
    activeDots[homeI] = imageI;
  }

  Future<void> addPlace(
    String name,
    String rating,
    // String imageUrl,
    String distance,
    String availableDates,
    String price,
  ) async {
    await FirebaseFirestore.instance.collection("places").add({
      "name": name,
      "price": price,
      // "image": imageUrl,
      "distance": distance,
      "available_dates": availableDates,
      "created_at": FieldValue.serverTimestamp(),
    });
  }

  Future<dynamic> getAllDocuments() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('places').get();

    Map<String, Map<String, dynamic>> documents = {};
    for (var doc in querySnapshot.docs) {
      documents[doc.id] = doc.data() as Map<String, dynamic>;
    }
    activeDots.value = List.generate(documents.length, (index){
      return 0;
    });
    return documents;
  }

  // property detail screen
  Future<dynamic> getDocumentById(String documentId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('places')
          .doc(documentId)
          .get();
      if (documentSnapshot.exists) {
        final documentData = {
          'id': documentSnapshot.id,
          ...documentSnapshot.data() as Map<String, dynamic>
        };
        return documentData;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  var currentIndexPropertyDetail = 0.obs;

  void heroAnimation(BuildContext context, String image) {
    showDialog(
      context: context,
        builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: AppColor.black,
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){
                Get.back();
              },
              icon: Icon(Icons.arrow_back,color: AppColor.white,),
            ),
            backgroundColor: AppColor.black,
          ),
          body: Stack(children: [
            Center(
              child: Hero(
                tag: 'hero',
                child: CustomImage(
                  path: image,
                ),
              ),
            ),
          ]),
        );
      },
    );
  }

  void openFullScreenMap(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Close full-screen map",
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: AppColor.transparent,
          body: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(23.014509, 72.591759),
                  zoom: 12,
                ),
                zoomControlsEnabled: false,
              ),
              Positioned(
                top:  context.screenHeight * 0.055  ,
                right: context.screenWidth * 0.043,
                child: IconButton(
                  iconSize: context.screenWidth * 0.08,
                  icon: Icon(Icons.close, color: AppColor.black,),
                  onPressed: () => Get.back(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

// imagekit.io website for image(places)
  Future<void> uploadImageToImageKit() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile == null) {
        Get.snackbar("Image not selected", 'Please select image');
        return;
      }

      Uint8List? imageBytes;
      String fileName = pickedFile.name;

      if (kIsWeb) {
        imageBytes = await pickedFile.readAsBytes();
      } else {
        File imageFile = File(pickedFile.path);
        imageBytes = await imageFile.readAsBytes();
      }

      // ImageKit API details
      String apiUrl = "https://upload.imagekit.io/api/v1/files/upload";
      String privateApiKey = "private_FanKyRKRVNogDW4OhBxa8L6e6/s=:";
      String authHeader =
          "Basic ${base64Encode(utf8.encode('$privateApiKey:'))}";

      var request = http.MultipartRequest("POST", Uri.parse(apiUrl));
      request.headers["Authorization"] = authHeader;

      request.fields["fileName"] = fileName;
      request.fields["useUniqueFilename"] = "false";
      request.fields["folder"] = "/dummy/folder/";
      request.fields["tags"] = "nice,copy,books";

      if (kIsWeb) {
        request.files.add(http.MultipartFile.fromBytes(
          "file",
          imageBytes,
          filename: fileName,
        ));
      } else {
        request.files.add(http.MultipartFile.fromBytes(
          "file",
          imageBytes,
          filename: fileName,
        ));
      }

      var response = await request.send();
      // String responseData = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // var jsonResponse = jsonDecode(responseData);
        Get.snackbar("Successfully uploaded", 'Great!');
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }
}
