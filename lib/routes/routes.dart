import 'package:airbnb/views/splash_screen.dart';
import 'package:get/get.dart';

import '../bindings/explore_screen_binding.dart';
import '../views/explore/start_your_search.dart';
import '../views/explore_main_screen.dart';

class Routes{
  static const splashScreen = '/splash';
  static const explore = '/explore';
  // sample
  static const wishlists = '/wishlists';

  static final routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: explore, page: () => ExploreMainScreen(),binding: SwitchBinding()),
    // sample
    GetPage(name: wishlists, page: ()=> StartYourSearch(),binding: SwitchBinding())
  ];
}