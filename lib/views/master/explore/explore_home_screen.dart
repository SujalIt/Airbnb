import 'package:airbnb/airbnb_global_imports.dart';

class ExploreHomeScreen extends StatefulWidget {
  const ExploreHomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ExploreHomeScreenState();
}

class _ExploreHomeScreenState extends State<ExploreHomeScreen> {
  late final ExploreCarouselSliderController carouselController;

  @override
  void initState() {
    super.initState();
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
            SafeArea(
              child: SizedBox(
                height: context.screenHeight * 0.07,
                width: context.screenWidth * 0.9,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(Colors.black),
                        backgroundColor: WidgetStatePropertyAll(Colors.white60)),
                    child: Padding(
                      padding: EdgeInsets.only(left: context.screenWidth * 0.195),
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
                    FutureBuilder<Map<String, Map<String, dynamic>>>(
                      future: carouselController.getAllDocuments(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return SizedBox(
                            height: context.screenHeight * 0.3,
                            child: Center(child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        }
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Center(child: Text('No documents found'));
                        }
                        Map<String, Map<String, dynamic>> documents = snapshot.data!;
                        return ListView.builder(
                          itemCount: documents.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            String documentId = documents.keys.elementAt(index);
                            Map<String, dynamic> documentData = documents[documentId]!;
                            List<String> imageUrls = [];
                            for (String i in documentData['pictureurls']) {
                              imageUrls.add(i);
                            }
                            return Column(
                              children: [
                                Stack(children: [
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed('/explore/particularScreen?id=$documentId',
                                      );
                                      // uploadImageToImageKit();
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      child: CarouselSlider(
                                        items: imageUrls.map((url) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),
                                              image: DecorationImage(
                                                image: NetworkImage(url),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        options: CarouselOptions(
                                            height: context.screenHeight * 0.4,
                                            viewportFraction: 1,
                                            onPageChanged: (index, reason) {
                                              carouselController.currentIndex.value = index;
                                            },
                                        ),
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
                                  Obx(() {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        top: context.screenHeight * 0.37,
                                        left: context.screenWidth * 0.42,
                                      ),
                                      child: SmoothPageIndicator(
                                        controller: PageController(
                                            initialPage: carouselController.currentIndex.value),
                                        count: documents.length,
                                        effect: SlideEffect(
                                          activeDotColor: Colors.grey,
                                          dotHeight:
                                              context.screenHeight * 0.01,
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          documentData["name"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: context.screenWidth * 0.03,
                                            ),
                                            Text(
                                              documentData["rating"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      documentData["distance"],
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      documentData["available_dates"],
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
                                          '₹${documentData["price"]}',
                                          style: TextStyle(
                                              fontSize:
                                                  context.screenWidth * 0.04,
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
                          },
                        );
                      },
                    ),
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          extendedIconLabelSpacing: context.screenWidth * 0.01,
          extendedPadding:
              EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          label: Icon(Icons.map),
          icon: Text(
            'Map',
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
