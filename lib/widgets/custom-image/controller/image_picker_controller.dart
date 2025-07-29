import 'package:airbnb/airbnb_global_imports.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class ImagePickerController extends GetxController {
  var imageFile = Rx<File?>(null);
  var imageBytes = Rx<Uint8List?>(null);
  var svgString = Rx<String?>(null);

  // for multiple images
  // var multipleImages = [].obs;
  // var svgStrings = [].obs;
  //

  Future<void> pickImage() async {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      // multiple images code
      // final multiplePickedFiles = await picker.pickMultiImage();
      //
      // if(multiplePickedFiles != null && multiplePickedFiles.isNotEmpty){
      //   multipleImages.clear();
      //   svgStrings.clear();
      //   for(var file in multiplePickedFiles){
      //     if(file.path.toLowerCase().endsWith('.svg')){
      //       svgStrings.add(await File(file.path).readAsString());
      //     }else{
      //       multipleImages.add(File(file.path));
      //     }
      //   }
      // }

      //

      // mobile
      if (pickedFile != null) {
        if (pickedFile.path.toLowerCase().endsWith('.svg')) {
          svgString.value = await File(pickedFile.path).readAsString();
        } else {
          imageFile.value = File(pickedFile.path);
          svgString.value = null;
        }
      }
    } else {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['svg', 'jpg', 'jpeg', 'png'],
      );

      // web
      if (result != null) {
        if (kIsWeb) {
          if (result.files.single.extension == 'svg') {
            svgString.value = utf8.decode(result.files.single.bytes!);
          } else {
            imageBytes.value = result.files.single.bytes;
            svgString.value = null;
          }
        } else {
          if (result.files.single.extension == 'svg') {
            svgString.value =
                await File(result.files.single.path ?? '').readAsString();
          } else {
            imageFile.value = File(result.files.single.path ?? '');
            svgString.value = null;
          }
        }
      }
    }
  }
}
