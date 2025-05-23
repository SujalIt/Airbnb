import 'package:airbnb/airbnb_global_imports.dart';

class PhoneEmailController extends GetxController {
  var isEmailSelected = false.obs;

  void toggleField(bool isEmail) {
    isEmailSelected.value = isEmail;
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        forceCodeForRefreshToken: true,
        clientId: '9954417221-qqctn3l8mlrtu3lorj8mdd4ikb58qap6.apps.googleusercontent.com',
      );
      googleSignIn.disconnect();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(
        GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        ),
      );
      Get.snackbar('Successfully signed in!', 'Now you are logged in.',snackPosition: SnackPosition.BOTTOM);
      Get.offNamed('/profile');
    } catch (e) {
      print('Error....$e');
    }
  }
}
