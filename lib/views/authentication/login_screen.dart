import 'package:airbnb/airbnb_global_imports.dart';

class LoginSignupScreen extends GetView<AuthController> {
  const LoginSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        leading: IconButton(
            onPressed: () {
              Get.offNamed('/profile');
            },
            icon: Icon(
              Icons.arrow_back,
              size: context.screenWidth * 0.069,
            )),
      ),
      body: Form(
        key: controller.authFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                Text(
                  'Welcome back to Airbnb!',
                  style: TextStyle(
                      fontSize: context.screenWidth * 0.06,
                      fontWeight: FontWeight.w500),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your email',
                  ),
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email!';
                    }
                    return null;
                  },
                ),
                Obx(
                  () => TextFormField(
                    controller: controller.passwordController,
                    obscureText: !controller.isPasswordVisible.value,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: controller.togglePasswordVisibility,
                        icon: controller.isPasswordVisible.value
                            ? Icon(Icons.visibility_off_sharp)
                            : Icon(Icons.visibility),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password!';
                      }
                      return null;
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.offNamed(Routes.forgotPass);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: AppColor.blue,
                      ),
                    ),
                  ),
                ),
                Obx(() {
                  return CustomButton(
                    isLoading: controller.isLoading.value,
                    onPressed: controller.signIn,
                    width: Get.width,
                    text: 'Continue',
                    textStyle: TextStyle(
                      fontSize: context.screenWidth * 0.04,
                    ),
                  );
                }),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: context.screenWidth * 0.02,
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                        fontSize: context.screenWidth * 0.05,
                      ),
                    ),
                    SizedBox(
                      width: context.screenWidth * 0.02,
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    )),
                  ],
                ),
                Obx(() {
                  return GestureDetector(
                    onTap: controller.signInWithGoogle,
                    child: Container(
                      width: Get.width,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: controller.isLoadingGoogleSignin.value
                          ? Center(
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 10,
                              children: [
                                CustomImage(
                                  path: AppImages.google,
                                  height: 15,
                                  width: 15,
                                ),
                                Text("Sign in with Google"),
                              ],
                            ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 25),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              fontSize: 15.0,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            children: [
              TextSpan(text: "Don't have an account? "),
              TextSpan(
                text: 'Register Now',
                style: TextStyle(
                  color: AppColor.blue,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.offNamed(Routes.signUp);
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
