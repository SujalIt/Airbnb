import 'package:airbnb/airbnb_global_imports.dart';

class ProfileController extends GetxController {
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final authFormKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  var user = Rxn<User>();
  @override
  void onInit() {
    super.onInit();
    user.bindStream(FirebaseAuth.instance.authStateChanges());
  }

  // FirebaseAuth.instance.authStateChanges().listen((User? user){
  //
  // });

  Future<dynamic> fetchUserDetails() async {
    try {
      var userId = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      return userId.data();
    } on FirebaseFirestore catch (e) {
      SmartAlert.customSnackBar(
        title: 'Error! $e',
        desc: 'Something went wrong.',
      );
    }
  }

  Stream<dynamic> userDetailsStream() {
    try {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .map((DocumentSnapshot snapshot) {
        return snapshot.data();
      });
    } catch (e) {
      return Stream.error('Something went wrong.');
    }
  }

  Future<void> updateUserDetails() async {
    if (authFormKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update(
          {
            'first_name': fnameController.text,
            'last_name': lnameController.text,
            'dob': selectedDate.value.toString(),
            'email': emailController.text,
          },
        );
        Get.back();
      } on FirebaseFirestore catch (e) {
        SmartAlert.customSnackBar(
          title: 'Error! $e',
          desc: 'Something went wrong.',
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  void updateField(String firstName, String lastName, String email, String dob) {
    fnameController.text = firstName;
    lnameController.text = lastName;
    emailController.text = email;
    selectedDate.value = dob == '' ? null : DateTime.parse(dob);
  }
}
