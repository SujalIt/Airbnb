import 'package:airbnb/airbnb_global_imports.dart';

class WishlistBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WishlistController(),fenix: true);
  }
}