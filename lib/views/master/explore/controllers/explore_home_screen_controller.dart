import 'package:airbnb/airbnb_global_imports.dart';

class SwitchButtonController extends GetxController {
  var switchValue = false.obs;
  switchFunction() {
    if (switchValue.value == false) {
      switchValue.value = true;
    } else {
      switchValue.value = false;
    }
  }
}

class BottomNavigationController extends GetxController {
  var currentIndex = 0.obs;
  final List<Widget> screens = [
    ExploreHomeScreen(),
    WishlistsScreen(),
    TripsScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  @override
  void onInit() {
    super.onInit();
    updateIndexFromRoute();
  }

  void updateIndexFromRoute() {
    String currentRoute = Get.currentRoute;
    switch (currentRoute) {
      case '/explore':
        currentIndex.value = 0;
        break;
      case '/wishlists':
        currentIndex.value = 1;
        break;
      case '/trips':
        currentIndex.value = 2;
        break;
      case '/messages':
        currentIndex.value = 3;
        break;
      case '/profile':
        currentIndex.value = 4;
        break;
    }
  }

  changeIndex(int index) {
    currentIndex.value = index;
    switch (index) {
      case 0:
        Get.offNamed('/explore');
        break;
      case 1:
        Get.offNamed('/wishlists');
        break;
      case 2:
        Get.offNamed('/trips');
        break;
      case 3:
        Get.offNamed('/messages');
        break;
      case 4:
        Get.offNamed('/profile');
        break;
    }
  }
}

class ExploreCarouselSliderController extends GetxController {
  var currentIndex = 0.obs;
  final List<Widget> images = [
    CustomImage(
      path:
          'https://www.smartextpros.com/wp-content/uploads/2024/07/horizontal-vs-vertical-siding-01.jpg',
    ),
    CustomImage(
      path:
          'https://images.pexels.com/photos/1643383/pexels-photo-1643383.jpeg?cs=srgb&dl=pexels-fotoaibe-1643383.jpg&fm=jpg',
    ),
    CustomImage(
      path:
          'https://plus.unsplash.com/premium_photo-1661766077694-6e3750b0fb97?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cm9vbSUyMGJhY2tncm91bmR8ZW58MHx8MHx8fDA%3D',
    ),
  ];
}
