import 'dart:io';
import 'package:airbnb/airbnb_global_imports.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ExploreScreenController extends GetxController {
  var activeDots = [].obs;
  void updateActiveDots(int homeI, int imageI) {
    activeDots[homeI] = imageI;
  }

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
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('places').get();

    Map<String, Map<String, dynamic>> documents = {};
    for (var doc in querySnapshot.docs) {
      documents[doc.id] = doc.data() as Map<String, dynamic>;
    }
    activeDots.value = List.generate(documents.length, (index) {
      return 0;
    });
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
            leading: IconButton(
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

  void openFullScreenMap(BuildContext context) {
    showGeneralDialog(
      context: context,
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
                child: IconButton(
                  iconSize: context.screenWidth * 0.08,
                  icon: Icon(
                    Icons.close,
                    color: AppColor.black,
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

  void bottomSheetShowMore(BuildContext context) {
    showBottomSheet(
      backgroundColor: AppColor.grey,
      elevation: 20,
      enableDrag: true,
      context: context,
      builder: (context) {
        return SizedBox(
          height: 750,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  IconButton(
                    padding: EdgeInsetsGeometry.only(right: 28),
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // About this place
                  Text(
                    "About this place",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Enjoy an elegant private room of 20 m2 in a renovated apartment of 160 m2 in the heart of the city center of Nantes in the Graslin district.",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "The charm of the old renovated: ceiling height of 3.60 m, period parquet, black marble fireplace, comfortable bathroom.",
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  // The Space
                  Text(
                    "The space",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                      Text(
                        "Push the door of this 1793 Haussmanian building. You will access a majestic hall and climb a wide stone staircase to the 3rd floor (no elevator).",
                      ),
                      Text(
                        "The bedroom sleeps 2. If you’re traveling with 1 adult, the La Graslin room in the same unit can possibly accommodate it depending on the availability of this room. See the listing “La Graslin” on my profile.",
                      ),
                      Text(
                        "You will be close to all the amenities of the city center: restaurants, cafes, the Graslin theater, grocery stores and all shops.",
                      ),
                      Text(
                        "The central point of public transport in Nantes (tram, bus, busway) is a 2-minute walk from the building.",
                      ),
                      Text(
                        "The train station is within 10 minutes by tram without change (3 stops to Commerce)For our friends who love soft mobility, a \"bicloo\" rental bike station is available at the foot of the building.",
                      ),
                      Text(
                        "The apartment is ideally located for your sightseeing tours: it is located 10 minutes from Machines de l 'Ile et des nefs, 2 minutes from Pommeray passage, Place Royale, a 10-minute walk from the Château des Ducs.You'll get to the Beaujoire Exhibition Center in 20 minutes by tram.",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void bottomSheetAmenities(BuildContext context) {
    showBottomSheet(
      context: context,
      backgroundColor: AppColor.white,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 45,),
                IconButton(
                  padding: EdgeInsetsGeometry.only(right: 28),
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 15,
                  children: [
                    Text(
                      "Amenities",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 27,
                      ),
                    ),

                    // Scenic views
                    _buildAmenity(
                      "Scenic views",
                      [
                        _buildAmenityRow(Icons.location_city, "City skyline view",),
                      ],
                    ),

                    // Bathroom
                    _buildAmenity(
                      "Bathroom",
                      [
                        _buildAmenityRow(Icons.hail_rounded, "Hair dryer",),
                        _buildAmenityRow(Icons.local_drink_outlined, "Shampoo",),
                        _buildAmenityRow(Icons.water_drop_outlined, "Hot water",),
                        _buildAmenityRow(Icons.local_drink_outlined, "Shower gel",),
                      ],
                    ),

                    // Bedroom and laundry
                    _buildAmenity(
                      "Bedroom and laundry",
                      [
                        _buildAmenityRow(Icons.wash_outlined, "Free washer – In unit",),
                      ],
                    ),

                    // Parking and facilities
                    _buildAmenity(
                      "Parking and facilities",
                      [
                        _buildAmenityRow(Icons.directions_car, "Paid parking garage off premises",),
                        Row(
                          spacing: 10,
                          children: [
                            Icon(
                              Icons.stairs_outlined,
                              size: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Single level home",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'No stairs in home',
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Divider(),
                      ],
                    ),


                    // Services
                    _buildAmenity(
                      "Services",
                      [
                        _buildAmenityRow(Icons.key, "Host greets you",),
                      ],
                    ),


                    // Not included
                    _buildAmenity(
                      "Not included",
                      [
                        _buildAmenityRow(Icons.kitchen, "Kitchen",),
                        _buildAmenityRow(Icons.air, "Air conditioning",),
                        Row(
                          spacing: 10,
                          children: [
                            Icon(
                              Icons.alarm_off_sharp,
                              size: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Carbon monoxide alarm",
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "There is no carbon monoxide detector on the property.",
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(),
                        _buildAmenityRow(Icons.privacy_tip_outlined, "Private entrance",),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAmenity(String amenityTitle, List<Widget> rows) {
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

  Widget _buildAmenityRow(IconData amenityIcon, String amenityName, {String? subAmenityName}) {
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
            Text(
              amenityName,
              style: TextStyle(
                // add condition
                // decoration: TextDecoration.lineThrough,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
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
      String authHeader =
          "Basic ${base64Encode(utf8.encode('$privateApiKey:'))}";

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
