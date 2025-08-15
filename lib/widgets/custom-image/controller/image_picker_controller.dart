import 'package:airbnb/airbnb_global_imports.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class ImagePickerController extends GetxController {

  // for single image
  var imageFile = Rx<File?>(null);
  var imageBytes = Rx<Uint8List?>(null);
  var svgString = Rx<String?>(null);

  // for multiple images
  var pickedImagesForUI = [].obs;
  var pickedSvgImagesForUI = [].obs;

  // var multiplePickedFiles = []; // variable make outside -> for using in uploadImage method

  Future<void> pickImage({required bool singleImage}) async {

    final picker = ImagePicker();

    if(singleImage){
      // single image
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        if (pickedFile.path.toLowerCase().endsWith('.svg')) {
          svgString.value = await File(pickedFile.path).readAsString();
        } else {
          imageFile.value = File(pickedFile.path);
          svgString.value = null;
        }
      }
    }else{
      // multiple images code
      var multiplePickedFiles = await picker.pickMultiImage();
      if(multiplePickedFiles.isNotEmpty){
        pickedImagesForUI.clear();
        pickedSvgImagesForUI.clear();
        for(var file in multiplePickedFiles){
          if(file.path.toLowerCase().endsWith('.svg')){
            pickedSvgImagesForUI.add(await File(file.path).readAsString());
          }else{
            pickedImagesForUI.add(File(file.path));
          }
        }
      }
    }
  }
}
