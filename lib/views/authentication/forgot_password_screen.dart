import 'package:airbnb/airbnb_global_imports.dart';

class ForgotPasswordScreen extends GetView<AuthController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Form(
        key: controller.authFormKeyForgotPass,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25,),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 21,
              children: [
                Text(
                  'Forgot Password',
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
                Obx((){
                  return CustomButton(
                    type: ButtonTypes.elevated,
                    isLoading: controller.isLoading.value,
                    onPressed: controller.resetPassword,
                    width: Get.width,
                    text: 'Forgot Password',
                    textStyle: TextStyle(
                      fontSize: 16,
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
