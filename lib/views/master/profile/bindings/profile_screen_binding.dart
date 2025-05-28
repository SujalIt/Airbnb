import 'package:airbnb/airbnb_global_imports.dart';

class ProfileScreenBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> ProfileScreenController());
  }
}