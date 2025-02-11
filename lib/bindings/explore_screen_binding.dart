import 'package:get/get.dart';

import '../controllers/explore_controllers/explore_carousel_slider_controller.dart';
import '../controllers/explore_controllers/explore_expansion_tile_controller.dart';
import '../controllers/explore_controllers/explore_switch_controller.dart';

class ExploreScreenBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> SwitchButtonController());
    Get.lazyPut(()=>  BottomNavigationController());
    Get.lazyPut(()=> ExploreExpansionTileController());
    Get.lazyPut(()=> ExploreCarouselSliderController());
  }
}