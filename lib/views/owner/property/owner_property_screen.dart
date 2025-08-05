import 'package:airbnb/airbnb_global_imports.dart';

class OwnerPropertyScreen extends GetView<OwnerPropertyController> {
  const OwnerPropertyScreen({super.key});

  // add new property form
  void addNewPropertyForm() {
    controller.clearAddFormFields();
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColor.white,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12),
        child: Form(
          key: controller.addPropertyFormKey,
          child: Padding(
            padding: EdgeInsetsGeometry.only(
              top: 18,
            ),
            child: SingleChildScrollView(
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),

                  CustomButton(
                    type: ButtonTypes.icon,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.back();
                    },
                  ),

                  // title
                  Text(
                    "Add Property Details",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 27,
                    ),
                  ),
                  // name
                  CustomTextFormField(
                    controller: controller.name,
                    hintText: 'Enter name',
                    labelText: 'Enter name',
                    validatorText: 'Please enter name',
                  ),
                  // distance
                  CustomTextFormField(
                    controller: controller.distance,
                    hintText: 'Enter distance',
                    labelText: 'Enter distance',
                    validatorText: 'Please enter distance',
                  ),
                  // available dates
                  CustomTextFormField(
                    controller: controller.availableDate,
                    labelText: 'Enter date',
                    hintText: 'Enter available dates eg. 14-20 Dec',
                    validatorText: 'Please enter available dates!',
                  ),
                  // price
                  CustomTextFormField(
                    controller: controller.price,
                    hintText: 'Enter price',
                    labelText: 'Enter price',
                    validatorText: 'Please enter price',
                  ),
                  // ratings
                  CustomTextFormField(
                    controller: controller.ratings,
                    hintText: 'Enter ratings',
                    labelText: 'Enter ratings',
                    validatorText: 'Please enter ratings',
                  ),

                  // image selection
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() {
                        if (controller.pickedImagesForUI.isNotEmpty) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children:
                                  controller.pickedImagesForUI.map((file) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Stack(children: [
                                    // custom image(this is for single image) not use ...
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(10),
                                      child: Image.file(
                                        file,
                                        height: 150,
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      top: 55,
                                      left: 50,
                                      child: CustomButton(
                                        iconButtonStyle: IconButton.styleFrom(
                                            backgroundColor: AppColor.red),
                                        type: ButtonTypes.icon,
                                        onPressed: () {
                                          controller.pickedImagesForUI
                                              .remove(file);
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
                          );
                        } else if (controller.pickedSvgImagesForUI.isNotEmpty) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children:
                                  controller.pickedSvgImagesForUI.map((svg) {
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
                        onPressed: () => controller.pickImages(),
                        text: 'Pick Images',
                      ),
                    ],
                  ),

                  // property title
                  CustomTextFormField(
                    controller: controller.title,
                    labelText: 'Property-Title',
                    hintText: 'Enter title',
                    validatorText: 'Please enter title',
                  ),
                  // about us
                  CustomTextFormField(
                    controller: controller.aboutUs,
                    labelText: 'About-Us',
                    hintText: 'Enter description',
                    validatorText: 'Please enter description',
                  ),
                  // room title
                  CustomTextFormField(
                    controller: controller.roomTitle,
                    labelText: 'Room-Title',
                    hintText: 'Enter title',
                    validatorText: 'Please enter room title',
                  ),
                  // room subtitle
                  CustomTextFormField(
                    controller: controller.roomSubtitle,
                    labelText: 'Room-Subtitle',
                    hintText: 'Enter subtitle',
                    validatorText: 'Please enter subtitle',
                  ),

                  // property address
                  CustomTextFormField(
                    controller: controller.address,
                    labelText: 'Address',
                    hintText: 'Enter address',
                    keyboardType: TextInputType.streetAddress,
                    validatorText: 'Please enter address',
                  ),
                  // location link
                  CustomTextFormField(
                    controller: controller.link,
                    labelText: 'Location Link',
                    hintText: 'Enter link',
                    keyboardType: TextInputType.url,
                    validatorText: 'Please enter link',
                  ),
                  // state
                  DropdownButtonFormField(
                    hint: Text("Select State"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: "Gujarat",
                        child: Text("Gujarat"),
                      ),
                      DropdownMenuItem(
                        value: "Rajasthan",
                        child: Text("Rajasthan"),
                      ),
                      DropdownMenuItem(
                        value: "Uttar Pradesh",
                        child: Text("Uttar Pradesh"),
                      ),
                    ],
                    onChanged: (value) {
                      controller.state.text = value ?? "state null";
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select state';
                      }
                      return null;
                    },
                  ),
                  // city
                  DropdownButtonFormField(
                    hint: Text("Select City"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: "Ahmedabad",
                        child: Text("Ahmedabad"),
                      ),
                      DropdownMenuItem(
                        value: "Surat",
                        child: Text("Surat"),
                      ),
                      DropdownMenuItem(
                        value: "Rajkot",
                        child: Text("Rajkot"),
                      ),
                    ],
                    onChanged: (value) {
                      controller.city.text = value ?? "city null";
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select city';
                      }
                      return null;
                    },
                  ),
                  // pin code
                  CustomTextFormField(
                    controller: controller.pincode,
                    labelText: 'Pin code',
                    hintText: 'Enter pin code eg.382210',
                    keyboardType: TextInputType.number,
                    validatorText: 'Please enter pin code',
                  ),

