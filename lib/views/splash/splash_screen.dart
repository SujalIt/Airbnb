import 'package:airbnb/airbnb_global_imports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // Check Auth Fun
  // User Login
  // -> Go to dashboard
  // If User is not login
  // -> Then go to login screen

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Get.offAllNamed(Routes.explore);
    });
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to My App!\nFlutter Native Splash!',
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
