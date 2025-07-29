import 'package:airbnb/airbnb_global_imports.dart';

class ExploreScreen extends GetView<ExploreScreenController> {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Column(
            spacing: 20,
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                width: Get.width,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: AppColor.white,
                  ),
                  color: AppColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.black26,
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.search,
                        size: 28,
                        color: AppColor.black,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Where to?',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            'Anywhere ∙ Any week ∙ Add guests',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: AppColor.grey,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 43,
                        height: 43,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.black12,
                          ),
                          color: AppColor.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.tune,
                            size: 20,
                            color: AppColor.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DefaultTabController(
                length: 8,
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  labelColor: AppColor.black,
                  unselectedLabelColor: AppColor.grey,
                  isScrollable: true,
                  indicatorColor: AppColor.black,
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
              // image container
              Expanded(
                child: SingleChildScrollView(
                  child: FutureBuilder<dynamic>(
                    future: controller.getAllDocuments(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(
                          height: 350,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
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
                          return Column(
                            spacing: 15,
                            children: [
                              Stack(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                        '${Routes.propertyDetail}?id=$documentId',
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      child: CustomImage(
                                        height: 330,
                                        path: documentData['images'].isNotEmpty
                                            ? documentData['images'][0]
                                            : "assets/images/Image-Not-Found.jpg",
                                        fit: BoxFit.cover,
                                        width: Get.width,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_outline_rounded,
                                        size: 30,
                                        color: AppColor.white60,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                spacing: 1,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        documentData["name"] ?? "name null",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Row(
                                        spacing: 1,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 18,
                                          ),
                                          Text(
                                            documentData["rating"] ?? "rating null",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    documentData["distance"] ?? "distance null",
                                    style: TextStyle(
                                      color: AppColor.blueGrey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    documentData["available_dates"] ?? "availableDates null",
                                    style: TextStyle(
                                      color: AppColor.blueGrey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Row(
                                    spacing: 3,
                                    children: [
                                      Text(
                                        '₹${documentData["price"] ?? "price null"}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColor.black,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Text(
                                        'night',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 100,
        height: 45,
        child: FloatingActionButton.extended(
          onPressed: () {},
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
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
