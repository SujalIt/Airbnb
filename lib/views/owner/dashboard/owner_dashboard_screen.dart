import 'package:airbnb/airbnb_global_imports.dart';

class OwnerDashboardScreen extends GetView<OwnerDashboardController> {
  const OwnerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Text(
          "Coming Soon!",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