                  // location map
                  CustomTextFormField(
                    controller: controller.latitude,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    labelText: 'location latitude',
                    hintText: 'eg. 22.9742°',
                    validatorText: 'Please enter latitude',
                  ),
                  CustomTextFormField(
                    controller: controller.longitude,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    labelText: 'location longitude',
                    hintText: 'eg. 72.4971°',
                    validatorText: 'Please enter longitude',
                  ),

                  // cancellation policy
                  CustomTextFormField(
                    controller: controller.cancellationPolicy,
                    labelText: 'Cancellation-Policy',
                    hintText: 'Enter policy',
                    validatorText: 'Please enter policy',
                  ),
                  // house rules
                  CustomTextFormField(
                    controller: controller.houseRules,
                    labelText: 'House-Rules',
                    hintText: 'Enter house rules',
                    validatorText: 'Please enter rules',
                  ),
                  // safety & property
                  CustomTextFormField(
                    controller: controller.safetynProperty,
                    labelText: 'Safety-Property',
                    hintText: 'Enter safety&property',
                    validatorText: 'Please enter details',
                  ),

                  Obx(
                    () => CustomButton(
                      type: ButtonTypes.elevated,
                      isLoading: controller.isLoading.value,
                      onPressed: () {
                        if (controller.addPropertyFormKey.currentState!
                            .validate()) {
                          controller.uploadImagesToImageKit(isAdd: true);
                        }
                      },
                      width: Get.width,
                      text: "Add",
                      textStyle: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _initializeControllerFields(dynamic data){
    controller.name.text = data['name'] ?? "name null";
    controller.distance.text = data['distance'] ?? "distance null";
    controller.availableDate.text = data['available_dates'] ?? "availableDates null";
    controller.price.text = data['price'] ?? "price null";
    controller.ratings.text = data['rating'] ?? "rating null";
    controller.ownerPropertyImagesFromFirebase.clear();
    controller.ownerPropertyImagesFromFirebase.addAll(List.from(data['images'] ?? ["null"])); // ensuring list<dynamic>

    controller.title.text = data['title'] ?? "title null";
    controller.aboutUs.text = data['about_us'] ?? "about us null";
    controller.address.text = data['address'] ?? 'address null';
    controller.state.text = data['state'] ?? 'state null';
    controller.city.text = data['city'] ?? "city null";
    controller.link.text = data['link'] ?? "link null";
    controller.pincode.text = data['pin_code'] ?? 'pincode null';
    controller.cancellationPolicy.text = data['cancellation_policy'] ?? "cancellation policy null";
    controller.houseRules.text = data['house_rules'] ?? "house rules null";
    controller.safetynProperty.text = data['safety_property'] ?? "safety null";

    controller.pickedImagesForUI.clear();
  }

  // edit property form
  void editPropertyForm(String propertyId) {
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColor.white,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12),
        child: Form(
          key: controller.editPropertyFormKey,
          child: FutureBuilder(
            future: controller.fetchOwnerPropertyDetails(propertyId),
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
                _initializeControllerFields(snapshot.data);
                return Padding(
                  padding: EdgeInsetsGeometry.only(top: 18),
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      controller.roomTitle.text = snapshot.data['room'][index]['title'] ?? "room title null";
                      controller.roomSubtitle.text = snapshot.data['room'][index]['subtitle'] ?? "room subtitle null";
                      controller.latitude.text = snapshot.data['location'][index]['latitude'].toString();
                      controller.longitude.text = snapshot.data['location'][index]['longitude'].toString();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 15,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          CustomButton(
                            type: ButtonTypes.icon,
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          // title
                          Text(
                            "Edit Property Details",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 27,
                            ),
                          ),
                          // name
                          CustomTextFormField(
                            controller: controller.name,
                            hintText: 'Enter name',
                            labelText: 'Enter name',
                            validatorText: 'Please enter name',
                          ),
                          // distance
                          CustomTextFormField(
                            controller: controller.distance,
                            hintText: 'Enter distance',
                            labelText: 'Enter distance',
                            validatorText: 'Please enter distance',
                          ),
                          // available dates
                          CustomTextFormField(
                            controller: controller.availableDate,
                            labelText: 'Enter date',
                            hintText: 'Enter available dates eg. 14-20 Dec',
                            validatorText: 'Please enter available dates!',
                          ),
                          // price
                          CustomTextFormField(
                            controller: controller.price,
                            hintText: 'Enter price',
                            labelText: 'Enter price',
                            validatorText: 'Please enter price',
                          ),
                          // ratings
                          CustomTextFormField(
                            controller: controller.ratings,
                            hintText: 'Enter ratings',
                            labelText: 'Enter ratings',
                            validatorText: 'Please enter ratings',
                          ),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                // old firebase images
                                Obx(
                                  () => Row(
                                    children: controller
                                        .ownerPropertyImagesFromFirebase
                                        .map((file) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15.0),
                                        child: Stack(children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadiusGeometry.circular(
                                                    10),
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
                                              iconButtonStyle:
                                                  IconButton.styleFrom(
                                                      backgroundColor:
                                                          AppColor.red),
                                              type: ButtonTypes.icon,
                                              onPressed: () {
                                                deleteConfirmDialog(
                                                    file, true, propertyId);
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

                                // current added images
                                Obx(() {
                                  if (controller.pickedImagesForUI.isNotEmpty) {
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: controller.pickedImagesForUI
                                            .map((file) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              right: 15.0,
                                            ),
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadiusGeometry
                                                          .circular(10),
                                                  child: Image.file(
                                                    // path: "$file",
                                                    file,
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
                                                    iconButtonStyle:
                                                        IconButton.styleFrom(
                                                            backgroundColor:
                                                                AppColor.red),
                                                    onPressed: () {
                                                      controller
                                                          .pickedImagesForUI
                                                          .remove(file);
                                                    },
                                                    icon: Icon(
                                                      Icons.delete_outline,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    );
                                  } else if (controller
                                      .pickedSvgImagesForUI.isNotEmpty) {
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: controller
                                            .pickedSvgImagesForUI
                                            .map((svg) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadiusGeometry.circular(
                                                      10),
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
                                      '',
                                    );
                                  }
                                }),
                              ],
                            ),
                          ),

                          CustomButton(
                            type: ButtonTypes.elevated,
                            onPressed: () => controller.pickImages(),
                            text: 'Add new Images',
                          ),

                          // property title
                          CustomTextFormField(
                            controller: controller.title,
                            labelText: 'Property-Title',
                            hintText: 'Enter title',
                            validatorText: 'Please enter title',
                          ),
                          // about us
                          CustomTextFormField(
                            controller: controller.aboutUs,
                            labelText: 'About-Us',
                            hintText: 'Enter description',
                            validatorText: 'Please enter description',
                          ),
                          // room title
                          CustomTextFormField(
                            controller: controller.roomTitle,
                            labelText: 'Room-Title',
                            hintText: 'Enter title',
                            validatorText: 'Please enter room title',
                          ),
                          // room subtitle
                          CustomTextFormField(
                            controller: controller.roomSubtitle,
                            labelText: 'Room-Subtitle',
                            hintText: 'Enter subtitle',
                            validatorText: 'Please enter subtitle',
                          ),
                          // property address
                          CustomTextFormField(
                            controller: controller.address,
                            labelText: 'Address',
                            hintText: 'Enter address',
                            keyboardType: TextInputType.streetAddress,
                            validatorText: 'Please enter address',
                          ),
                          // link
                          CustomTextFormField(
                            controller: controller.link,
                            labelText: 'Location Link',
                            hintText: 'Enter link',
                            keyboardType: TextInputType.url,
                            validatorText: 'Please enter link',
                          ),
                          // state
                          DropdownButtonFormField(
                            value: controller.state.text,
                            hint: Text("Select State"),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            items: [
                              DropdownMenuItem(
                                value: "Gujarat",
                                child: Text("Gujarat"),
                              ),
                              DropdownMenuItem(
                                value: "Rajasthan",
                                child: Text("Rajasthan"),
                              ),
                              DropdownMenuItem(
                                value: "Uttar Pradesh",
                                child: Text("Uttar Pradesh"),
                              ),
                            ],
                            onChanged: (value) {
                              controller.state.text = value ?? "state null";
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select state';
                              }
                              return null;
                            },
                          ),
                          // city
                          DropdownButtonFormField(
                            hint: Text("Select City"),
                            value: controller.city.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            items: [
                              DropdownMenuItem(
                                value: "Ahmedabad",
                                child: Text("Ahmedabad"),
                              ),
                              DropdownMenuItem(
                                value: "Surat",
                                child: Text("Surat"),
                              ),
                              DropdownMenuItem(
                                value: "Rajkot",
                                child: Text("Rajkot"),
                              ),
                            ],
                            onChanged: (value) {
                              controller.city.text = value ?? "city null";
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select city';
                              }
                              return null;
                            },
                          ),
                          // pin code
                          CustomTextFormField(
                            controller: controller.pincode,
                            labelText: 'Pin code',
                            hintText: 'Enter pin code eg.382210',
                            keyboardType: TextInputType.number,
                            validatorText: 'Please enter pin code',
                          ),
                          // location map
                          CustomTextFormField(
                            controller: controller.latitude,
                            labelText: 'location latitude',
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            hintText: 'eg. 22.9742°',
                            validatorText: 'Please enter latitude',
                          ),
                          CustomTextFormField(
                            controller: controller.longitude,
                            labelText: 'location longitude',
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            hintText: 'eg. 72.4971°',
                            validatorText: 'Please enter longitude',
                          ),
                          // cancellation policy
                          CustomTextFormField(
                            controller: controller.cancellationPolicy,
                            labelText: 'Cancellation-Policy',
                            hintText: 'Enter policy',
                            validatorText: 'Please enter policy',
                          ),
                          // house rules
                          CustomTextFormField(
                            controller: controller.houseRules,
                            labelText: 'House-Rules',
                            hintText: 'Enter house rules',
                            validatorText: 'Please enter rules',
                          ),
                          // safety & property
                          CustomTextFormField(
                            controller: controller.safetynProperty,
                            labelText: 'Safety-Property',
                            hintText: 'Enter safety&property',
                            validatorText: 'Please enter details',
                          ),
                          Obx(
                            () => CustomButton(
                              type: ButtonTypes.elevated,
                              isLoading: controller.isLoading.value,
                              onPressed: () {
                                if (controller.editPropertyFormKey.currentState!
                                    .validate()) {
                                  if (controller.pickedImagesForUI.isNotEmpty) {
                                    controller.uploadImagesToImageKit(
                                        isAdd: false, propertyId: propertyId);
                                  } else {
                                    controller
                                        .updateOwnerPropertyDetails(propertyId);
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
                    },
                  ),
                );
              }
              return Center(
                child: Text("No data found."),
              );
            },
          ),
        ),
      ),
    );
  }

