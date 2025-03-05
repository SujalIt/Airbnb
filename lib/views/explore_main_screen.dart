import 'package:airbnb/airbnb_global_imports.dart';

class ExploreMainScreen extends GetView<BottomNavigationController> {
  const ExploreMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.updateIndexFromRoute();
          return Scaffold(
            backgroundColor: Colors.white,
            body: Obx(() => controller.screens[controller.currentIndex.value]),
            bottomNavigationBar: BottomNavigationBar(
                  currentIndex: controller.currentIndex.value,
                  onTap: controller.changeIndex,
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Colors.grey,
                  showUnselectedLabels: true,
                  selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  iconSize: 27,
                  selectedItemColor: Colors.pink,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.search,
                      ),
                      label: 'Explore',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.favorite_outline_rounded,
                        ),
                        label: 'Wishlists'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.place_outlined,
                        ),
                        label: 'Trips'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.messenger_outline,
                        ),
                        label: 'Messages'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.account_circle_outlined,
                        ),
                        label: 'Log In')
                  ],
                ),
          );
  }
}
