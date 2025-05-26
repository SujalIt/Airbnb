import 'package:airbnb/airbnb_global_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase Init
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await PushNotifications.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: PushNotifications.navigatorKey,
      title: "Airbnb",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.auth,
      getPages: AppRouter.routes,
    );
  }
}
