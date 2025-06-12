import 'package:airbnb/airbnb_global_imports.dart';

class SplashController extends GetxController with StateMixin<List<dynamic>> {
  @override
  void onReady() {
    initFunc();
    super.onReady();
  }

  void initFunc() {
    try {
      change(null, status: RxStatus.loading());
      change([], status: RxStatus.success());
      User? user = FirebaseAuth.instance.currentUser;
      final bool isLoggedIn = user != null;
      if (isLoggedIn) {
        Get.offAllNamed(Routes.explore);
      } else {
        Get.offAllNamed(Routes.login);
      }
    } catch (e) {
      Get.offAllNamed(Routes.login);
    }
  }
}
