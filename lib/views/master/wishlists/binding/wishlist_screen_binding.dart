import 'package:airbnb/airbnb_global_imports.dart';
import 'package:airbnb/views/master/wishlists/controller/wishlist_screen_controller.dart';

class WishlistScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WishlistScreenController());
  }
}