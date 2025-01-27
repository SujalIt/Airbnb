import 'package:airbnb/views/splash_screen.dart';
import 'package:get/get.dart';

import '../views/home_screen.dart';

class Routes{
  static const splashScreen = '/splash';
  static const home = '/home';

  static final routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: home, page: () => HomeScreen()),
  ];
}