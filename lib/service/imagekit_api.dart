import 'dart:io';
import 'package:airbnb/airbnb_global_imports.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ImageKitApi {

  Future<String?> uploadImageToImageKit(XFile imageFileToUploadInImagekit) async {
    // XFile image
    try {
      final pickedFile = imageFileToUploadInImagekit;

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
      request.fields["folder"] = "/dummy/airbnb_profile_photos/";

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
      String responseData = await response.stream.bytesToString();
      var jsonResponse = jsonDecode(responseData);

      if (response.statusCode == 200) {
        return jsonResponse['url'];
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