  void deleteConfirmDialog(String fileUrl, bool deleteFromFirebase, String propertyId) {
    Get.defaultDialog(
      title: "Are you sure you want to delete this image?",
      middleText: '',
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              isLoading: controller.isLoading.value,
              type: ButtonTypes.elevated,
              text: 'Cancel',
              backgroundColor: AppColor.black,
              onPressed: () => Get.back(),
            ),
            CustomButton(
              isLoading: controller.isLoading.value,
              type: ButtonTypes.elevated,
              text: 'Yes',
              backgroundColor: AppColor.black,
              width: 90,
              onPressed: () {
                if (deleteFromFirebase == true) {
                  controller.deleteImageFromFirebase(fileUrl, propertyId);
                  controller.ownerPropertyImagesFromFirebase.remove(fileUrl);
                } else {
                  // controller.pickedImagesForUI.remove(file);
                  // print(fileUrl);
                  // controller.pickedImagesForUI.remove(fileUrl);
                  // Get.back();
                  // print("object");
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  void deletePropertyDialog(String propertyId) {
    Get.defaultDialog(
      title: 'Are you sure you want to delete this property?',
      middleText: '',
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              isLoading: controller.isLoading.value,
              type: ButtonTypes.elevated,
              text: 'Cancel',
              backgroundColor: AppColor.black,
              onPressed: () => Get.back(),
            ),
            CustomButton(
              isLoading: controller.isLoading.value,
              type: ButtonTypes.elevated,
              text: 'Yes',
              backgroundColor: AppColor.black,
              width: 90,
              onPressed: () => controller.deleteProperty(propertyId),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.pink,
        foregroundColor: AppColor.white,
        onPressed: addNewPropertyForm,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Text(
              "Your properties",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            StreamBuilder<dynamic>(
              stream: controller.getAllPropertiesByOwnerId(
                  FirebaseAuth.instance.currentUser!.uid.toString()),
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
                  return Center(child: Text('No properties found'));
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      var docId = snapshot.data.keys.elementAt(index);
                      return Column(
                        spacing: 15,
                        children: [
                          Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  editPropertyForm(docId);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: CustomImage(
                                    height: 330,
                                    path: snapshot
                                            .data[docId]['images']?.isNotEmpty
                                        ? snapshot.data[docId]['images'][0]
                                        : "assets/images/Image-Not-Found.jpg",
                                    fit: BoxFit.cover,
                                    width: Get.width,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 280,
                                child: PopupMenuButton(
                                  iconColor: AppColor.white,
                                  color: AppColor.white,
                                  offset: Offset(0, 35),
                                  onSelected: (value) =>
                                      deletePropertyDialog(docId),
                                  itemBuilder: (BuildContext context) {
                                    return [
                                      PopupMenuItem(
                                        value: 'Delete',
                                        child: Text(
                                          "Delete",
                                        ),
                                      ),
                                    ];
                                  },
                                ),
                              ),
                            ],
                          ),
                          Column(
                            spacing: 1,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snapshot.data[docId]["name"] ?? "name null",
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
                                        snapshot.data[docId]["rating"] ??
                                            "rating null",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                snapshot.data[docId]["distance"] ??
                                    "distance null",
                                style: TextStyle(
                                  color: AppColor.blueGrey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                snapshot.data[docId]["available_dates"] ??
                                    "availableDates null",
                                style: TextStyle(
                                  color: AppColor.blueGrey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                spacing: 3,
                                children: [
                                  Text(
                                    '₹${snapshot.data[docId]["price"] ?? "price null"}',
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
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
