import 'package:airbnb/airbnb_global_imports.dart';
import 'package:intl/intl.dart';

class FinishSigningUpScreen extends GetView<AuthController> {
  const FinishSigningUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: IconButton(
          onPressed: () {
            Get.offNamed(Routes.login);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Form(
            key: controller.authFormKeySignup,
            child: Column(
              spacing: 18,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello! Register to get started',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10.0,
                  children: [
                    CustomTextFormField(
                      controller: controller.fnameController,
                      hintText: 'First name on ID',
                      validatorText: 'Please enter your first name!',
                    ),
                    CustomTextFormField(
                      controller: controller.lnameController,
                      hintText: 'Surname on ID',
                      validatorText: 'Please enter your surname!',
                    ),
                    Obx(() {
                      return CustomTextFormField(
                        readOnly: true,
                        controller: TextEditingController(
                          text: selectedDate.value == null
                              ? ''
                              : DateFormat("dd/MM/yyyy").format(selectedDate.value!),
                          ),
                          hintText: "Date of Birth",
                          suffixIcon: CustomButton(
                            type: ButtonTypes.icon,
                            icon: Icon(Icons.calendar_today),
                            onPressed: () => pickDate(context),
                          ),
                        validatorText: 'Please Select Your date of birth!',
                      );
                    }),
                    CustomTextFormField(
                      controller: controller.emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validatorText: 'Please enter your email!',
                    ),
                    Obx(
                      () => CustomTextFormField(
                        controller: controller.passwordController,
                        obscureText: !controller.isPasswordVisible.value,
                        hintText: 'Password',
                        suffixIcon: CustomButton(
                          type: ButtonTypes.icon,
                          onPressed: controller.togglePasswordVisibility,
                          icon: controller.isPasswordVisible.value
                              ? Icon(Icons.visibility_off_sharp)
                              : Icon(Icons.visibility),
                        ),
                        validatorText: 'Please enter your password!',
                      ),
                    ),
                  ],
                ),
                Text(
                  'By selecting Agree and continue, I agree to Airbnb\'s Terms of Service, Payments Terms of Service and Anti-Discrimination Policy, and acknowledge the Privacy Policy.',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Obx((){
                  return CustomButton(
                    type: ButtonTypes.elevated,
                    isLoading: controller.isLoading.value,
                    height: 45,
                    width: Get.width,
                    onPressed: controller.signUp,
                    text: 'Agree and continue',
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
              TextSpan(text: "Already have an account? "),
              TextSpan(
                text: 'Login Now',
                style: TextStyle(
                  color: AppColor.blue,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.offNamed(Routes.login);
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
