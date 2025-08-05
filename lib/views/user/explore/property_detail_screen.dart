import 'package:airbnb/airbnb_global_imports.dart';
import 'package:intl/intl.dart';

class PropertyDetailScreen extends GetView<ExploreScreenController> {
  var propertyId;

  PropertyDetailScreen({
    super.key,
    required this.propertyId,
  });

  void bottomSheetShowMore() {
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColor.white,
      SizedBox(
        height: 750,
        child: SingleChildScrollView(
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
                  icon: Icon(Icons.cancel_outlined,size: 27,),
                ),
                SizedBox(
                  height: 15,
                ),
                // About this place
                Text(
                  "About this place",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                _textShowMore(
                  "Enjoy an elegant private room of 20 m2 in a renovated apartment of 160 m2 in the heart of the city center of Nantes in the Graslin district.",
                ),
                SizedBox(
                  height: 10,
                ),
                _textShowMore(
                  "The charm of the old renovated: ceiling height of 3.60 m, period parquet, black marble fireplace, comfortable bathroom.",
                ),
                SizedBox(
                  height: 18,
                ),
                // The Space
                Text(
                  "The space",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Column(
                  spacing: 10,
                  children: [
                    _textShowMore(
                      "Push the door of this 1793 Haussmanian building. You will access a majestic hall and climb a wide stone staircase to the 3rd floor (no elevator).",
                    ),
                    _textShowMore(
                      "The bedroom sleeps 2. If you’re traveling with 1 adult, the La Graslin room in the same unit can possibly accommodate it depending on the availability of this room. See the listing “La Graslin” on my profile.",
                    ),
                    _textShowMore(
                      "You will be close to all the amenities of the city center: restaurants, cafes, the Graslin theater, grocery stores and all shops.",
                    ),
                    _textShowMore(
                      "The central point of public transport in Nantes (tram, bus, busway) is a 2-minute walk from the building.",
                    ),
                    _textShowMore(
                      "The train station is within 10 minutes by tram without change (3 stops to Commerce)For our friends who love soft mobility, a \"bicloo\" rental bike station is available at the foot of the building.",
                    ),
                    _textShowMore(
                      "The apartment is ideally located for your sightseeing tours: it is located 10 minutes from Machines de l 'Ile et des nefs, 2 minutes from Pommeray passage, Place Royale, a 10-minute walk from the Château des Ducs.You'll get to the Beaujoire Exhibition Center in 20 minutes by tram.",
                    ),
                  ],
                )
              ],
            ),
          ),
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
                                              controller.heroAnimation(context, "assets/images/Image-Not-Found.jpg");
                                            },
                                            child: Hero(
                                              tag: 'hero',
                                              child: CustomImage(
                                                path: 'assets/images/Image-Not-Found.jpg',
                                                fit: BoxFit.cover,
                                                width: Get.width,
                                              ),
                                            ),
                                          )
                                        ]
                                            : snapshot.data['images'].map<Widget>((url) {
                                          return InkWell(
                                            onTap: (){
                                              controller.heroAnimation(context, url);
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
                                            iconSize: WidgetStatePropertyAll(10),
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
                                                  width: 50,
                                                  height: 50,
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
                                                          width: 50,
                                                          height: 50,
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
                                                      ..onTap = bottomSheetShowMore,
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
                                              onPressed: controller.bottomSheetAmenities,
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
                                                              target: LatLng(snapshot.data['location'][index]['latitude'] ?? 22.9877,snapshot.data['location'][index]['longitude'] ?? 72.4931),
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
                                                          onPressed: controller.openFullScreenMap,
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
                                                  CustomContainerParticularHome(),
                                                  CustomContainerParticularHome(),
                                                  CustomContainerParticularHome(),
                                                  CustomContainerParticularHome(),
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
                                                      'Hosted by Craig',
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
                                                CustomImage(
                                                  clipBehaviour: Clip.antiAlias,
                                                  boxDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(30),
                                                  ),
                                                  width: 50,
                                                  height: 50,
                                                  path: "https://w0.peakpx.com/wallpaper/107/46/HD-wallpaper-best-pose-for-profile-for-men-profile-pose-men-best-glasses.jpg",
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
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
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
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
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
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
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
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          spacing: 10,
                                          children: [
                                            Icon(
                                              Icons.flag,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                recognizer: TapGestureRecognizer()..onTap = (){
                                                  controller.bottomSheetReportListing();
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

Widget _textShowMore(String text){
  return Text(text);
}
