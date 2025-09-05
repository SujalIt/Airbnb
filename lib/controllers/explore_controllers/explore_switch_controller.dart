import 'package:get/get.dart';

import '../../views/explore/explore_home_screen.dart';
import '../../views/messages.dart';
import '../../views/profile.dart';
import '../../views/trips.dart';
import '../../views/wishlists.dart';

class SwitchButtonController extends GetxController{
  var switchValue = false.obs;
  switchFunction(){
    if(switchValue.value == false){
      switchValue.value = true;
    }else{
      switchValue.value = false;
    }
  }
}
class BottomNavigationController extends GetxController{
  var currentIndex = 0.obs;
  var screens = [
    ExploreHomeScreen(),
    WishlistsScreen(),
    TripsScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];
  screenFunction(int index){
    currentIndex.value = index;
  }
}