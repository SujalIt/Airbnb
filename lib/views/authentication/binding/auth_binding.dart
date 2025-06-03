import 'package:airbnb/airbnb_global_imports.dart';

class LoginSignupBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> AuthController());
  }
}