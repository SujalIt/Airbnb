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
      name: Routes.auth,
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
      name: Routes.otpScreen,
      page: () => ConfirmYourNumberOtpScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.passwordScreen,
      page: () => PasswordLoginScreen(),
      binding: LoginSignupBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.explore,
      page: () => ExploreMainScreen(),
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
      page: () => ExploreMainScreen(),
      bindings: [ExploreScreenBinding()],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.trips,
      page: () => ExploreMainScreen(),
      bindings: [ExploreScreenBinding(),],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.messages,
      page: () => ExploreMainScreen(),
      bindings: [ExploreScreenBinding(),],
      transition: Transition.noTransition,
    ),
    // GetPage(
    //   name: Routes.messageNotification,
    //   page: () => MessageNotificationScreen(),
    // ),
    GetPage(
      name: Routes.profile,
      page: () => ExploreMainScreen(),
      bindings: [ExploreScreenBinding(),ProfileScreenBinding()],
      transition: Transition.noTransition,
    ),
  ];
}