import 'dart:io';
import 'package:airbnb/airbnb_global_imports.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class OwnerPropertyController extends GetxController {

  var isLoading = false.obs;

  GlobalKey<FormState> addPropertyFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> editPropertyFormKey = GlobalKey<FormState>();

  // add form -> controllers
  TextEditingController propertyName = TextEditingController();
  TextEditingController propertyDistance = TextEditingController();
  TextEditingController availableDate = TextEditingController();
  TextEditingController propertyPrice = TextEditingController();
  TextEditingController propertyRatings = TextEditingController();

  // edit form -> controllers
  TextEditingController editPropertyName = TextEditingController();
  TextEditingController editPropertyDistance = TextEditingController();
  TextEditingController editAvailableDate = TextEditingController();
  TextEditingController editPropertyPrice = TextEditingController();
  TextEditingController editPropertyRatings = TextEditingController();

  // for multiple images
  var pickedImagesForUI = [].obs;
  var pickedSvgImagesForUI = [].obs;
  var multiplePickedFiles = []; // variable make outside -> for using in uploadImage method

  Future<void> pickImages() async {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      final picker = ImagePicker();

      multiplePickedFiles = await picker.pickMultiImage();

      if (multiplePickedFiles.isNotEmpty) {
        for (var file in multiplePickedFiles) {
          if (file.path.toLowerCase().endsWith('.svg')) {
            pickedSvgImagesForUI.add(await File(file.path).readAsString());
          } else {
            pickedImagesForUI.add(File(file.path));
          }
        }
      }
    }
  }


  // selected images url ..to upload in firebase
  var imageUrlsToUpload = [].obs;

  // upload image to imagekit , add property in firebase and edit property update in firebase
  Future<void> uploadImagesToImageKit({required bool isAdd}) async {
    try {
      isLoading.value = true;
      imageUrlsToUpload.clear();
      if (multiplePickedFiles.isEmpty) {
        Get.snackbar(
          "No images selected",
          'Please select at least one image',
          backgroundColor: AppColor.pink,
        );
        return;
      }
      // ImageKit API details
      String apiUrl = "https://upload.imagekit.io/api/v1/files/upload";
      String privateApiKey = "private_FanKyRKRVNogDW4OhBxa8L6e6/s=:";
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
        request.fields["folder"] = "/dummy/test/";

        request.files.add(http.MultipartFile.fromBytes(
          "file",
          imageBytes!,
          filename: fileName,
        ));

        response = await request.send();
        String responseData = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseData);
        imageUrlsToUpload.add(jsonResponse['url']);
      }

      if (response.statusCode == 200) {
        if (isAdd == true) {
          addProperty();
        }
        updateOwnerPropertyDetails();
      } else {
        SmartAlert.customSnackBar(
          title: "Something went wrong",
          desc: 'Error...Try again!',
        );
      }
      Get.back();
    } catch (e) {
      SmartAlert.customSnackBar(title: 'Error..Please try again', desc: '$e');
    } finally {
      isLoading.value = false;
    }
  }

  // add new property
  void addNewPropertyForm() {
    propertyName.clear();
    propertyDistance.clear();
    availableDate.clear();
    propertyPrice.clear();
    propertyRatings.clear();
    pickedImagesForUI.clear();
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColor.white,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
        child: Form(
          key: addPropertyFormKey,
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


                // image selection
                Column(
                  children: [
                    Obx(() {
                      if (pickedImagesForUI.isNotEmpty) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: pickedImagesForUI.map((file) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadiusGeometry.circular(10),
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
                      } else if (pickedSvgImagesForUI.isNotEmpty) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: pickedSvgImagesForUI.map((svg) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadiusGeometry.circular(10),
                                  child: SvgPicture.string(
                                    svg,
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                    placeholderBuilder: (context) =>
                                        CircularProgressIndicator(),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      } else {
                        return Text(
                          'No images selected.',
                          style: TextStyle(
                            fontSize: 16,
                          ),
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

                // add button
                Obx(
                      () => CustomButton(
                    type: ButtonTypes.elevated,
                    isLoading: isLoading.value,
                    onPressed: () {
                      if (addPropertyFormKey.currentState!.validate()) {
                        uploadImagesToImageKit(isAdd: true);
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

  Future<void> addProperty() async {
    try {
      isLoading.value = true;
      await FirebaseFirestore.instance
          .collection("places")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "name": propertyName.text,
        "price": propertyPrice.text,
        "images": imageUrlsToUpload,
        "distance": propertyDistance.text,
        "available_dates": availableDate.text,
        "rating": propertyRatings.text,
        "uuid": FirebaseAuth.instance.currentUser!.uid.toString(),
        "created_at": FieldValue.serverTimestamp(),
      });
      Get.back();
      SmartAlert.customSnackBar(
          title: 'Property added Successfully',
          desc: "Now you can see your properties.");
    } catch (e) {
      SmartAlert.customSnackBar(title: "Failed..Try again", desc: '$e');
    } finally {
      isLoading.value = false;
    }
  }

  // edit property
  Future<dynamic> fetchOwnerPropertyDetails() async {
    try {
      try {
        var userId = await FirebaseFirestore.instance
            .collection('places')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();
        return userId.data();
      } on FirebaseFirestore catch (e) {
        SmartAlert.customSnackBar(
          title: 'Error!',
          desc: 'Something went wrong.',
        );
      }
    } on FirebaseFirestore catch (e) {
      SmartAlert.customSnackBar(
        title: 'Error!',
        desc: 'Something went wrong.',
      );
    }
  }

  var ownerPropertyImagesFromFirebase = [].obs;

  void editPropertyForm() {
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColor.white,
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: editPropertyFormKey,
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: fetchOwnerPropertyDetails(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error"),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  editPropertyName.text = snapshot.data['name'] ?? "name";
                  editPropertyDistance.text = snapshot.data['distance'] ?? "distance";
                  editAvailableDate.text = snapshot.data['available_dates'] ?? "availableDate";
                  editPropertyPrice.text = snapshot.data['price'] ?? "price";
                  editPropertyRatings.text = snapshot.data['rating'] ?? "rating";
                  ownerPropertyImagesFromFirebase.clear();
                  ownerPropertyImagesFromFirebase.addAll(List.from(snapshot.data['images'])); // ensuring list<dynamic>

                  pickedImagesForUI.clear();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      // title
                      Text(
                        "Edit Property Details",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 27,
                        ),
                      ),
                      // name
                      TextFormField(
                        controller: editPropertyName,
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
                        controller: editPropertyDistance,
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
                        controller: editAvailableDate,
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
                        controller: editPropertyPrice,
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
                      // ratings
                      TextFormField(
                        controller: editPropertyRatings,
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

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Obx(()=> Row(
                                children: ownerPropertyImagesFromFirebase.map((file) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Stack(children: [
                                      ClipRRect(
                                        borderRadius: BorderRadiusGeometry.circular(10),
                                        child: CustomImage(
                                          path: '$file',
                                          height: 150,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 55,
                                        left: 50,
                                        child: CustomButton(
                                          type: ButtonTypes.icon,
                                          onPressed: () {
                                            deleteConfirmDialog(file);
                                          },
                                          icon: Icon(
                                            Icons.delete_outline,
                                          ),
                                        ),
                                      ),
                                    ]),
                                  );
                                }).toList(),
                              ),
                            ),

                            Obx(() {
                              if (pickedImagesForUI.isNotEmpty) {
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: pickedImagesForUI.map((file) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            right: 15.0),
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadiusGeometry
                                              .circular(10),
                                          child: Image.file(
                                            file,
                                            height: 150,
                                            width: 150,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error,
                                                stacktrace) {
                                              return Icon(
                                                  Icons.broken_image);
                                            },
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                );
                              } else if (pickedSvgImagesForUI.isNotEmpty) {
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: pickedSvgImagesForUI.map((svg) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            right: 15.0),
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadiusGeometry
                                              .circular(10),
                                          child: SvgPicture.string(
                                            svg,
                                            height: 150,
                                            width: 150,
                                            fit: BoxFit.cover,
                                            placeholderBuilder: (context) =>
                                                CircularProgressIndicator(),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                );
                              } else {
                                return Text('',);
                              }
                            }),
                          ],
                        ),
                      ),

                      CustomButton(
                        type: ButtonTypes.elevated,
                        onPressed: () => pickImages(),
                        text: 'Add new Images',
                      ),
                      Obx(
                        () => CustomButton(
                          type: ButtonTypes.elevated,
                          isLoading: isLoading.value,
                          onPressed: () {
                            if (editPropertyFormKey.currentState!.validate()) {
                              if (pickedImagesForUI.isNotEmpty) {
                                uploadImagesToImageKit(isAdd: false);
                              }
                            }
                          },
                          width: Get.width,
                          text: "Save",
                          textStyle: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return Center(
                  child: Text("No data found."),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void deleteImageFromFirebase(String fileUrl) async {
    try {
      isLoading.value = true;
      await FirebaseFirestore.instance
          .collection('places')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update(
        {
          'images': FieldValue.arrayRemove([fileUrl]),
        },
      );
    } on FirebaseFirestore catch (e) {
      SmartAlert.customSnackBar(title: 'Failed..Please try again', desc: 'Delete again');
    } finally {
      isLoading.value = false;
      Get.back();
    }
  }

  void deleteConfirmDialog(String fileUrl) {
    Get.defaultDialog(
        title: "Are you sure you want to delete this image?",
        middleText: '',
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                isLoading: isLoading.value,
                type: ButtonTypes.elevated,
                text: 'Cancel',
                backgroundColor: AppColor.black,
                onPressed: () => Get.back(),
              ),
              CustomButton(
                isLoading: isLoading.value,
                type: ButtonTypes.elevated,
                text: 'Yes',
                backgroundColor: AppColor.black,
                width: 90,
                onPressed: () {
                  deleteImageFromFirebase(fileUrl);
                  ownerPropertyImagesFromFirebase.remove(fileUrl);
                },
              ),
            ],
          ),
        ]
    );
  }

  // update property details method
  Future<void> updateOwnerPropertyDetails() async {
    try {
      isLoading.value = true;
      await FirebaseFirestore.instance
          .collection('places')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update(
        {
          "name": editPropertyName.text,
          "price": editPropertyPrice.text,
          "images": FieldValue.arrayUnion(imageUrlsToUpload),
          "distance": editPropertyDistance.text,
          "available_dates": editAvailableDate.text,
          "rating": editPropertyRatings.text,
          "uuid": FirebaseAuth.instance.currentUser!.uid.toString(),
          "created_at": FieldValue.serverTimestamp(),
        },
      );
      Get.back();
    } on FirebaseFirestore catch (e) {
      SmartAlert.customSnackBar(
        title: 'Error!',
        desc: 'Something went wrong.',
      );
    } finally {
      isLoading.value = false;
    }
  }

  // owner all properties
  Stream<dynamic> getAllDocumentById(String documentId) {
    try {
      return FirebaseFirestore.instance
          .collection('places')
          .doc(documentId)
          .snapshots()
          .map((DocumentSnapshot snapshot) {
        return snapshot.data();
      });
    } catch (e) {
      return Stream.error('Something went wrong.');
    }
  }
}

Widget _customTextFormField(){
  return TextFormField(

  );
}
