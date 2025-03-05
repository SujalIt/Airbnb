import 'package:airbnb/airbnb_global_imports.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Airbnb",
      initialRoute: Routes.explore,
      getPages: AppRouter.routes,
    );
  }
}