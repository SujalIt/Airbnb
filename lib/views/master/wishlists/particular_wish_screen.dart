import 'package:airbnb/airbnb_global_imports.dart';

class ParticularWishScreen extends StatelessWidget{
  const ParticularWishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.download_outlined),
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.menu),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nice",
                style: TextStyle(
                  fontSize: context.screenWidth * 0.1,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                child: Column(
                  spacing: context.screenHeight * 0.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CarouselSlider(
                          items: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CustomImage(
                                path: "https://w0.peakpx.com/wallpaper/179/733/HD-wallpaper-snow-night-house-dark-home-lake-light-moon-winter.jpg",
                              ),
                            ),
                          ],
                          options: CarouselOptions(
                            height: context.screenHeight * 0.4,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              // carouselController.currentIndex.value = index;
                            },
                          ),
                        ),
                        CustomButton(
                          onPressed: () {},
                          type: ButtonTypes.outlined,
                          outlineButtonStyle: OutlinedButton.styleFrom(
                            padding: EdgeInsetsGeometry.all(context.screenWidth * 0.02),
                            backgroundColor: AppColor.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          text: 'SUPERHOST',
                          textStyle: TextStyle(
                            color: AppColor.black,
                            // fontSize: context.screenWidth * 0.05,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.favorite_outlined,color: AppColor.pink,),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColor.pink,
                        ),
                        Text(
                          "4.98",
                          style: TextStyle(
                            fontSize: context.screenWidth * 0.05,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "(61)",
                          style: TextStyle(
                            fontSize: context.screenWidth * 0.045,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Entire home in Putnam Valley Modern luxury in woods 5B 3.5B heated",
                      style: TextStyle(
                        fontSize: context.screenWidth * 0.05,
                        // fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      spacing: 3,
                      children: [
                        Text(
                          "\$1,700",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: context.screenWidth * 0.04,
                          ),
                        ),
                        Text(
                          "night ∙ \$10,156 total",
                          style: TextStyle(
                            // fontWeight: FontWeight.w600,
                            fontSize: context.screenWidth * 0.04,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "\$10,156 total",
                      style: TextStyle(
                        fontSize: context.screenWidth * 0.04,
                        // fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}