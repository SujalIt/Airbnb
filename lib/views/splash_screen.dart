import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/route_name.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),(){
      Get.offAllNamed(Routes.master);
    });
    return Scaffold(
      body: Center(
        child: Text('Welcome to My App!\nFlutter Native Splash!',style: TextStyle(fontSize: 29,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
