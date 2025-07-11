import 'package:airbnb/airbnb_global_imports.dart';
import 'package:flutter/foundation.dart';

class AuthController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final authFormKeySignup = GlobalKey<FormState>();
  final authFormKeyLogin = GlobalKey<FormState>();
  final authFormKeyForgotPass = GlobalKey<FormState>();
  var isLoading = false.obs;
  var isLoadingGoogleSignin = false.obs;

  // Password for login
  var isPasswordVisible = false.obs;
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Date Of Birth
  var selectedDate = Rxn<DateTime>();
  Future<void> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      if ((DateTime.now().year - pickedDate.year) >= 18) {
        selectedDate.value = pickedDate;
      } else {
        SmartAlert.customSnackBar(
          title: 'Sorry',
          desc: 'You are not eligible ... you must be 18 year old.',
        );
      }
    }
  }

  Future<void> signUp() async {
    if (authFormKeySignup.currentState!.validate()) {
      try {
        isLoading.value = true;
        final res = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        if (res.user != null) {
          try {
            await FirebaseFirestore.instance
                .collection("users")
                .doc(res.user?.uid)
                .set({
              "first_name": fnameController.text,
              "last_name": lnameController.text,
              "dob": selectedDate.value.toString(),
              "email": emailController.text,
              "password": passwordController.text,
            });
            SmartAlert.customSnackBar(
              title: 'Success',
              desc: 'Now you are ready to start your journey',
            );
            Get.offAllNamed(Routes.master);
          } on FirebaseException catch (e) {
            res.user!.delete();
            FirebaseFirestore.instance
                .collection("users")
                .doc(res.user?.uid)
                .delete();
            SmartAlert.customSnackBar(
              title: 'Error!',
              desc: 'Something went wrong.',
            );
          }
        }
      } on FirebaseAuthException catch (e) {
        SmartAlert.customSnackBar(
          title: 'Error!',
          desc: 'Something went wrong.',
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      isLoadingGoogleSignin.value = true;
      UserCredential userCredential;
      if (kIsWeb) {
        GoogleAuthProvider authProvider = GoogleAuthProvider();
        userCredential = await FirebaseAuth.instance.signInWithPopup(authProvider);
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if (googleUser == null) return;
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      }
      final user = userCredential.user;
      if (user != null) {
        try {
          await FirebaseFirestore.instance
              .collection("users")
              .doc(user.uid)
              .set({
            "first_name": user.displayName,
            "last_name": "",
            "dob": "",
            "email": user.email,
            "password": "",
          });
          SmartAlert.customSnackBar(
            title: 'Successfully signed in!',
            desc: 'Now you are ready to start your journey.',
          );
          Get.offAllNamed(Routes.master);
        } on FirebaseException catch (e) {
          user.delete();
          FirebaseFirestore.instance.collection("users").doc(user.uid).delete();
          SmartAlert.customSnackBar(
            title: "Sign-in failed!",
            desc: "Something went wrong.",
          );
        }
      }
    } on FirebaseException catch (e) {
      SmartAlert.customSnackBar(
        title: 'Sign-in failed!',
        desc: 'Something went wrong.',
      );
    } finally {
      isLoadingGoogleSignin.value = false;
    }
  }

  Future<void> signIn() async {
    if (authFormKeyLogin.currentState!.validate()) {
      try {
        isLoading.value = true;
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        SmartAlert.customSnackBar(
          title: 'Successfully signed in!',
          desc: 'Now you are ready to start your journey.',
        );

        var checkRole = await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
        checkRole['role'] == "owner" ? Get.offAllNamed(Routes.owner) : Get.offAllNamed(Routes.master);
      } on FirebaseAuthException catch (e) {
        SmartAlert.customSnackBar(
          title: 'Invalid username or password!',
          desc: "Something went wrong.",
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> resetPassword() async {
    if (authFormKeyForgotPass.currentState!.validate()) {
      try {
        isLoading.value = true;
        await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
        SmartAlert.customSnackBar(
          title: "Success",
          desc: "Password reset link sent to your email.",
        );
        Get.offNamed(Routes.login);
      } on FirebaseAuthException catch (e) {
        SmartAlert.customSnackBar(
          title: 'Error!',
          desc: 'Something went wrong.',
        );
      } finally {
        isLoading.value = false;
      }
    }
  }
}
