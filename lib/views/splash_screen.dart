import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5),(){
      Get.offAllNamed(Routes.explore);
    });
    return Scaffold(
      body: Center(
        child: Text('Welcome to My App!\nFlutter Native Splash!',style: TextStyle(fontSize: 29,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
