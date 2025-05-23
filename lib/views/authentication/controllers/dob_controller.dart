import 'package:airbnb/airbnb_global_imports.dart';

class DOBController extends GetxController {
  var selectedDate = Rxn<DateTime>();
  var isLoading = false.obs;

  Future<void> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      selectedDate.value = pickedDate;
    }
  }
  Future<void> signUp(String getEmail,String getPassword) async{

    if (getPassword.length < 6) {
      Get.snackbar("Error", "Password must be at least 6 characters", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      isLoading.value ==true;
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: getEmail,
        password: getPassword,
      );
      isLoading.value = false;
      Get.offNamed('/profile');
    } on FirebaseAuthException catch (e){
      Get.snackbar('Email & Password', e.message ?? 'Enter all details',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
