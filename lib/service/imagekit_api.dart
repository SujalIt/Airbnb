import 'dart:io';
import 'package:airbnb/airbnb_global_imports.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ImageKitApi {

  static Future<List<String>?> uploadImageToImageKit({XFile? singleFile , List<dynamic>? imageFiles}) async {
    // XFile image
    try {
      // ImageKit API details
      String apiUrl = "https://upload.imagekit.io/api/v1/files/upload";
      String privateApiKey = "private_FanKyRKRVNogDW4OhBxa8L6e6/s=:";
      String authHeader = "Basic ${base64Encode(utf8.encode('$privateApiKey:'))}";

      var response;
      // storing urls ...to upload in firebase
      List<String> imgUrls = [];

      if(singleFile != null){
        // single image upload
        final pickedFile = singleFile;

        Uint8List? imageBytes;
        String fileName = pickedFile.name;
        File imageFile = File(pickedFile.path);
        imageBytes = await imageFile.readAsBytes();

        var request = http.MultipartRequest("POST", Uri.parse(apiUrl));
        request.headers["Authorization"] = authHeader;
        request.fields["fileName"] = fileName;
        request.fields["folder"] = "/dummy/airbnb_profile_photos/";
        request.files.add(http.MultipartFile.fromBytes(
          "file",
          imageBytes,
          filename: fileName,
        ));

        response = await request.send();
        String responseData = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseData);
        if (response.statusCode == 200) {
          return [jsonResponse['url']];
        }
      }else{
        if(imageFiles != null){
          for (var pickedFile in imageFiles) {
            Uint8List? imageBytes;
            String fileName = '';

            File imageFile = File(pickedFile.path);
            fileName = imageFile.uri.pathSegments.last;
            imageBytes = await imageFile.readAsBytes();

            var request = http.MultipartRequest("POST", Uri.parse(apiUrl));
            request.headers["Authorization"] = authHeader;
            request.fields["fileName"] = fileName;
            request.fields["folder"] = "/dummy/test/";
            request.files.add(http.MultipartFile.fromBytes(
              "file",
              imageBytes,
              filename: fileName,
            ));

            response = await request.send();
            String responseData = await response.stream.bytesToString();
            var jsonResponse = jsonDecode(responseData);
            imgUrls.add(jsonResponse['url']);
          }
        }
        if (response.statusCode == 200) {
          return imgUrls;
        }
      }
      return null;
    } catch (e) {
      SmartAlert.customSnackBar(title: 'Error..Please try again', desc: '$e');
      return null;
    }
  }
}
