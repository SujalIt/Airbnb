import 'package:airbnb/airbnb_global_imports.dart';

class ProfileBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> ProfileController());
  }
}
