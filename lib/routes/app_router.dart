import 'package:airbnb/airbnb_global_imports.dart';


class AppRouter {
  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginSignupScreen(),
      binding: LoginSignupBinding(),
    ),
    GetPage(
      name: Routes.signUp,
      page: () => FinishSigningUpScreen(),
      binding: LoginSignupBinding(),
    ),
    GetPage(
      name: Routes.forgotPass,
      page: () => ForgotPasswordScreen(),
      binding: LoginSignupBinding(),
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
    GetPage(
      name: Routes.personalInfo,
      page: () => PersonalInformationScreen(),
      binding: ProfileScreenBinding(),
    )
  ];
}