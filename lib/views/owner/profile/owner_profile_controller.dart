import 'package:airbnb/airbnb_global_imports.dart';

class OwnerProfileController extends GetxController{
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  var user = Rxn<User>();
  @override
  void onInit() {
    super.onInit();
    user.bindStream(FirebaseAuth.instance.authStateChanges());
  }

  final GlobalKey<FormState> authFormKey = GlobalKey<FormState>();

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

  Future<dynamic> fetchOwnerDetails() async {
    try {
      var userId = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      return userId.data();
    } on FirebaseFirestore catch (e) {
      SmartAlert.customSnackBar(
        title: 'Error!',
        desc: 'Something went wrong.',
      );
    }
  }
}