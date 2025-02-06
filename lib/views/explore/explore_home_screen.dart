import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controllers/explore_carousel_slider_controller.dart';
import '../../controllers/explore_switch_controller.dart';

class ExploreHomeScreen extends StatelessWidget {
  const ExploreHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SwitchButton switchController = Get.find();
    ExploreCarouselSliderController carouselController = Get.find();

    final exploreScreenHeight = MediaQuery.of(context).size.height;
    final exploreScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: exploreScreenWidth * 0.05),
        child: Column(
          children: [
            // Search button
            SizedBox(
              height: exploreScreenHeight * 0.05,
            ), //45
            SizedBox(
              height: exploreScreenHeight * 0.07,
              width: exploreScreenWidth * 0.9,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(Colors.black),
                      backgroundColor: WidgetStatePropertyAll(Colors.white60)),
                  child: Padding(
                    padding: EdgeInsets.only(left: exploreScreenWidth * 0.2),
                    //80
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: exploreScreenWidth * 0.04,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: exploreScreenWidth * 0.01,
                        ),
                        Text(
                          'Start your search',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: exploreScreenWidth * 0.04),
                        ),
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: exploreScreenHeight * 0.01,
            ),
            // types of rooms or locations
            DefaultTabController(
              length: 8,
              child: TabBar(
                tabAlignment: TabAlignment.start,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(
                    icon: Icon(Icons.beach_access_outlined),
                    text: "Beachfront",
                  ),
                  Tab(
                    icon: Icon(Icons.star),
                    text: "Icons",
                  ),
                  Tab(
                    icon: Icon(Icons.bedroom_parent_sharp),
                    text: "Rooms",
                  ),
                  Tab(
                    icon: Icon(Icons.cabin),
                    text: "Cabins",
                  ),
                  Tab(
                    icon: Icon(Icons.home_outlined),
                    text: "Tiny homes",
                  ),
                  Tab(
                    icon: Icon(Icons.grid_off),
                    text: "Off-the-grid",
                  ),
                  Tab(
                    icon: Icon(Icons.view_comfortable_sharp),
                    text: "Amazing views",
                  ),
                  Tab(
                    icon: Icon(Icons.pool_outlined),
                    text: "Amazing pools",
                  ),
                ],
              ),
            ),
            // display price and image container
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // total price switch
                    SizedBox(
                      height: exploreScreenHeight * 0.03,
                    ),
                    Container(
                      padding: EdgeInsets.all(exploreScreenWidth * 0.03),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text('Display total price',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('Includes all fees,before taxes')
                            ],
                          ),
                          SizedBox(
                            width: exploreScreenWidth * 0.12,
                          ),
                          Obx(() {
                            return Transform.scale(
                              scaleX: 0.9,
                              scaleY: 1,
                              child: Switch(
                                  thumbIcon: WidgetStatePropertyAll(Icon(
                                    Icons.circle_sharp,
                                    color: Colors.white,
                                    size: exploreScreenWidth * 0.01,
                                  )),
                                  activeColor: Colors.white,
                                  activeTrackColor: Colors.black,
                                  inactiveTrackColor: Colors.grey,
                                  inactiveThumbColor: Colors.white,
                                  value: switchController.switchValue.value,
                                  onChanged: (value) {
                                    switchController.switchFunction();
                                  }),
                            );
                          })
                        ],
                      ),
                    ),
                    // image slider container
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: carouselController.images.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Stack(
                                  children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  child: CarouselSlider(
                                    items: carouselController.images,
                                    options: CarouselOptions(
                                      height: exploreScreenHeight * 0.4,
                                        viewportFraction: 1,
                                        onPageChanged: (index, reason) {
                                          carouselController.currentIndex.value = index;
                                        }),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_outline_rounded,
                                      size: exploreScreenWidth * 0.07,
                                      color: Colors.white60,
                                    ),
                                  ),
                                ),
                                Obx((){
                                  return Padding(
                                    padding: EdgeInsets.only(top: 310,left: 160),
                                    child: SmoothPageIndicator(
                                        controller: PageController(initialPage: carouselController.currentIndex.value),
                                        count: carouselController.images.length,
                                      effect: SlideEffect(
                                        activeDotColor: Colors.grey,
                                        dotHeight: exploreScreenHeight * 0.01,
                                        dotWidth: exploreScreenWidth * 0.02,
                                        dotColor: Colors.white60,
                                      ),
                                    ),
                                  );
                                })
                              ]),
                              SizedBox(
                                height: exploreScreenHeight * 0.01,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Rakchham, India',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        width: exploreScreenWidth * 0.4,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: exploreScreenWidth * 0.03,
                                      ),
                                      Text(
                                        '4.8',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Text(
                                    '3,166 m elevation',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '21-26 Mar',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: exploreScreenHeight * 0.01,
                                  ),
                                  Row(
                                    spacing: exploreScreenWidth * 0.01,
                                    children: [
                                      Text(
                                        '₹1,896',
                                        style: TextStyle(
                                            fontSize: exploreScreenWidth * 0.04,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text('night'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: exploreScreenHeight * 0.04,
                                  )
                                ],
                              ),
                            ],
                          );
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: exploreScreenHeight * 0.06,
        child: FloatingActionButton.extended(
          onPressed: () {},
          isExtended: true,
          shape: true
              ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
              : CircleBorder(),
          extendedIconLabelSpacing: exploreScreenWidth * 0.01,
          extendedPadding: EdgeInsets.symmetric(horizontal: exploreScreenWidth * 0.05),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          label: Icon(Icons.map),
          icon: Text('Map',),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
