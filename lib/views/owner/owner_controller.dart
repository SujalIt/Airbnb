import 'package:airbnb/airbnb_global_imports.dart';

class OwnerController extends GetxController{
  var currentIndex = 0.obs;

  final List<Widget> screens = [
    OwnerDashboardScreen(),
    OwnerPropertyScreen(),
    OwnerProfileScreen(),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}