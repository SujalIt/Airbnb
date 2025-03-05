import 'package:airbnb/airbnb_global_imports.dart';
import 'package:airbnb/views/master/wishlists/bindings/wishlists_screen_binding.dart';

class AppRouter {
  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.auth,
      page: () => LoginSignupScreen(),
      binding: LoginSignupBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.explore,
      page: () => ExploreMainScreen(),
      binding: ExploreScreenBinding(),
    ),
    GetPage(
        name: Routes.wishlists,
        page: () => ExploreMainScreen(),
        bindings: [ExploreScreenBinding()],
    ),
    GetPage(
      name: Routes.trips,
      page: () => ExploreMainScreen(),
      bindings: [ExploreScreenBinding(),],
    ),
    GetPage(
      name: Routes.messages,
      page: () => ExploreMainScreen(),
      bindings: [ExploreScreenBinding(),],
    ),
    GetPage(
      name: Routes.profile,
      page: () => ExploreMainScreen(),
      bindings: [ExploreScreenBinding(),],
    ),
  ];
}
