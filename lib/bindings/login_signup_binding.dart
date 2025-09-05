import 'package:get/get.dart';

import '../controllers/login_signup_phone_controller.dart';

class LoginSignupBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> LoginSignupPhoneController());
  }
}