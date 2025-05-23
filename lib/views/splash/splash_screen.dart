import 'package:airbnb/airbnb_global_imports.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Column(
        children: [
          Center(
            child: CustomImage(
              path: 'assets/icon/airbnb_logo_splash_screen.png',
            ),
          ),
          Text(
            AppString.splashTitle,
            style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}