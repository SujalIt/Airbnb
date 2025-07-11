import 'package:airbnb/airbnb_global_imports.dart';
import 'package:intl/intl.dart';

class OwnerProfileScreen extends GetView<OwnerProfileController> {
  const OwnerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Form(
          key: controller.authFormKey,
          child: FutureBuilder<dynamic>(
            future: controller.fetchOwnerDetails(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  spacing: 15,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personal Info",
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      controller: controller.fnameController,
                      decoration: InputDecoration(
                        hint: Text("Enter fname"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                      controller: controller.fnameController,
                      decoration: InputDecoration(
                        hint: Text("Enter lname"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Obx(() => TextFormField(
                      readOnly: true,
                      controller: TextEditingController(
                        text: controller.selectedDate.value != null ? DateFormat("dd/MM/yyyy").format(controller.selectedDate.value!) : "",
                      ),
                      decoration: InputDecoration(
                        hintText: 'Please Enter Your DOB',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.calendar_today,
                          ),
                          onPressed: () => controller.pickDate(context),
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
                    TextFormField(
                      readOnly: true,
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    CustomButton(
                      type: ButtonTypes.outlined,
                      onPressed: () {
                        Get.offAllNamed(Routes.master);
                        GoogleSignIn().signOut();
                        FirebaseAuth.instance.signOut();
                      },
                      outlineButtonStyle:
                      OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: AppColor.pink,
                          style: BorderStyle.solid,
                        ),
                      ),
                      text: "Logout",
                      textStyle: TextStyle(
                        color: AppColor.pink,
                      ),
                    ),
                  ],
                );
                //   SingleChildScrollView(
                //   child: ProfileBody(
                //     firstName: snapshot.data['first_name'],
                //     lastName: snapshot.data['last_name'],
                //     email: snapshot.data['email'],
                //     dob: snapshot.data['dob'],
                //   ),
                // );
              } else if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Center(child: Text('Error: ${snapshot.error}')),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
