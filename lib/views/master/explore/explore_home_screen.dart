import 'package:airbnb/airbnb_global_imports.dart';

class ExploreHomeScreen extends StatefulWidget {
  const ExploreHomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ExploreHomeScreenState();
}

class _ExploreHomeScreenState extends State<ExploreHomeScreen>{
  late final SwitchButtonController switchController;
  late final ExploreCarouselSliderController carouselController;

  @override
  void initState(){
    super.initState();
    switchController = Get.find();
    carouselController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
        child: Column(
          children: [
            // Search button
            SizedBox(
              height: context.screenHeight * 0.05,
            ),
            SizedBox(
              height: context.screenHeight * 0.07,
              width: context.screenWidth * 0.9,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(Colors.black),
                      backgroundColor: WidgetStatePropertyAll(Colors.white60)),
                  child: Padding(
                    padding: EdgeInsets.only(left: context.screenWidth * 0.2),
                    //80
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: context.screenWidth * 0.04,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: context.screenWidth * 0.01,
                        ),
                        Text(
                          'Start your search',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: context.screenWidth * 0.04),
                        ),
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: context.screenHeight * 0.01,
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
                      height: context.screenHeight * 0.03,
                    ),
                    Container(
                      padding: EdgeInsets.all(context.screenWidth * 0.03),
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
                            width: context.screenWidth * 0.12,
                          ),
                          Obx(() {
                            return Transform.scale(
                              scaleY: 1,
                              child: Switch(
                                  thumbIcon: WidgetStatePropertyAll(Icon(
                                    Icons.circle_sharp,
                                    color: Colors.white,
                                    size: context.screenWidth * 0.01,
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
                                InkWell(
                                  onTap: (){
                                    Get.to(()=> ParticularHome());
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    child: CarouselSlider(
                                      items: carouselController.images,
                                      options: CarouselOptions(
                                        height: context.screenHeight * 0.4,
                                          viewportFraction: 1,
                                          onPageChanged: (index, reason) {
                                            carouselController.currentIndex.value = index;
                                          }),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_outline_rounded,
                                      size: context.screenWidth * 0.07,
                                      color: Colors.white60,
                                    ),
                                  ),
                                ),
                                Obx((){
                                  return Padding(
                                    padding: EdgeInsets.only(top: context.screenHeight * 0.37,left: context.screenWidth * 0.4),//310,160
                                    child: SmoothPageIndicator(
                                        controller: PageController(initialPage: carouselController.currentIndex.value),
                                        count: carouselController.images.length,
                                      effect: SlideEffect(
                                        activeDotColor: Colors.grey,
                                        dotHeight: context.screenHeight * 0.01,
                                        dotWidth: context.screenWidth * 0.02,
                                        dotColor: Colors.white60,
                                      ),
                                    ),
                                  );
                                })
                              ]),
                              SizedBox(
                                height: context.screenHeight * 0.01,
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
                                        width: context.screenWidth * 0.4,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: context.screenWidth * 0.03,
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
                                    height: context.screenHeight * 0.01,
                                  ),
                                  Row(
                                    spacing: context.screenWidth * 0.01,
                                    children: [
                                      Text(
                                        '₹1,896',
                                        style: TextStyle(
                                            fontSize: context.screenWidth * 0.04,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text('night'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: context.screenHeight * 0.04,
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
        height: context.screenHeight * 0.06,
        child: FloatingActionButton.extended(
          onPressed: () {},
          isExtended: true,
          shape: true
              ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
              : CircleBorder(),
          extendedIconLabelSpacing: context.screenWidth * 0.01,
          extendedPadding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
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