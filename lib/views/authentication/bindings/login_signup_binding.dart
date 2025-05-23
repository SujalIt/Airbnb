import 'package:airbnb/airbnb_global_imports.dart';

class LoginSignupBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> PhoneController());
    Get.lazyPut(()=> PhoneEmailController());
    Get.lazyPut(()=> PasswordLoginController());
    Get.lazyPut(()=> DOBController());
  }
}