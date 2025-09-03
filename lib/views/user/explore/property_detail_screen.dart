import 'package:airbnb/airbnb_global_imports.dart';
import 'package:intl/intl.dart';
import 'package:flutter_html/flutter_html.dart';

class PropertyDetailScreen extends GetView<ExploreScreenController> {
  var propertyId;

  PropertyDetailScreen({
    super.key,
    required this.propertyId,
  });

  void heroAnimation(BuildContext context, String image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: AppColor.black,
          appBar: AppBar(
            leading: CustomButton(
              type: ButtonTypes.icon,
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColor.white,
              ),
            ),
            backgroundColor: AppColor.black,
          ),
          body: Stack(children: [
            Center(
              child: Hero(
                tag: 'hero',
                child: CustomImage(
                  path: image,
                ),
              ),
            ),
          ]),
        );
      },
    );
  }

  void bottomSheetShowMore(String aboutUs) {
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColor.white,
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomButton(
                type: ButtonTypes.icon,
                padding: EdgeInsetsGeometry.only(right: 28),
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close,size: 27,),
              ),
              // About this place
              Html(
                data: aboutUs,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void bottomSheetAmenities() {
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColor.white,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 35),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomButton(
                type: ButtonTypes.icon,
                padding: EdgeInsetsGeometry.only(right: 28),
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios_new,size: 20,),
              ),
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 25,
                children: [
                  Text(
                    "Amenities",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 27,
                    ),
                  ),

                  // Scenic views
                  _amenity(
                    "Scenic views",
                    [
                      _amenityRow(
                        Icons.location_city,
                        "City skyline view",
                      ),
                    ],
                  ),

                  // Bathroom
                  _amenity(
                    "Bathroom",
                    [
                      _amenityRow(
                        Icons.hail_rounded,
                        "Hair dryer",
                      ),
                      _amenityRow(
                        Icons.local_drink_outlined,
                        "Shampoo",
                      ),
                      _amenityRow(
                        Icons.water_drop_outlined,
                        "Hot water",
                      ),
                      _amenityRow(
                        Icons.local_drink_outlined,
                        "Shower gel",
                      ),
                    ],
                  ),

                  // Bedroom and laundry
                  _amenity(
                    "Bedroom and laundry",
                    [
                      _amenityRow(
                        Icons.wash_outlined,
                        "Free washer – In unit",
                      ),
                    ],
                  ),

                  // Parking and facilities
                  _amenity(
                    "Parking and facilities",
                    [
                      _amenityRow(
                        Icons.directions_car,
                        "Paid parking garage off premises",
                      ),
                      _amenityRow(
                        Icons.stairs_outlined,
                        "Single level home",
                        subAmenityName: "No stairs in home",
                      ),
                    ],
                  ),

                  // Services
                  _amenity(
                    "Services",
                    [
                      _amenityRow(
                        Icons.key,
                        "Host greets you",
                      ),
                    ],
                  ),

                  // Not included
                  _amenity(
                    "Not included",
                    [
                      _amenityRow(Icons.kitchen, "Kitchen", isStrikethrough: true,),
                      _amenityRow(Icons.air, "Air conditioning", isStrikethrough: true,),
                      _amenityRow(Icons.alarm_off_sharp, "Carbon monoxide alarm", subAmenityName: "There is no carbon monoxide detector on the property.", isStrikethrough: true,),
                      _amenityRow(Icons.privacy_tip_outlined, "Private entrance", isStrikethrough: true,),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openFullScreenMap() {
    Get.generalDialog(
      barrierLabel: "Close full-screen map",
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: AppColor.transparent,
          body: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(23.014509, 72.591759),
                  zoom: 12,
                ),
                zoomControlsEnabled: false,
              ),
              Positioned(
                top: context.screenHeight * 0.055,
                right: context.screenWidth * 0.043,
                child: CustomButton(
                  type: ButtonTypes.icon,
                  icon: Icon(
                    Icons.close,
                    color: AppColor.black,
                    size: context.screenWidth * 0.08,
                  ),
                  onPressed: () => Get.back(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // success dialog => report listing
  void successDialog(){
    Get.defaultDialog(
      title: "Help us improve",
      titleStyle: TextStyle(
        color: AppColor.black,
        fontWeight: FontWeight.w500,
        fontSize: 25,
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            _text("We want to hear what you think we can do better. We won’t be able to respond to every piece of feedback individually."),
            SizedBox(height: 10,),
            _text("If you have a question or need help resolving an issue, search our Help Center."),
            SizedBox(height: 20,),
            CustomButton(
              type: ButtonTypes.elevated,
              onPressed: (){},
              width: Get.width,
              text: 'Ok',
              textStyle: TextStyle(
                fontSize: 17,
              ),
              backgroundColor: AppColor.black,
            ),
          ],
        ),
      ),
    );
  }

  void bottomSheetReportListing(){
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColor.white,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            CustomButton(
              type: ButtonTypes.icon,
              padding: EdgeInsetsGeometry.only(right: 28),
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios_new,size: 20,),
            ),
            SizedBox(height: 15,),
            Text(
              "Why are you reporting this listing?",
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8,),
            Expanded(
                child: ListView.separated(
                  itemCount: 11,
                  itemBuilder: (context, index){
                    if(index == 0) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.lock,),
                              Text("This won’t be shared with the Host.")
                            ],
                          ),
                          SizedBox(height: 6,),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "It’s inaccurate or incorrect",
                              ),
                              Radio(
                                activeColor: AppColor.black,
                                value: true,
                                groupValue: true,
                                onChanged: (value){},
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "It’s inaccurate or incorrect",
                            ),
                            Radio(
                              activeColor: AppColor.black,
                              value: true,
                              groupValue: true,
                              onChanged: (value){},
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context,index){
                    return Divider();
                  },
                )
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                border: Border(
                  top: BorderSide(color: AppColor.black12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: CustomButton(
                  type: ButtonTypes.elevated,
                  onPressed: (){
                    successDialog();
                  },
                  width: Get.width,
                  text: 'Next',
                  textStyle: TextStyle(
                    fontSize: 17,
                  ),
                  backgroundColor: AppColor.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: FutureBuilder(
          future: controller.getDocumentById(propertyId),
          builder: (context, snapshot) {
            // no more condition needed.
            if (snapshot.hasData) {
              controller.currentIndexPropertyDetail.value = 0;
              return FutureBuilder(
                future: controller.getPropertyOwnerDetails(snapshot.data['uuid']),
                builder: (context, ownerData){
                  if(ownerData.hasData){
                    var hostingDate = DateTime.fromMillisecondsSinceEpoch(
                      ownerData.data['created_at'].seconds * 1000 + (ownerData.data['created_at'].nanoseconds ~/ 1000000),
                    );
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                spacing: 18,
                                children: [
                                  Stack(
                                    children: [
                                      CarouselSlider(
                                        items: snapshot.data['images'].isEmpty
                                            ? [
                                          InkWell(
                                            onTap: () {
                                              heroAnimation(context, "assets/images/Image-Not-Found.jpg");
                                            },
                                            child: Hero(
                                              tag: 'hero',
                                              child: CustomImage(
                                                path: 'assets/images/Image-Not-Found.jpg',
                                                fit: BoxFit.fill,
                                                width: Get.width,
                                              ),
                                            ),
                                          )
                                        ]
                                            : snapshot.data['images'].map<Widget>((url) {
                                          return InkWell(
                                            onTap: (){
                                              heroAnimation(context, url);
                                            },
                                            child: Hero(
                                              tag: 'hero',
                                              child: CustomImage(
                                                path: url,
                                                fit: BoxFit.cover,
                                                width: Get.width,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        options: CarouselOptions(
                                          viewportFraction: 1,
                                          height: 250,
                                          initialPage: 0,
                                          enableInfiniteScroll: false,
                                          onPageChanged: (index, reason) {
                                            controller.currentIndexPropertyDetail.value = index;
                                          },
                                        ),
                                      ),
                                      Positioned(
                                        top: 15,
                                        left: 13,
                                        child: CustomButton(
                                          type: ButtonTypes.icon,
                                          iconButtonStyle: ButtonStyle(
                                            iconSize: WidgetStatePropertyAll(20),
                                          ),
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: CircleAvatar(
                                            backgroundColor: AppColor.white,
                                            radius: 17,
                                            child: Icon(
                                              Icons.arrow_back_rounded,
                                              color: AppColor.black87,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 15,
                                        left: 285,
                                        child: CustomButton(
                                          type: ButtonTypes.icon,
                                          iconButtonStyle: ButtonStyle(
                                            iconSize: WidgetStatePropertyAll(10,),
                                          ),
                                          onPressed: () {
                                            SharePlus.instance.share(
                                              ShareParams(
                                                uri: Uri.parse(
                                                  "https://airbnb-a667b.web.app/#/explore/property-detail?id=$propertyId",
                                                ),
                                              ),
                                            );
                                          },
                                          icon: CircleAvatar(
                                            radius: 17,
                                            backgroundColor: AppColor.white,
                                            child: Icon(
                                              size: 20,
                                              Icons.share_outlined,
                                              color: AppColor.black87,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 15,
                                        left: 332,
                                        child: CustomButton(
                                          type: ButtonTypes.icon,
                                          iconButtonStyle: ButtonStyle(
                                            iconSize: WidgetStatePropertyAll(10),
                                          ),
                                          onPressed: () {},
                                          icon: CircleAvatar(
                                            radius: 17,
                                            backgroundColor: AppColor.white,
                                            child: Icon(
                                              size: 20,
                                              Icons.more_vert,
                                              color: AppColor.black87,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 215,
                                        left: 330,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadiusGeometry.circular(5),
                                            color: AppColor.white60,
                                          ),
                                          height: 20,
                                          width: 40,
                                          child: Center(
                                            child: Obx(
                                                  () => Text(
                                                "${controller.currentIndexPropertyDetail.value + 1}/${snapshot.data["images"].length}",
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 25,
                                    ),
                                    child: Column(
                                      spacing: 10,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // room name and reviews
                                        Column(
                                          spacing: 10,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data['title'] ?? 'title null',
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Column(
                                              spacing: 2,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  spacing: 3,
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      size: 20,
                                                    ),
                                                    Text(
                                                      '5.0 ·',
                                                    ),
                                                    Text(
                                                      '3 reviews',
                                                      style: TextStyle(
                                                        color: AppColor.black,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'Yonkers, New York, United States',
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Divider(),

                                        // host and how many rooms $ beds
                                        Column(
                                          spacing: 10,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Private room in home \nhosted by ${ownerData.data['first_name'] ?? "owner name null"}',
                                                  style: TextStyle(
                                                    fontSize: 23,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 60,
                                                  height: 60,
                                                  child: CircleAvatar(
                                                    backgroundColor: AppColor.black,
                                                    child: ownerData.data['profile_image'] == null
                                                      ? Text(
                                                          ownerData.data['first_name'][0],
                                                          style: TextStyle(
                                                            color: AppColor.white,
                                                            fontSize: 23,
                                                          ),
                                                        )
                                                      : CustomImage(
                                                          clipBehaviour: Clip.antiAlias,
                                                          boxDecoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(30),
                                                          ),
                                                          width: 60,
                                                          height: 60,
                                                          path: ownerData.data['profile_image'],
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Superhost ∙ from ${DateFormat('yyyy-MM-dd').format(hostingDate)}',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(),

                                        // self check in
                                        Column(
                                          spacing: 10,
                                          children: [
                                            Row(
                                              spacing: 10,
                                              children: [
                                                Icon(
                                                  Icons.door_back_door_outlined,
                                                  size: 30,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Self check-in',
                                                      style: TextStyle(
                                                        color: AppColor.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      'You can check in with the building staff.',
                                                      style: TextStyle(
                                                        color: AppColor.grey,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            Row(
                                              spacing: 10,
                                              children: [
                                                Icon(
                                                  Icons.date_range_outlined,
                                                  size: 30,
                                                ),
                                                Text(
                                                  'Free cancellation before Feb 12.',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Divider(),

                                        // air cover
                                        Column(
                                          spacing: 10,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "air",
                                                  style: TextStyle(
                                                    fontSize: 35,
                                                    color: AppColor.pink,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  "cover",
                                                  style: TextStyle(
                                                    fontSize: 35,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Every ,We’ve been so immersed in this world of drinking, and a lot of us have felt like there was nowhere to go...',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Learn more',
                                                  style: TextStyle(
                                                    decoration:
                                                    TextDecoration.underline,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Divider(),

                                        // about room
                                        Column(
                                          spacing: 10,
                                          children: [
                                            Text(
                                              'Immerse We’ve been so immersed in this world of drinking, and a lot of us have felt like there was nowhere to go...',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Row(
                                              spacing: 8,
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                    style: TextStyle(
                                                      decoration: TextDecoration.underline,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      color: AppColor.black,
                                                    ),
                                                    text: 'Show more',
                                                    recognizer: TapGestureRecognizer()
                                                      ..onTap = () => bottomSheetShowMore(snapshot.data['about_us']),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 16,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Divider(),

                                        // sleep
                                        Column(
                                          spacing: 15,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Where you\'ll sleep',
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsetsGeometry.all(15),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: AppColor.black12,
                                                ),
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                spacing: 3,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.bed_outlined,
                                                  ),
                                                  Text(snapshot.data['room'][index]['title'] ?? 'r1 null'),
                                                  Text(snapshot.data['room'][index]['subtitle'] ?? 'r2 null'),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Divider(),

                                        // place offers
                                        Column(
                                          spacing: 15,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'What this place offers',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 25,
                                              ),
                                            ),
                                            _dynamicIconTextRow(Icons.gradient_rounded,'Garden view',),
                                            _dynamicIconTextRow(Icons.leak_add,'Lake access',),
                                            _dynamicIconTextRow(Icons.kitchen,'Kitchen',),
                                            _dynamicIconTextRow(Icons.wifi,'Wifi',),
                                            _dynamicIconTextRow(Icons.alarm,'Carbon monoxide alarm',),
                                            CustomButton(
                                              type: ButtonTypes.outlined,
                                              onPressed: bottomSheetAmenities,
                                              outlineButtonStyle: OutlinedButton.styleFrom(
                                                minimumSize: Size(Get.width, 50),
                                                foregroundColor: AppColor.black,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadiusGeometry.circular(8),
                                                ),
                                              ),
                                              text: 'Show all 61 amenities',
                                              textStyle: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(),

                                        // map
                                        Column(
                                          spacing: 15,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Where you\'ll be',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 25,
                                              ),
                                            ),
                                            Container(
                                              height: 300,
                                              width: Get.width,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: AppColor.black12,
                                                ),
                                                borderRadius: BorderRadius.circular(25),
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      SizedBox(
                                                        height: 255,
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius.circular(25),
                                                          child: GoogleMap(
                                                            myLocationButtonEnabled: false,
                                                            zoomControlsEnabled: false,
                                                            initialCameraPosition: CameraPosition(
                                                              target: snapshot.data['location'] == null
                                                                  ? LatLng(22.9877, 72.4931)
                                                                  : LatLng(snapshot.data['location'][index]['latitude'],snapshot.data['location'][index]['longitude']),
                                                              zoom: 12.5,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 110,
                                                        left: 140,
                                                        child: TextButton(
                                                          style: ButtonStyle(
                                                            iconColor: WidgetStatePropertyAll(AppColor.red),
                                                            iconSize: WidgetStatePropertyAll(40),
                                                          ),
                                                          onPressed: openFullScreenMap,
                                                          child: Icon(
                                                            Icons.home,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                      horizontal: 23.0,
                                                      vertical: 10,
                                                    ),
                                                    child: Text(
                                                      'Exact location provided after booking.',
                                                      style: TextStyle(
                                                        color: AppColor.grey,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Yonkers, New York, United States',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Text(
                                                  'Located on a quiet suburban street.',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              spacing: 8,
                                              children: [
                                                Text(
                                                  'Show more',
                                                  style: TextStyle(
                                                    decoration:
                                                    TextDecoration.underline,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 16,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Divider(),

                                        // reviews container
                                        Column(
                                          spacing: 15,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                ),
                                                Text(
                                                  '5.0 · 3 Reviews',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                spacing: 20,
                                                children: [
                                                  _reviewContainer(),
                                                  _reviewContainer(),
                                                  _reviewContainer(),
                                                  _reviewContainer(),
                                                ],
                                              ),
                                            ),
                                            CustomButton(
                                              type: ButtonTypes.outlined,
                                              onPressed: () {
                                                Get.toNamed(Routes.review);
                                              },
                                              outlineButtonStyle:
                                              OutlinedButton.styleFrom(
                                                minimumSize: Size(Get.width, 50),
                                                foregroundColor: AppColor.black,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadiusGeometry.circular(8),
                                                ),
                                              ),
                                              text: 'Show all 206 reviews',
                                              textStyle: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(),

                                        // hosted by
                                        Column(
                                          spacing: 20,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Hosted by ${ownerData.data['first_name'] ?? "owner name null"}',
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Joined in July 2014',
                                                    )
                                                  ],
                                                ),
                                                ownerData.data['profile_image'] == null
                                                    ? CircleAvatar(
                                                  radius: 30,
                                                  backgroundColor: AppColor.black,
                                                  child: Text(
                                                    ownerData.data['first_name'][0],
                                                    style: TextStyle(
                                                      color: AppColor.white,
                                                      fontSize: 23,
                                                    ),
                                                  ),
                                                )
                                                    : CustomImage(
                                                        clipBehaviour: Clip.antiAlias,
                                                        boxDecoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(30),
                                                        ),
                                                        width: 60,
                                                        height: 60,
                                                        path: ownerData.data['profile_image'],
                                                      ),
                                              ],
                                            ),
                                            Column(
                                              spacing: 5,
                                              children: [
                                                _dynamicIconTextRow(Icons.star,'3 Reviews',),
                                                _dynamicIconTextRow(Icons.security,'Identity verified',),
                                              ],
                                            ),
                                            Column(
                                              spacing: 7,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Military: US Air Force Reserves',
                                                  style: TextStyle(
                                                    color: AppColor.black87,
                                                  ),
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: AppColor.black87,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: 'Civilian: Director of Distribution Operations at a NY Hospital...',
                                                      ),
                                                      TextSpan(
                                                        text: 'Read more',
                                                        style: TextStyle(
                                                          decoration: TextDecoration.underline,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              spacing: 8,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'During your stay',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Text(
                                                  'I will be available on site. When I\'m not on site you can reach me via text, phone or through Airbnb.',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              spacing: 5,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Language: English',
                                                ),
                                                Text(
                                                  'Response rate: 100%',
                                                ),
                                                Text(
                                                  'Responds within an hour',
                                                ),
                                              ],
                                            ),
                                            CustomButton(
                                              type: ButtonTypes.outlined,
                                              onPressed: () {},
                                              outlineButtonStyle:
                                              OutlinedButton.styleFrom(
                                                minimumSize: Size(Get.width, 50),
                                                foregroundColor: AppColor.black,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadiusGeometry.circular(8),
                                                ),
                                              ),
                                              text: 'Contact Host',
                                              textStyle: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'To protect your payment, never transfer money or\ncommunicate outside of the Airbnb website or app.',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.pentagon_outlined,
                                                  size: 30,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Divider(),

                                        // availability
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              spacing: 5,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Availability',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                                Text(
                                                  snapshot.data['available_dates'] ?? "available_dates null",
                                                ),
                                              ],
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                        Divider(),

                                        // house rules
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                spacing: 5,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'House rules',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 25,
                                                    ),
                                                  ),
                                                  Text(
                                                    snapshot.data['house_rules'] ?? 'house rules null',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                        Divider(),

                                        // health safety
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                spacing: 5,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Health & safety',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 25,
                                                    ),
                                                  ),
                                                  Text(
                                                    snapshot.data['safety_property'] ?? 'safety null',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                        Divider(),

                                        // cancellation
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                spacing: 5,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Cancellation policy',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 25,
                                                    ),
                                                  ),
                                                  Text(
                                                    snapshot.data['cancellation_policy'] ?? 'cancellation policy null',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                        Divider(),

                                        // report
                                        Row(
                                          spacing: 10,
                                          children: [
                                            Icon(
                                              Icons.flag,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                recognizer: TapGestureRecognizer()..onTap = (){
                                                  bottomSheetReportListing();
                                                },
                                                text: 'Report this listing',
                                                style: TextStyle(
                                                  color: AppColor.black,
                                                  decoration: TextDecoration.underline, // Underlines the text
                                                ),
                                              ),
                                            )

                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        // bottom reserve button
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            border: Border(
                              top: BorderSide(color: AppColor.black12),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '₹${snapshot.data['price']} night',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(snapshot.data['available_dates']),
                                  ],
                                ),
                                CustomButton(
                                  type: ButtonTypes.elevated,
                                  onPressed: () {},
                                  text: 'Reserve',
                                  height: 48,
                                  textStyle: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  if (!snapshot.hasData || snapshot.data.isEmpty) {
                    return Center(child: Text('Data not found'));
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: context.screenHeight / 1,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColor.green,
                        ),
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

Widget _dynamicIconTextRow(IconData icon,String text,){
  return Row(
    spacing: 10,
    children: [
      Icon(
        icon,
      ),
      Text(
        text,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    ],
  );
}

Widget _reviewContainer() {
  return SizedBox(
    height: 250,
    width: 280,
    child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: BoxBorder.all(color: AppColor.black12,),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 13,
          ),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 10,
                children: [
                  CustomImage(
                    clipBehaviour: Clip.antiAlias,
                    boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: 50,
                    height: 50,
                    path: "https://w0.peakpx.com/wallpaper/107/46/HD-wallpaper-best-pose-for-profile-for-men-profile-pose-men-best-glasses.jpg",
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Blair',),
                      Text('2 weeks ago',),
                    ],
                  )
                ],
              ),
              Text(
                'Sara and her family are great, she went above and beyond to make our stay wonderful. She was very welcoming and...',
              ),
            ],
          ),
        )),
  );
}

// amenities
Widget _amenity(String amenityTitle, List<Widget> rows) {
  return Column(
    spacing: 15,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        amenityTitle,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      ...rows, // unpack list in widget form
    ],
  );
}

Widget _amenityRow(
    IconData amenityIcon,
    String amenityName, {
      String? subAmenityName,
      bool isStrikethrough = false,
    }) {
  return Column(
    spacing: 15,
    children: [
      Row(
        spacing: 10,
        children: [
          Icon(
            amenityIcon,
            size: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                amenityName,
                style: TextStyle(
                  decoration:
                  isStrikethrough ? TextDecoration.lineThrough : null,
                  fontSize: 16,
                ),
              ),
              if (subAmenityName != null)
                Text(
                  subAmenityName,
                  style: TextStyle(
                    decoration:
                    isStrikethrough ? TextDecoration.lineThrough : null,
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        ],
      ),
      Divider(),
    ],
  );
}

Widget _text(String text){
  return Text(text);
}