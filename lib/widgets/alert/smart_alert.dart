import 'package:airbnb/airbnb_global_imports.dart';

class SmartAlert {
  static void customSnackBar({required String title, required String desc}) {
    Get.snackbar(
      title,
      desc,
      borderRadius: 0.0,
      backgroundColor: AppColor.pink,
      colorText: AppColor.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
