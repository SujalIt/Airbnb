import 'dart:io';
import 'package:airbnb/airbnb_global_imports.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ExploreScreenController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> screens = [
    ExploreScreen(),
    WishlistScreen(),
    TripsScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  var currentIndexCarousel = 0.obs;

  Future<void> addPlace(String name,
      String rating,
      // String imageUrl,
      String distance,
      String availableDates,
      String price,) async {
    await FirebaseFirestore.instance.collection("places").add({
      "name": name,
      "price": price,
      // "image": imageUrl,
      "distance": distance,
      "available_dates": availableDates,
      "created_at": FieldValue.serverTimestamp(),
    });
  }

  Future<Map<String, Map<String, dynamic>>> getAllDocuments() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('places')
        .get();

    Map<String, Map<String, dynamic>> documents = {};
    for (var doc in querySnapshot.docs) {
      documents[doc.id] = doc.data() as Map<String, dynamic>;
    }
    return documents;
  }

  void openFullScreenMap(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Close full-screen map",
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return FullScreenMapDialog();
      },
    );
  }

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
      String authHeader = "Basic ${base64Encode(
          utf8.encode('$privateApiKey:'))}";

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
