import 'package:airbnb/airbnb_global_imports.dart';

class MasterController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> screens = [
    ExploreScreen(),
    WishlistScreen(),
    TripsScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
