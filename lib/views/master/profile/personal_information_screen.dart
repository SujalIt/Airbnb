import 'package:airbnb/airbnb_global_imports.dart';
import 'package:intl/intl.dart';

class PersonalInformationScreen extends GetView<ProfileScreenController> {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text(
          'Profile Info',
        ),
        leading: IconButton(
          onPressed: () {
            Get.offNamed(Routes.profile);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: FutureBuilder<dynamic>(
          future: controller.fetchUserDetails(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: ProfileBody(
                  firstName: snapshot.data['first_name'],
                  lastName: snapshot.data['last_name'],
                  email: snapshot.data['email'],
                  dob: snapshot.data['dob'],
                ),
              );
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
    );
  }
}

class ProfileBody extends StatefulWidget {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? dob;
  const ProfileBody({super.key, this.firstName, this.lastName, this.email, this.dob});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  final ProfileScreenController controller = Get.find<ProfileScreenController>();
  @override
  void initState() {
    super.initState();
    Get.find<ProfileScreenController>().updateField(
      widget.firstName.toString(),
      widget.lastName.toString(),
      widget.email.toString(),
      widget.dob.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.authFormKey,
      child: Column(
        spacing: 20,
        children: [
          TextFormField(
            controller: controller.fnameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          TextFormField(
            controller: controller.lnameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          Obx(
            () => TextFormField(
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
          Obx(() =>
            CustomButton(
              isLoading: controller.isLoading.value,
              onPressed: controller.updateUserDetails,
              text: 'Save',
              textStyle: TextStyle(
                fontSize: 20,
              ),
              width: Get.width,
            ),
          )
        ],
      ),
    );
  }
}
