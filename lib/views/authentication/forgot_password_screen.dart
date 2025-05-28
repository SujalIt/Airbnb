import 'package:airbnb/airbnb_global_imports.dart';

class ForgotPasswordScreen extends GetView<AuthController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        leading: IconButton(
          onPressed: () {
            Get.offNamed(Routes.login);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Form(
        key: controller.authFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 21,
              children: [
                Text(
                  'Forgot Password',
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
                Obx((){
                  return CustomButton(
                    isLoading: controller.isLoading.value,
                    onPressed: controller.resetPassword,
                    width: context.screenWidth * 1,
                    text: 'Forgot Password',
                    textStyle: TextStyle(
                      fontSize: context.screenWidth * 0.04,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
