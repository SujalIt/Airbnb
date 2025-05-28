import 'package:airbnb/airbnb_global_imports.dart';
import 'package:flutter/gestures.dart';

class FinishSigningUpScreen extends GetView<AuthController> {
  const FinishSigningUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.offNamed(Routes.login);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
        child: SingleChildScrollView(
          child: Form(
            key: controller.authFormKey,
            child: Column(
              spacing: 18,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello! Register to get started',
                  style: TextStyle(
                    fontSize: context.screenWidth * 0.08,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10.0,
                  children: [
                    TextFormField(
                      controller: controller.fnameController,
                      decoration: InputDecoration(
                        hintText: 'First name on ID',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name!';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.lnameController,
                      decoration: InputDecoration(
                        hintText: 'Surname on ID',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your surname!';
                        }
                        return null;
                      },
                    ),
                    Obx(() {
                      return TextFormField(
                        readOnly: true,
                        controller: TextEditingController(
                          text: controller.selectedDate.value == null
                              ? ''
                              : "${controller.selectedDate.value!.day}-${controller.selectedDate.value!.month}-${controller.selectedDate.value!.year}",
                        ),
                        decoration: InputDecoration(
                          hintText: "Date of Birth",
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () => controller.pickDate(context),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select Your date of birth!';
                          }
                          return null;
                        },
                      );
                    }),
                    TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                      ),
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
                            suffixIcon: TextButton(
                              onPressed:
                              controller.togglePasswordVisibility,
                              child: controller.isPasswordVisible.value
                                  ? Text("Hide")
                                  : Text('Show'),
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password!';
                          }
                          return null;
                        },
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
                  color: Colors.blue,
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
