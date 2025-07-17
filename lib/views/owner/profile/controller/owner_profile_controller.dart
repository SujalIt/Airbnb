import 'package:airbnb/airbnb_global_imports.dart';
import 'package:intl/intl.dart';

class OwnerProfileController extends GetxController {
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  var isLoading = false.obs;

  var user = Rxn<User>();
  @override
  void onInit() {
    super.onInit();
    user.bindStream(FirebaseAuth.instance.authStateChanges());
  }
  final GlobalKey<FormState> editFormKey = GlobalKey<FormState>();

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

  // for edit form
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

  // to show latest data
  Stream<dynamic> ownerDetailsStream() {
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

  // update details method
  Future<void> updateOwnerDetails() async {
    if (editFormKey.currentState!.validate()) {
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
          title: 'Error!',
          desc: 'Something went wrong.',
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  void editPersonalInfo(BuildContext context) {
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColor.white,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
          child: SingleChildScrollView(
            child: Form(
              key: editFormKey,
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Personal Info",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("(You can edit)",),
                    ],
                  ),
                  // first name
                  TextFormField(
                    controller: fnameController,
                    decoration: InputDecoration(
                      hint: Text("Enter first name"),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    },
                  ),
                  // last name
                  TextFormField(
                    controller: lnameController,
                    decoration: InputDecoration(
                      hint: Text("Enter last name"),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter last name';
                      }
                      return null;
                    },
                  ),
                  // date of birth
                  Obx(
                    () => TextFormField(
                      readOnly: true,
                      controller: TextEditingController(
                        text: selectedDate.value != null
                            ? DateFormat("dd/MM/yyyy").format(selectedDate.value!)
                            : "",
                      ),
                      decoration: InputDecoration(
                        hintText: 'Please Enter Your DOB',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.calendar_today,
                          ),
                          onPressed: () => pickDate(context),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Select Your date of birth!';
                        }
                        return null;
                      },
                    ),
                  ),
                  // email
                  TextFormField(
                    readOnly: true,
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Obx(
                    () => CustomButton(
                      type: ButtonTypes.elevated,
                      isLoading: isLoading.value,
                      onPressed: updateOwnerDetails,
                      text: 'Save',
                      textStyle: TextStyle(
                        fontSize: 20,
                      ),
                      width: Get.width,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
