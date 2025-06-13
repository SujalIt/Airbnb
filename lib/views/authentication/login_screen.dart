import 'package:airbnb/airbnb_global_imports.dart';

class LoginSignupScreen extends GetView<AuthController> {
  const LoginSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: IconButton(
          onPressed: () {
            Get.offNamed(Routes.profile);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Form(
        key: controller.authFormKeyLogin,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                Text(
                  'Welcome back to Airbnb!',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
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
                      Get.toNamed(Routes.forgotPassword);
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
                      fontSize: 16,
                    ),
                  );
                }),
                Row(
                  spacing: 6,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: AppColor.grey,
                      ),
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: AppColor.grey,
                      ),
                    ),
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
