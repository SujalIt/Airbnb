import 'dart:io';
import 'package:airbnb/airbnb_global_imports.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ExploreScreenController extends GetxController {

  var profileController = Get.find<ProfileController>();

  Future<void> addPlace(
    String name,
    String rating,
    // String imageUrl,
    String distance,
    String availableDates,
    String price,
  ) async {
    await FirebaseFirestore.instance.collection("places").add({
      "name": name,
      "price": price,
      // "image": imageUrl,
      "distance": distance,
      "available_dates": availableDates,
      "created_at": FieldValue.serverTimestamp(),
    });
  }

  Future<dynamic> getAllDocuments() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('places').get();

    Map<String, Map<String, dynamic>> documents = {};
    for (var doc in querySnapshot.docs) {
      documents[doc.id] = doc.data() as Map<String, dynamic>;
    }
    return documents;
  }

  // property detail screen
  Future<dynamic> getDocumentById(String documentId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('places')
          .doc(documentId)
          .get();
      if (documentSnapshot.exists) {
        final documentData = {
          'id': documentSnapshot.id,
          ...documentSnapshot.data() as Map<String, dynamic>
        };
        return documentData;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  var currentIndexPropertyDetail = 0.obs;

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
  // review screen
  TextEditingController searchController = TextEditingController();

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

  Widget _text(String text){
    return Text(text);
  }

  // imagekit.io website for image(places)
  Future<void> uploadImageToImageKit() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile == null) {
        Get.snackbar("Image not selected", 'Please select image');
        return;
      }

      Uint8List? imageBytes;
      String fileName = pickedFile.name;

      if (kIsWeb) {
        imageBytes = await pickedFile.readAsBytes();
      } else {
        File imageFile = File(pickedFile.path);
        imageBytes = await imageFile.readAsBytes();
      }

      // ImageKit API details
      String apiUrl = "https://upload.imagekit.io/api/v1/files/upload";
      String privateApiKey = "private_FanKyRKRVNogDW4OhBxa8L6e6/s=:";
      String authHeader = "Basic ${base64Encode(utf8.encode('$privateApiKey:'))}";

      var request = http.MultipartRequest("POST", Uri.parse(apiUrl));
      request.headers["Authorization"] = authHeader;

      request.fields["fileName"] = fileName;
      request.fields["useUniqueFilename"] = "false";
      request.fields["folder"] = "/dummy/folder/";
      request.fields["tags"] = "nice,copy,books";

      if (kIsWeb) {
        request.files.add(http.MultipartFile.fromBytes(
          "file",
          imageBytes,
          filename: fileName,
        ));
      } else {
        request.files.add(http.MultipartFile.fromBytes(
          "file",
          imageBytes,
          filename: fileName,
        ));
      }

      var response = await request.send();
      // String responseData = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // var jsonResponse = jsonDecode(responseData);
        Get.snackbar("Successfully uploaded", 'Great!');
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }
}
