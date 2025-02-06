import 'package:get/get.dart';

import '../controllers/explore_carousel_slider_controller.dart';
import '../controllers/explore_expansion_tile_controller.dart';
import '../controllers/explore_switch_controller.dart';

class SwitchBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> SwitchButton());
    Get.lazyPut(()=>  BottomNavigation());
    Get.lazyPut(()=> ExploreExpansionTileController());
    Get.lazyPut(()=> ExploreCarouselSliderController());
  }
}