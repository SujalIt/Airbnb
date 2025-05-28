import 'package:airbnb/airbnb_global_imports.dart';

class PhoneController extends GetxController{
  var selectedCountryCode = '+91'.obs;

  void updateCountryCode(String code){
    selectedCountryCode.value = code;
  }
}