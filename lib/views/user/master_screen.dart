import 'package:airbnb/airbnb_global_imports.dart';

class MasterScreen extends GetView<MasterController> {
  const MasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        body: Obx(()=> controller.screens[controller.currentIndex.value]),
        bottomNavigationBar: Obx(()=> BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeIndex,
            backgroundColor: AppColor.white,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: AppColor.grey,
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            iconSize: 27,
            selectedItemColor: AppColor.pink,
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
                label: 'Wishlists',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.place_outlined,
                ),
                label: 'Trips',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.messenger_outline,
                ),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                ),
                label: 'Log In',
              )
            ],
          ),
        ),
      );
  }
}
