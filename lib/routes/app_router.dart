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
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUp,
      page: () => FinishSigningUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.master,
      page: () => MasterScreen(),
      bindings: [MasterBinding(),ExploreScreenBinding(), WishlistBinding(), ProfileBinding(),],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.propertyDetail,
      page: () => PropertyDetailScreen(propertyId: Get.parameters['id']!),
      binding: ExploreScreenBinding(),
    ),
    GetPage(
      name: Routes.review,
      page: () => ReviewScreen(),
      binding: ExploreScreenBinding(),
    ),
    GetPage(
      name: Routes.wishDetail,
      page: () => WishDetail(),
      binding: WishlistBinding(),
    ),
    GetPage(
      name: Routes.wishDetailMap,
      page: () => WishDetailMapScreen(),
    ),
    // GetPage(
    //   name: Routes.messageNotification,
    //   page: () => MessageNotificationScreen(),
    // ),
    GetPage(
      name: Routes.personalInformation,
      page: () => PersonalInformationScreen(),
      binding: ProfileBinding(),
    ),
  ];
}