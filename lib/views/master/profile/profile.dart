import 'package:airbnb/airbnb_global_imports.dart';

class ProfileScreen extends GetView<ProfileScreenController> {
   const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25,vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () {
                    return controller.user.value != null
                        ? StreamBuilder(
                            stream: controller.userDetailsStream(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }
                              if (!snapshot.hasData) {
                                return CircularProgressIndicator();
                              }
                              var userData = snapshot.data;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 2,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 65,
                                        height: 65,
                                        child: CircleAvatar(
                                          backgroundColor: AppColor.black,
                                          child: Text(
                                            userData['first_name'][0],
                                            style: TextStyle(
                                              color: AppColor.white,
                                              fontSize:
                                                  context.screenWidth * 0.06,
                                            ),
                                          ),
                                        ),
                                      ),
                                      CustomButton(
                                        type: ButtonTypes.outlined,
                                        onPressed: () {
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
                                        userData['first_name'],
                                        style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        userData['last_name'],
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
                          )
                        : Column(
                            spacing: 50,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Profile',
                                style: TextStyle(
                                  fontSize: context.screenWidth * 0.1,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              CustomButton(
                                onPressed: () {
                                  Get.toNamed(
                                    Routes.login,
                                  );
                                },
                                width: context.screenWidth * 1,
                                text: 'Log in or sign up',
                                textStyle: TextStyle(
                                  fontSize: context.screenWidth * 0.04,
                                ),
                              ),
                            ],
                          );
                  },
                ),
                SizedBox(
                  height: context.screenHeight * 0.01,
                ),
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    Text(
                      'Account Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    ),
                    Obx(
                      () => controller.user.value != null
                          ? Column(
                              children: [
                                CustomListTile(
                                  onTap: () {
                                    Get.toNamed(Routes.personalInfo);
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
                                Divider()
                              ],
                            )
                          : Column(),
                    ),
                  ],
                ),
                CustomListTile(
                  onTap: () {},
                  title: 'Payments and payouts',
                  titleTextStyle: TextStyle(
                    fontSize: 16,
                  ),
                  leadingIcon: Icons.payments_outlined,
                  trailingIcon: Icons.arrow_forward_ios,
                  visualDensity: VisualDensity(vertical: -3),
                  contentPadding: EdgeInsets.all(1),
                ),
                Divider(),
                CustomListTile(
                  onTap: () {},
                  title: 'Translation',
                  titleTextStyle: TextStyle(
                    fontSize: 16,
                  ),
                  leadingIcon: Icons.translate_outlined,
                  trailingIcon: Icons.arrow_forward_ios,
                  visualDensity: VisualDensity(vertical: -3),
                  contentPadding: EdgeInsets.all(1),
                ),
                Divider(),
                CustomListTile(
                  onTap: () {},
                  title: 'Notifications',
                  titleTextStyle: TextStyle(
                    fontSize: 16,
                  ),
                  leadingIcon: Icons.notifications_none_outlined,
                  trailingIcon: Icons.arrow_forward_ios,
                  visualDensity: VisualDensity(vertical: -3),
                  contentPadding: EdgeInsets.all(1),
                ),
                Divider(),
                CustomListTile(
                  onTap: () {},
                  title: 'Privacy and sharing',
                  titleTextStyle: TextStyle(
                    fontSize: 16,
                  ),
                  leadingIcon: Icons.lock_outline_rounded,
                  trailingIcon: Icons.arrow_forward_ios,
                  visualDensity: VisualDensity(vertical: -3),
                  contentPadding: EdgeInsets.all(1),
                ),
                Divider(),
                CustomListTile(
                  onTap: () {},
                  title: 'Travel for work',
                  titleTextStyle: TextStyle(
                    fontSize: 16,
                  ),
                  leadingIcon: Icons.card_travel_outlined,
                  trailingIcon: Icons.arrow_forward_ios,
                  visualDensity: VisualDensity(vertical: -3),
                  contentPadding: EdgeInsets.all(1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
