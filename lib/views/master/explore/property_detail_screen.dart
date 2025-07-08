import 'package:airbnb/airbnb_global_imports.dart';

class PropertyDetailScreen extends GetView<ExploreScreenController> {
  var propertyId;

  PropertyDetailScreen({
    super.key,
    required this.propertyId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: FutureBuilder<dynamic>(
          future: controller.getDocumentById(propertyId),
          builder: (context, snapshot) {
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
            else if (snapshot.hasData) {
              controller.currentIndexPropertyDetail.value = 0;
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: 18,
                        children: [
                          Stack(
                            children: [
                              CarouselSlider(
                                items: snapshot.data['particular_multiple_images'].map<Widget>((url) {
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
                                    controller.currentIndexPropertyDetail
                                        .value = index;
                                  },
                                ),
                              ),
                              Positioned(
                                top: 15,
                                left: 13,
                                child: IconButton(
                                  style: ButtonStyle(
                                    iconSize: WidgetStatePropertyAll(
                                      10,
                                    ),
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
                                child: IconButton(
                                  style: ButtonStyle(
                                    iconSize: WidgetStatePropertyAll(
                                      10,
                                    ),
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
                                child: IconButton(
                                  style: ButtonStyle(
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
                                        "${controller.currentIndexPropertyDetail.value + 1}/${snapshot.data["particular_multiple_images"].length}",
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
                                      'Experience Authentic Peru! Spacious Country House',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Column(
                                      spacing: 2,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          'Private room in home \nhosted by Craig',
                                          style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        CustomImage(
                                          clipBehaviour: Clip.antiAlias,
                                          boxDecoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          width: 50,
                                          height: 50,
                                          path: "https://w0.peakpx.com/wallpaper/107/46/HD-wallpaper-best-pose-for-profile-for-men-profile-pose-men-best-glasses.jpg",
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '2 guests - 1 bedrooms - 1 beds - 1 private bath',
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
                                                ..onTap = () {
                                                  controller.bottomSheetShowMore(context);
                                                }

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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.bed_outlined,
                                          ),
                                          Text('Bedroom'),
                                          Text('1 queen bed'),
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
                                    Row(
                                      spacing: 10,
                                      children: [
                                        Icon(
                                          Icons.gradient_rounded,
                                        ),
                                        Text(
                                          'Garden view',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      spacing: 10,
                                      children: [
                                        Icon(
                                          Icons.leak_add,
                                        ),
                                        Text(
                                          'Lake access',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      spacing: 10,
                                      children: [
                                        Icon(
                                          Icons.kitchen,
                                        ),
                                        Text(
                                          'Kitchen',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      spacing: 10,
                                      children: [
                                        Icon(
                                          Icons.wifi,
                                        ),
                                        Text(
                                          'Wifi',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      spacing: 10,
                                      children: [
                                        Icon(
                                          Icons.alarm,
                                        ),
                                        Text(
                                          'Carbon monoxide alarm',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomButton(
                                      type: ButtonTypes.outlined,
                                      onPressed: () {
                                        controller.bottomSheetAmenities(context);
                                      },
                                      outlineButtonStyle: OutlinedButton.styleFrom(
                                        minimumSize: Size(Get.width, 50),
                                        foregroundColor: AppColor.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(8),
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
                                                      target: LatLng(23.014509, 72.591759),
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
                                                  onPressed: () => controller.openFullScreenMap(context),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          width: 50,
                                          height: 50,
                                          path:
                                              "https://w0.peakpx.com/wallpaper/107/46/HD-wallpaper-best-pose-for-profile-for-men-profile-pose-men-best-glasses.jpg",
                                        ),
                                      ],
                                    ),
                                    Column(
                                      spacing: 5,
                                      children: [
                                        Row(
                                          spacing: 10,
                                          children: [
                                            Icon(
                                              Icons.star,
                                            ),
                                            Text(
                                              '3 Reviews',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          spacing: 10,
                                          children: [
                                            Icon(
                                              Icons.security,
                                            ),
                                            Text(
                                              'Identity verified',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      spacing: 5,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Availability',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 25,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data['available_dates'],
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      spacing: 5,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'House rules',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 25,
                                          ),
                                        ),
                                        Text(
                                          'Check-in: After 10:00 PM',
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      spacing: 5,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Health & safety',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 25,
                                          ),
                                        ),
                                        Text(
                                          'Airbnb\'s COVID-19 safety practices apply \nSecurity camera/recording device',
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      spacing: 5,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Cancellation policy',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 25,
                                          ),
                                        ),
                                        Text(
                                          'Free cancellation before 20 Feb.\nCancel before check-in on 25 Feb for a partial \nrefund. Review this Host\' full policy for details.',
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
                                    Text(
                                      'Report this listing',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Wrap(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          border: Border(
                            top: BorderSide(color: AppColor.black12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
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
                  )
                ],
              );
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No documents found'));
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
