import 'package:get/get.dart';

class LoginSignupPhoneController extends GetxController{
  var selectedCountryCode = '+91'.obs;

  void updateCountryCode(String code){
    selectedCountryCode.value = code;
  }
}