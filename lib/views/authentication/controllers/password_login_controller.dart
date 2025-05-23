import 'package:airbnb/airbnb_global_imports.dart';

class PasswordLoginController extends GetxController {
  var isPasswordVisible = false.obs;
  var isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // password.text.trim
  Future<void> signIn(String getEmail, String getPassword) async {
    if (getPassword.length < 6) {
      Get.snackbar("Error", "Password must be at least 6 characters", snackPosition: SnackPosition.BOTTOM);
      return;
    }
    try {
      isLoading.value = true;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: getEmail,
        password: getPassword,
      );
      isLoading.value = false;
      Get.offNamed('/profile');
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Invalid email or password!',
        e.message ?? "Something went wrong",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> resetPassword(String getEmail) async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: getEmail);
      print(getEmail);
      SnackBar(
        content: Text('Password reset link sent to your email.'),
      );
    } on FirebaseAuthException catch(e){
      SnackBar(
        content: Text(e.message ?? 'Something wrong.'),
      );
    }
  }
}
