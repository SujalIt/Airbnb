import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/explore_controllers/explore_switch_controller.dart';

class ExploreMainScreen extends StatelessWidget {
  const ExploreMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavigationController bottomController = Get.find();
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        body: bottomController.screens[bottomController.currentIndex.value],
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            currentIndex: bottomController.currentIndex.value,
            onTap: (index) {
              bottomController.screenFunction(index);
            },
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            selectedLabelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
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
                    Icons.pin_drop_outlined,
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
          );
        }),
      );
    });
  }
}
