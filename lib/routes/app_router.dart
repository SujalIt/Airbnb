import 'package:airbnb/routes/route_name.dart';
import 'package:get/get.dart';

import '../bindings/explore_screen_binding.dart';
import '../views/explore_main_screen.dart';
import '../views/splash_screen.dart';

class AppRouter{
   static final initialRoute = Routes.splashScreen;
   static final appPages = routes;

   static final routes = [
      GetPage(name: Routes.splashScreen, page: () => SplashScreen()),
      GetPage(name: Routes.explore, page: () => ExploreMainScreen(),binding: ExploreScreenBinding()),
   ];
}