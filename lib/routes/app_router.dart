import 'package:airbnb/airbnb_global_imports.dart';

class AppRouter {
  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
      transition: Transition.rightToLeft,
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginSignupScreen(),
      binding: LoginSignupBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.signUp,
      page: () => FinishSigningUpScreen(),
      binding: LoginSignupBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.forgotPass,
      page: () => ForgotPasswordScreen(),
      binding: LoginSignupBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.explore,
      page: () => MasterScreen(),
      bindings: [ExploreScreenBinding()],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.particularScreen,
      page: () => ParticularHome(
      ),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.wishlists,
      page: () => MasterScreen(),
      bindings: [ExploreScreenBinding()],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.trips,
      page: () => MasterScreen(),
      bindings: [ExploreScreenBinding(),],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.messages,
      page: () => MasterScreen(),
      bindings: [ExploreScreenBinding(),],
      transition: Transition.noTransition,
    ),
    // GetPage(
    //   name: Routes.messageNotification,
    //   page: () => MessageNotificationScreen(),
    // ),
    GetPage(
      name: Routes.profile,
      page: () => MasterScreen(),
      bindings: [ExploreScreenBinding(),ProfileScreenBinding()],
      transition: Transition.noTransition,
    ),
  ];
}