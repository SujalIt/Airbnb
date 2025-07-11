import 'package:airbnb/airbnb_global_imports.dart';

class OwnerScreen extends GetView<OwnerController> {
  const OwnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeIndex,
          backgroundColor: AppColor.white,
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
                Icons.dashboard_customize_outlined,
              ),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Property',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
              ),
              label: 'Profile',
            )
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.currentIndex.value],
      ),
    );
  }
}
