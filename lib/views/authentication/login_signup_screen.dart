import 'package:airbnb/airbnb_global_imports.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  late TextEditingController phoneTextController;
  late TextEditingController emailTextController;

  late final PhoneController phoneController;
  late final PhoneEmailController phoneEmailController;

  @override
  void initState() {
    super.initState();
    phoneTextController = TextEditingController();
    emailTextController = TextEditingController();
    phoneController = Get.find();
    phoneEmailController = Get.find();
  }

  @override
  void dispose() {
    super.dispose();
    emailTextController.dispose();
    phoneTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.04),
          child: IconButton(
              onPressed: () {
                Get.offNamed('/profile');
              },
              icon: Icon(
                Icons.cancel_outlined,
                size: context.screenWidth * 0.069,
              )),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Log in or sign up to Airbnb',
                style: TextStyle(
                    fontSize: context.screenWidth * 0.06,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: Colors.blueGrey.shade700,
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Obx(
                        () => phoneEmailController.isEmailSelected.value
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Country/Region',
                                    style: TextStyle(
                                        fontSize: context.screenWidth * 0.032,
                                        color: Colors.blueGrey),
                                  ),
                                  IntlPhoneField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    keyboardType: TextInputType.none,
                                    initialCountryCode: 'IN',
                                    showCursor: false,
                                    disableLengthCheck: true,
                                    onCountryChanged: (country) {
                                      phoneController.updateCountryCode(
                                          '+${country.dialCode}');
                                    },
                                  ),
                                  Divider(),
                                  Text(
                                    'Phone number',
                                    style: TextStyle(
                                        fontSize: context.screenWidth * 0.032,
                                        color: Colors.blueGrey),
                                  ),
                                  Obx(
                                    () => TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixText: phoneController
                                            .selectedCountryCode.value,
                                      ),
                                      style: TextStyle(
                                          fontSize: context.screenWidth * 0.04),
                                      controller: phoneTextController,
                                      keyboardType: TextInputType.phone,
                                      maxLength: 10,
                                    ),
                                  ),
                                ],
                              )
                            : TextField(
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  border: InputBorder.none,
                                ),
                                controller: emailTextController,
                                keyboardType: TextInputType.emailAddress,
                              ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.01,
              ),
              Text(
                'We\'ll call or text you to confirm your number. Standard message and data rates apply.',
                style: TextStyle(color: Colors.blueGrey),
              ),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),
              CustomButton(
                onPressed: () {
                  if (emailTextController.text.trim().isEmpty) {
                    Get.snackbar(
                      'Error',
                      'Please enter email!',
                    );
                  }
                  FirebaseAuth.instance
                      .authStateChanges()
                      .first
                      .then((User? user) {
                    if (user == null) {
                      Get.toNamed(
                        '/auth/signUp',
                        arguments: emailTextController.text.trim(),
                      );
                    } else {
                      Get.toNamed(
                        '/auth/passwordScreen',
                        arguments: emailTextController.text.trim(),
                      );
                    }
                  });
                },
                width: context.screenWidth * 1,
                text: 'Continue',
                textStyle: TextStyle(
                  fontSize: context.screenWidth * 0.04,
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.012,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'or',
                    style: TextStyle(
                      fontSize: context.screenWidth * 0.04,
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  )),
                ],
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              CustomButton(
                onPressed: () {
                  phoneEmailController.isEmailSelected.value
                      ? phoneEmailController.toggleField(false)
                      : phoneEmailController.toggleField(true);
                },
                type: ButtonTypes.outlined,
                leadingIcon: Icons.email,
                text: "Continue with Phone",
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              CustomButton(
                onPressed: () {},
                type: ButtonTypes.outlined,
                leadingIcon: Icons.facebook_outlined,
                text: "Continue with Facebook",
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              CustomButton(
                onPressed: () {
                  phoneEmailController.signInWithGoogle();
                },
                type: ButtonTypes.outlined,
                leadingIcon: Icons.g_mobiledata_outlined,
                text: "Continue with Google",
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              CustomButton(
                onPressed: () {},
                type: ButtonTypes.outlined,
                leadingIcon: Icons.apple_outlined,
                text: "Continue with Apple",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
