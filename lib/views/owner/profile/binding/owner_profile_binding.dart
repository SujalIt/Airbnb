import 'package:airbnb/airbnb_global_imports.dart';

class OwnerProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> OwnerProfileController());
    Get.lazyPut(()=> ImagePickerController());
  }
}