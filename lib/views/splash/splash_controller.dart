import 'package:airbnb/airbnb_global_imports.dart';

class SplashController extends GetxController with StateMixin<List<dynamic>> {
  @override
  void onReady() {
    initFunc();
    super.onReady();
  }

  Future<void> initFunc() async {
    try {
      change(null, status: RxStatus.loading());
      change([], status: RxStatus.success());
      User? user = FirebaseAuth.instance.currentUser;
      final bool isLoggedIn = user != null;
      if (isLoggedIn) {
        var checkRole = await FirebaseFirestore.instance.collection("users").doc(user.uid).get();
        checkRole['role'] == "owner" ? Get.offAllNamed(Routes.owner) : Get.offAllNamed(Routes.master);
      } else {
        Get.offAllNamed(Routes.login);
      }
    } catch (e) {
      Get.offAllNamed(Routes.login);
    }
  }
}
