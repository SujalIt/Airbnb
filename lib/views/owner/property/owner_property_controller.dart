import 'dart:io';
import 'package:airbnb/airbnb_global_imports.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class OwnerPropertyController extends GetxController {
  GlobalKey<FormState> fieldFormKey = GlobalKey<FormState>();
  TextEditingController propertyName = TextEditingController();
  TextEditingController propertyDistance = TextEditingController();
  TextEditingController availableDate = TextEditingController();
  TextEditingController propertyPrice = TextEditingController();
  TextEditingController propertyRatings = TextEditingController();

  var isLoading = false.obs;

  // for multiple images
  var multipleImages = [].obs;
  var svgStrings = [].obs;
  var multiplePickedFiles = [];

  Future<void> pickImages() async {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)){
      final picker = ImagePicker();

      multiplePickedFiles = await picker.pickMultiImage();

      if(multiplePickedFiles.isNotEmpty){
        multipleImages.clear();
        svgStrings.clear();
        for(var file in multiplePickedFiles){
          if(file.path.toLowerCase().endsWith('.svg')){
            svgStrings.add(await File(file.path).readAsString());
          }else{
            multipleImages.add(File(file.path));
          }
        }
      }
    }
  }

  void addNewPropertyForm() {
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColor.white,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
        child: Form(
          key: fieldFormKey,
          child: SingleChildScrollView(
            child: Column(
              spacing: 15,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title
                Text(
                  "Add Property Details",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 27,
                  ),
                ),
                // name
                TextFormField(
                  controller: propertyName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hint: Text(
                      'Enter name',
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                ),
                // distance
                TextFormField(
                  controller: propertyDistance,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hint: Text(
                      'Enter distance',
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter distance';
                    }
                    return null;
                  },
                ),
                // available dates
                TextFormField(
                  controller: availableDate,
                  decoration: InputDecoration(
                    hintText: 'Enter available dates eg. 14-20 Dec',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter available dates!';
                    }
                    return null;
                  },
                ),
                // price
                TextFormField(
                  controller: propertyPrice,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hint: Text(
                      'Enter price',
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter price';
                    }
                    return null;
                  },
                ),
                // images
                // TextFormField(
                //   // controller: controller.propertyPrice,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     hint: Text(
                //       'Select images',
                //     ),
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please select images!';
                //     }
                //     return null;
                //   },
                // ),

                // CustomImage(
                //   path: '',
                //   width: 100,
                //   height: 100,
                //   fit: BoxFit.cover,
                // ),

                // multi
                Column(
                  children: [
                    Obx(() {
                      if (multipleImages.isNotEmpty) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: multipleImages.map((file) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(10),
                                  child: Image.file(
                                    file,
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stacktrace) {
                                      return Icon(Icons.broken_image);
                                    },
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      } else if (svgStrings.isNotEmpty) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: svgStrings.map((svg) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(10),
                                  child: SvgPicture.string(
                                    svg,
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                    placeholderBuilder: (context) => CircularProgressIndicator(),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      } else {
                        return Text(
                          'No images selected.',
                          style: TextStyle(fontSize: 16,),
                        );
                      }
                    }),
                    SizedBox(height: 20),
                    CustomButton(
                      type: ButtonTypes.elevated,
                      onPressed: () => pickImages(),
                      text: 'Pick Images',
                    ),
                  ],
                ),

                //

                // ratings
                TextFormField(
                  controller: propertyRatings,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hint: Text(
                      'Enter ratings',
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter ratings';
                    }
                    return null;
                  },
                ),

                // add button
                Obx(()=> CustomButton(
                    type: ButtonTypes.elevated,
                    isLoading: isLoading.value,
                    onPressed: () {
                      if (fieldFormKey.currentState!.validate()) {
                        uploadImagesToImageKit();
                      }
                    },
                    width: Get.width,
                    text: "Add",
                    textStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  var firebaseUrls = [].obs;

  // upload image to imagekit and add property in firebase
  Future<void> uploadImagesToImageKit() async {
    try {
      isLoading.value = true;
      firebaseUrls.clear();
      if (multiplePickedFiles.isEmpty) {
        Get.snackbar("No images selected", 'Please select at least one image',backgroundColor: AppColor.pink,);
        return;
      }
      // ImageKit API details
      String apiUrl = "https://upload.imagekit.io/api/v1/files/upload";
      String privateApiKey = "private_FanKyRKRVNogDW4OhBxa8L6e6/s=:"; // Replace with your private key
      String authHeader = "Basic ${base64Encode(utf8.encode('$privateApiKey:'))}";

      var response;
      for (var pickedFile in multiplePickedFiles) {
        Uint8List? imageBytes;
        String fileName = pickedFile.name;

        if (kIsWeb) {
          imageBytes = await pickedFile.readAsBytes();
        } else {
          File imageFile = File(pickedFile.path);
          imageBytes = await imageFile.readAsBytes();
        }

        var request = http.MultipartRequest("POST", Uri.parse(apiUrl));
        request.headers["Authorization"] = authHeader;

        request.fields["fileName"] = fileName;
        request.fields["useUniqueFilename"] = "false";
        request.fields["folder"] = "/dummy/test/";
        request.fields["tags"] = "nice,copy,books";

        request.files.add(http.MultipartFile.fromBytes(
          "file",
          imageBytes!,
          filename: fileName,
        ));

        response = await request.send();
        String responseData = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseData);
        firebaseUrls.add(jsonResponse['url']);
      }

      if (response.statusCode == 200) {
        addPlace();
        // Get.snackbar("Successfully uploaded",'great',backgroundColor: AppColor.pink);
      } else {
        Get.snackbar("Something went wrong",'Error...Try again!');
      }
      isLoading.value = false;
      Get.back();
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }

  Future<void> addPlace() async {
    try{
      isLoading.value = true;
      await FirebaseFirestore.instance.collection("places").doc(FirebaseAuth.instance.currentUser!.uid).set({
        "name": propertyName.text,
        "price": propertyPrice.text,
        "images": firebaseUrls,
        "distance": propertyDistance.text,
        "available_dates": availableDate.text,
        "uuid": FirebaseAuth.instance.currentUser!.uid.toString(),
        "created_at": FieldValue.serverTimestamp(),
      });
      isLoading.value = false;
      Get.back();
      SmartAlert.customSnackBar(title: 'Done', desc: "Saved");
    }catch (e){
      SmartAlert.customSnackBar(title: "Failed", desc: '$e');
    }
  }

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
}
