import 'package:airbnb/utils/extensions.dart';
import 'package:airbnb/widgets/custom_log_in_button.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../bindings/login_signup_binding.dart';
import '../widgets/custom_list_tile_profile.dart';
import 'login_signup_screen.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(context.screenWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.screenHeight * 0.05,),
              Text('Your profile',
                  style: TextStyle(
                      fontSize: context.screenWidth * 0.08,
                      fontWeight: FontWeight.w500)
              ),
              Text('Log in to start planning your next trip.',
                style: TextStyle(
                  fontSize: context.screenWidth * 0.05,
                  color: Colors.blueGrey
                ),),
              SizedBox(height : context.screenHeight * 0.06),
              CustomLogInButton(
                  onPressed: (){
                    Get.to(() => LoginSignupScreen(),transition: Transition.rightToLeft,binding: LoginSignupBinding());
                  },
                width: context.screenWidth * 1,
                text: 'Log in',
              ),
              SizedBox(height: context.screenHeight * 0.03,),
              Text('Don\'t have an account? Sign up'),
              SizedBox(height: context.screenHeight * 0.03,),
              CustomListTileProfile(
                leading: Icon(Icons.settings),
                text: 'Settings',),
              Divider(),
              SizedBox(height: context.screenHeight * 0,),
              CustomListTileProfile(
                  leading: Icon(Icons.accessibility),
                  text: 'Accessibility'),
              Divider(),
              CustomListTileProfile(
                  leading: Icon(Icons.home_outlined),
                  text: 'Learn about hosting'),
              Divider(),
              CustomListTileProfile(
                  leading: Icon(Icons.help_outline),
                  text: 'Get help'),
              Divider(),
              CustomListTileProfile(
                  leading: Icon(Icons.menu_book_outlined),
                  text: 'Terms of Service'),
              Divider(),
              CustomListTileProfile(
                  leading: Icon(Icons.menu_book_outlined),
                  text: 'Privacy Policy'),
              Divider(),
              CustomListTileProfile(
                  leading: Icon(Icons.menu_book_outlined),
                  text: 'Open source licences'),
              Divider(),
              SizedBox(height: context.screenHeight * 0.02,),
              Text('Version 25.04 (28007251)'),
              SizedBox(height: context.screenHeight * 0.06,)
            ],
          ),
        ),
      ),
    );
  }
}