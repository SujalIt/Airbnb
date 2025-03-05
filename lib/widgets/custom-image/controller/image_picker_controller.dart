import 'package:airbnb/airbnb_global_imports.dart';
import 'dart:io';

class ImagePickerController extends GetxController {
  var imageFile = Rx<File?>(null);
  var imageBytes = Rx<Uint8List?>(null);
  var svgString = Rx<String?>(null);

  Future<void> pickImage() async {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

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
