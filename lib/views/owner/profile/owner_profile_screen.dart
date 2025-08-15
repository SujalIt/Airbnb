import 'package:airbnb/airbnb_global_imports.dart';
import 'package:intl/intl.dart';

class OwnerProfileScreen extends GetView<OwnerProfileController> {
  const OwnerProfileScreen({super.key});

  void editPersonalInfo(BuildContext context, String? imageUrlFromDatabaseForUI) {
    controller.imageController.imageFile.value = null;
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColor.white,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
        child: SingleChildScrollView(
          child: Form(
            key: controller.editFormKey,
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
                // image
                Obx(()=> ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: controller.imageController.imageFile.value != null
                      ? CustomImage(
                          fit: BoxFit.cover,
                          height: 80,
                          width: 80,
                          path: controller.imageController.imageFile.value!.path,
                        )
                      : imageUrlFromDatabaseForUI == null
                        ? CustomImage(
                            path: 'assets/images/profile_placeholder.png',
                            fit: BoxFit.cover,
                            height: 80,
                            width: 80,
                          )
                        : CustomImage(
                          fit: BoxFit.cover,
                          height: 80,
                          width: 80,
                          path: imageUrlFromDatabaseForUI,
                        ),
                ),
                ),
                InkWell(
                  onTap: ()=> controller.imageController.pickImage(singleImage: true),
                  child: Text(
                    "edit photo",
                    style: TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                // first name
                CustomTextFormField(
                  controller: controller.fnameController,
                  hintText: "Enter first name",
                  validatorText: 'Please enter first name',
                ),
                // last name
                CustomTextFormField(
                  controller: controller.lnameController,
                  hintText: "Enter last name",
                  validatorText: 'Please enter last name',
                ),
                // date of birth
                Obx(() => TextFormField(
                    readOnly: true,
                    controller: TextEditingController(
                      text: controller.selectedDate.value != null
                          ? DateFormat("dd/MM/yyyy").format(controller.selectedDate.value!)
                          : "",
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
                // email
                CustomTextFormField(
                  readOnly: true,
                  controller: controller.emailController,
                ),
                Obx(() => CustomButton(
                    type: ButtonTypes.elevated,
                    isLoading: controller.isLoading.value,
                    onPressed: (){
                      if(controller.imageController.imageFile.value != null){
                        controller.updateOwnerDetails(XFile(controller.imageController.imageFile.value!.path,));
                      }else{
                        controller.updateOwnerDetails(null);
                      }
                    },
                    text: 'Save',
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                    width: Get.width,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: StreamBuilder<dynamic>(
          stream: controller.ownerDetailsStream(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              controller.fnameController.text = snapshot.data['first_name'];
              controller.lnameController.text = snapshot.data['last_name'];
              controller.emailController.text = snapshot.data['email'];
              controller.selectedDate.value = DateTime.parse(snapshot.data['dob']);
              return Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 2,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: snapshot.data['profile_image'] == null
                                ? CustomImage(
                                    path: 'assets/images/profile_placeholder.png',
                                    fit: BoxFit.cover,
                                    height: 80,
                                    width: 80,
                                  )
                                : CustomImage(
                                    fit: BoxFit.cover,
                                    height: 80,
                                    width: 80,
                                    path: snapshot.data['profile_image'],
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
                      ),
                      Text(
                        '${snapshot.data['first_name']} ${snapshot.data['last_name']}',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Text(
                    'Account Settings',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                  CustomListTile(
                    onTap: (){
                      editPersonalInfo(context,snapshot.data['profile_image']); //image will be null when there is no field in firebase
                    },
                    title: 'Personal information',
                    titleTextStyle: TextStyle(
                      fontSize: 16,
                    ),
                    leadingIcon: Icons.account_circle_outlined,
                    trailingIcon: Icons.arrow_forward_ios,
                    visualDensity: VisualDensity(vertical: -3),
                    contentPadding: EdgeInsets.all(1),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Center(child: Text('Error: ${snapshot.error}')),
              );
            } else {
              return Padding(
                padding: EdgeInsets.only(top: 16),
                child: Center(child: Text('Awaiting result...')),
              );
            }
          },
        ),
      ),
    );
  }
}
