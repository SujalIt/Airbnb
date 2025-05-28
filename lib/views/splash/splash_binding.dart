import 'package:airbnb/airbnb_global_imports.dart';

class SplashBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>  SplashController());
  }
}