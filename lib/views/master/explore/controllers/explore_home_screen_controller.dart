import 'dart:io';
import 'package:airbnb/airbnb_global_imports.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class BottomNavigationController extends GetxController {
  var currentIndex = 0.obs;
  final List<Widget> screens = [
    ExploreHomeScreen(),
    WishlistsScreen(),
    TripsScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  @override
  void onInit() {
    super.onInit();
    updateIndexFromRoute();
  }

  void updateIndexFromRoute() {
    String currentRoute = Get.currentRoute;
    switch (currentRoute) {
      case '/explore':
        currentIndex.value = 0;
        break;
      case '/wishlists':
        currentIndex.value = 1;
        break;
      case '/trips':
        currentIndex.value = 2;
        break;
      case '/messages':
        currentIndex.value = 3;
        break;
      case '/profile':
        currentIndex.value = 4;
        break;
    }
  }

  void changeIndex(int index) {
    currentIndex.value = index;
    switch (index) {
      case 0:
        Get.offNamed('/explore');
        break;
      case 1:
        Get.offNamed('/wishlists');
        break;
      case 2:
        Get.offNamed('/trips');
        break;
      case 3:
        Get.offNamed('/messages');
        break;
      case 4:
        Get.offNamed('/profile');
        break;
    }
  }
}

class ExploreCarouselSliderController extends GetxController {
  var currentIndex = 0.obs;

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

  Future<Map<String, Map<String, dynamic>>>getAllDocuments() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('places')
        .get();

    Map<String, Map<String, dynamic>> documents = {};
    for (var doc in querySnapshot.docs) {
      documents[doc.id] = doc.data() as Map<String, dynamic>;
    }
    return documents;
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
    String authHeader = "Basic ${base64Encode(utf8.encode('$privateApiKey:'))}";

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
