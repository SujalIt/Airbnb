import 'package:airbnb/airbnb_global_imports.dart';

class WishDetail extends GetView<WishlistController>{
  const WishDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back,),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.ios_share),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25,),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 25,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nice",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        CustomButton(
                          type: ButtonTypes.outlined,
                          onPressed: (){},
                          outlineButtonStyle: OutlinedButton.styleFrom(
                            padding: EdgeInsetsGeometry.symmetric(horizontal: 15,vertical: 12),
                            backgroundColor: AppColor.black12,
                          ),
                          text: 'May 14 - 19',
                          textStyle: TextStyle(
                            color: AppColor.black,
                          ),
                        ),
                        CustomButton(
                          type: ButtonTypes.outlined,
                          onPressed: (){},
                          outlineButtonStyle: OutlinedButton.styleFrom(
                            padding: EdgeInsetsGeometry.symmetric(horizontal: 15,),
                          ),
                          text: 'Guests',
                          textStyle: TextStyle(
                            color: AppColor.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  spacing: 30,
                  children: [
                    Column(
                      spacing: 1,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            CarouselSlider(
                              items: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: SizedBox(
                                    child: CustomImage(
                                      width: Get.width,
                                      path: "https://w0.peakpx.com/wallpaper/179/733/HD-wallpaper-snow-night-house-dark-home-lake-light-moon-winter.jpg",
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CustomImage(
                                    width: Get.width,
                                    path: "https://wallpapercat.com/w/full/2/e/4/743520-1920x1200-desktop-hd-house-background-image.jpg",
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CustomImage(
                                    width: Get.width,
                                    path: "https://wallpapers.com/images/hd/beautiful-house-pictures-gi9u23e95gi8iu2e.jpg",
                                  ),
                                ),
                              ],
                              options: CarouselOptions(
                                viewportFraction: 1,
                                height: 230,
                                onPageChanged: (index, reason) {
                                  controller.currentIndex.value = index;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0,top: 5.0,),
                              child: CustomButton(
                                onPressed: () {},
                                type: ButtonTypes.outlined,
                                outlineButtonStyle: OutlinedButton.styleFrom(
                                  padding: EdgeInsetsGeometry.all(7),
                                  backgroundColor: AppColor.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                text: 'SUPERHOST',
                                textStyle: TextStyle(
                                  color: AppColor.black,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: (){},
                                icon: Icon(
                                  Icons.favorite_outlined,
                                  color: AppColor.pink,
                                ),
                              ),
                            ),
                            Obx(() => Positioned(
                              bottom: 18,
                              left: 150,
                              child: SmoothPageIndicator(
                                controller: PageController(
                                  initialPage: controller.currentIndex.value,
                                ),
                                count: 3,
                                effect: SlideEffect(
                                  activeDotColor: AppColor.white,
                                  dotHeight: 9,
                                  dotWidth: 9,
                                  dotColor: AppColor.white60,
                                ),
                              ),
                            ),
                            ),
                          ],
                        ),
                        Row(
                          spacing: 1,
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColor.pink,
                              size: 20,
                            ),
                            Text(
                              "4.98",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "(61)",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Entire home in Putnam Valley Modern luxury in woods 5B 3.5B heated",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          spacing: 3,
                          children: [
                            Text(
                              "\$1,700",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "night ∙ \$10,156 total",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "\$10,156 total",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColor.grey,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      spacing: 1,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            CarouselSlider(
                              items: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: SizedBox(
                                    child: CustomImage(
                                      width: Get.width,
                                      path: "https://w0.peakpx.com/wallpaper/179/733/HD-wallpaper-snow-night-house-dark-home-lake-light-moon-winter.jpg",
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CustomImage(
                                    width: Get.width,
                                    path: "https://wallpapercat.com/w/full/2/e/4/743520-1920x1200-desktop-hd-house-background-image.jpg",
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CustomImage(
                                    width: Get.width,
                                    path: "https://wallpapers.com/images/hd/beautiful-house-pictures-gi9u23e95gi8iu2e.jpg",
                                  ),
                                ),
                              ],
                              options: CarouselOptions(
                                viewportFraction: 1,
                                height: 230,
                                onPageChanged: (index, reason) {
                                  controller.currentIndex.value = index;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0,top: 5.0,),
                              child: CustomButton(
                                onPressed: () {},
                                type: ButtonTypes.outlined,
                                outlineButtonStyle: OutlinedButton.styleFrom(
                                  padding: EdgeInsetsGeometry.all(7),
                                  backgroundColor: AppColor.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                text: 'SUPERHOST',
                                textStyle: TextStyle(
                                  color: AppColor.black,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: (){},
                                icon: Icon(
                                  Icons.favorite_outlined,
                                  color: AppColor.pink,
                                ),
                              ),
                            ),
                            Obx(() => Positioned(
                              bottom: 18,
                              left: 150,
                              child: SmoothPageIndicator(
                                controller: PageController(
                                  initialPage: controller.currentIndex.value,
                                ),
                                count: 3,
                                effect: SlideEffect(
                                  activeDotColor: AppColor.white,
                                  dotHeight: 9,
                                  dotWidth: 9,
                                  dotColor: AppColor.white60,
                                ),
                              ),
                            ),
                            ),
                          ],
                        ),
                        Row(
                          spacing: 1,
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColor.pink,
                              size: 20,
                            ),
                            Text(
                              "4.98",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "(61)",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Entire home in Putnam Valley Modern luxury in woods 5B 3.5B heated",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          spacing: 3,
                          children: [
                            Text(
                              "\$1,700",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "night ∙ \$10,156 total",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "\$10,156 total",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColor.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 100,
        height: 45,
        child: FloatingActionButton.extended(
          onPressed: (){
            Get.toNamed(Routes.wishDetailMap);
          },
          backgroundColor: AppColor.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          label: Row(
            spacing: 5,
            children: [
              Text(
                "Map",
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 16,
                ),
              ),
              Icon(
                Icons.map,
                color: AppColor.white,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}