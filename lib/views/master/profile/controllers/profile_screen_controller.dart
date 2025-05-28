import 'package:airbnb/airbnb_global_imports.dart';

class ProfileScreenController extends GetxController {
  var user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    user.bindStream(FirebaseAuth.instance.authStateChanges());
  }
}
