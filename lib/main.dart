import 'package:airbnb/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Airbnb",
      initialRoute: AppRouter.initialRoute,
      getPages: AppRouter.appPages,
    );
  }
}