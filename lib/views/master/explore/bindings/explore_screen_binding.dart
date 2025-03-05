import 'package:airbnb/airbnb_global_imports.dart';

class ExploreScreenBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> SwitchButtonController());
    Get.lazyPut(()=>  BottomNavigationController());
    Get.lazyPut(()=> ExploreExpansionTileController());
    Get.lazyPut(()=> ExploreCarouselSliderController());
  }
}