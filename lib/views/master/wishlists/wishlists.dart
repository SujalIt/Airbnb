import 'package:airbnb/airbnb_global_imports.dart';

class WishlistScreen extends GetView<WishlistController> {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 40,
          ),
          child: FirebaseAuth.instance.currentUser != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    Text(
                      "Wishlist",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              vertical: 8,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  Routes.wishDetail,
                                );
                              },
                              child: Row(
                                spacing: 11,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CustomImage(
                                      width: 65,
                                      height: 65,
                                      path: "https://static.vecteezy.com/system/resources/thumbnails/007/950/886/small/small-plant-growing-in-morning-light-at-garden-concept-earth-day-free-photo.jpg",
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nice",
                                      ),
                                      Text(
                                        "May 14-19,2023",
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )
              : Column(
                  spacing: 18,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wishlists',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Log in to view your Wishlists',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 23,
                      ),
                    ),
                    Text(
                      'You can create, view, or edit Wishlists once you\'ve logged in.',
                      style: TextStyle(
                        color: AppColor.blueGrey,
                      ),
                    ),
                    CustomButton(
                      onPressed: () {
                        Get.toNamed(
                          Routes.login,
                        );
                      },
                      text: 'Log in',
                      textStyle: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
