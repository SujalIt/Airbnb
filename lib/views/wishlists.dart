import 'package:airbnb/utils/extensions.dart';
import 'package:airbnb/views/test.dart';
import 'package:airbnb/widgets/custom_log_in_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bindings/login_signup_binding.dart';
import 'login_signup_screen.dart';

class WishlistsScreen extends StatelessWidget{
  const WishlistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      // ExpansionTileExample(), //test.dart
      Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.screenHeight * 0.07,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Edit',
                style: TextStyle(
                  fontWeight: FontWeight.w600
                ),),
              ],
            ),
            Text('Wishlists',
            style: TextStyle(
              fontSize: context.screenWidth * 0.08,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: context.screenHeight * 0.04,),
            Text('Log in to view your Wishlists',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: context.screenWidth * 0.06
            ),),
            SizedBox(height: context.screenHeight * 0.01,),
            Text('You can create, view, or edit Wishlists once you\'ve logged in.',
            style: TextStyle(
              color: Colors.blueGrey
            ),),
            SizedBox(height: context.screenHeight * 0.02,),
            CustomLogInButton(
                onPressed: (){
                  Get.to(() => LoginSignupScreen(),transition: Transition.rightToLeft,binding: LoginSignupBinding());
                },
              width: context.screenWidth * 0.23,
              text: 'Log in',
            ),
          ],
        ),
      ),
    );
  }
}