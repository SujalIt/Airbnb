import 'package:airbnb/airbnb_global_imports.dart';

// import '../../profile/controllers/profile_screen_controller.dart';

class ExploreScreenBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>  BottomNavigationController());
    Get.lazyPut(()=> ExploreExpansionTileController());
    Get.lazyPut(()=> ExploreCarouselSliderController());

    // Get.lazyPut(()=> ProfileScreenController());
  }
}