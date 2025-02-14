import 'package:airbnb/utils/extensions.dart';
import 'package:airbnb/widgets/custom_log_in_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../controllers/login_signup_phone_controller.dart';
import '../widgets/custom_login_signup_continue_button.dart';

class LoginSignupScreen extends StatefulWidget{
  const LoginSignupScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginSignupScreenState();
}
class _LoginSignupScreenState extends State<LoginSignupScreen>{
  TextEditingController phoneTextController = TextEditingController();
  late final LoginSignupPhoneController phoneController ;

  @override
  void initState(){
    super.initState();
    phoneController = Get.find();
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
              onPressed: (){
                Get.back();
              }, icon: Icon(Icons.cancel_outlined,size: context.screenWidth * 0.069,)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Log in or sign up to Airbnb',
              style: TextStyle(fontSize: context.screenWidth * 0.06,
              fontWeight: FontWeight.w500),),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Colors.blueGrey.shade700,)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Country/Region',
                            style: TextStyle(fontSize: context.screenWidth * 0.032,color: Colors.blueGrey),),
                          IntlPhoneField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.none,
                            initialCountryCode: 'IN',
                            // style: TextStyle(fontSize: context.screenWidth * 0.01),
                            showCursor: false,
                            disableLengthCheck: true,
                            onCountryChanged: (country){
                              phoneController.updateCountryCode('+${country.dialCode}');
                            },
                          ),
                        ],
                      ),
                      Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Phone number',
                            style: TextStyle(fontSize: context.screenWidth * 0.032,color: Colors.blueGrey),),
                          Obx(() => TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixText: phoneController.selectedCountryCode.value,
                              ),
                            style: TextStyle(fontSize: context.screenWidth * 0.04),
                              controller: phoneTextController,
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.01,
              ),
              Text('We\'ll call or text you to confirm your number. Standard message and data rates apply.',
              style: TextStyle(color: Colors.blueGrey),),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),
              CustomLogInButton(
                  onPressed: (){},
                width: context.screenWidth * 1,
                text: 'Continue',
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
                  Text('or',
                    style: TextStyle(
                      fontSize: context.screenWidth * 0.04,
                    ),),
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
              CustomLoginSignupContinueButton(
                onPressed: () {},
                text: 'Continue with Email',
                leading: Icon(Icons.email,size: context.screenWidth * 0.06,),),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              CustomLoginSignupContinueButton(
                onPressed: () {},
                text: 'Continue with Facebook',
                leading: Icon(Icons.facebook_outlined,size: context.screenWidth * 0.06,),),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              CustomLoginSignupContinueButton(
                onPressed: () {},
                text: 'Continue with Google',
                leading: Icon(Icons.g_mobiledata_outlined,size: context.screenWidth * 0.06,),),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              CustomLoginSignupContinueButton(
                onPressed: () {},
                text: 'Continue with Apple',
                leading: Icon(Icons.apple_outlined,size: context.screenWidth * 0.06,),)
            ],
          ),
        ),
      ),
    );
  }
}