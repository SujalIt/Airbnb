import 'package:airbnb/airbnb_global_imports.dart';

class OwnerProfileController extends GetxController {
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  var isLoading = false.obs;

  var imageController = Get.find<ImagePickerController>();

  var user = Rxn<User>();
  @override
  void onInit() {
    super.onInit();
    user.bindStream(FirebaseAuth.instance.authStateChanges());
  }
  final GlobalKey<FormState> editFormKey = GlobalKey<FormState>();

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
  Future<void> updateOwnerDetails(XFile? image) async {
    if (editFormKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        String? profileImageUrl;
        if(image != null){
          var profileImageUrlArray = await ImageKitApi.uploadImageToImageKit(singleFile: image);
          profileImageUrl = profileImageUrlArray?[0];
        }

        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update(
          {
            'first_name': fnameController.text,
            'last_name': lnameController.text,
            'dob': selectedDate.value.toString(),
            'email': emailController.text,
            if (profileImageUrl != null) 'profile_image': profileImageUrl,
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
}
