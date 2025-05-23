import 'package:airbnb/airbnb_global_imports.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    if (FirebaseAuth.instance.currentUser == null) {
      Get.offNamed(Routes.auth);
    } else {
      Get.offNamed(Routes.explore);
    }
  }
}
