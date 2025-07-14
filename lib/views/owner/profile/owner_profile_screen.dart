import 'package:airbnb/airbnb_global_imports.dart';

class OwnerProfileScreen extends GetView<OwnerProfileController> {
  const OwnerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: FutureBuilder<dynamic>(
          future: controller.fetchOwnerDetails(),
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
                  StreamBuilder(
                    stream: controller.ownerDetailsStream(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 2,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 65,
                                height: 65,
                                child: CircleAvatar(
                                  backgroundColor: AppColor.black,
                                  child: Text(
                                    snapshot.data['first_name'][0],
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: context.screenWidth * 0.06,
                                    ),
                                  ),
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
                          Row(
                            spacing: 9,
                            children: [
                              Text(
                                snapshot.data['first_name'],
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                snapshot.data['last_name'],
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
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
                      controller.editPersonalInfo(context);
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
