import 'package:airbnb/airbnb_global_imports.dart';

class PasswordLoginScreen extends GetView<PasswordLoginController> {
  const PasswordLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    String emailFromLoginSignupScreen = Get.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Log in',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: context.screenWidth * 0.05,
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.03,
          ),
          Obx(
            () => TextField(
              controller: passwordController,
              obscureText: !controller.isPasswordVisible.value,
              decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: TextButton(
                    onPressed: controller.togglePasswordVisibility,
                    child: controller.isPasswordVisible.value
                        ? Text("Hide")
                        : Text('Show'),
                  )),
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.05,
          ),
          SizedBox(
            height: context.screenHeight * 0.05,
          ),
          Obx(
            () => controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : CustomButton(
                    onPressed: () {
                      controller.signIn(emailFromLoginSignupScreen, passwordController.text.trim());
                    },
                    text: 'Continue',
                    width: context.screenWidth * 1,
                  ),
          ),
          SizedBox(
            height: context.screenHeight * 0.04,
          ),
          Center(
            child: TextButton(
              onPressed: () {
                controller.resetPassword(emailFromLoginSignupScreen);
              },
               child: Text('Forgotten password',
                 style: TextStyle(
                 decoration: TextDecoration.underline,
               ),),
            ),
          ),
        ]),
      ),
    );
  }
}
