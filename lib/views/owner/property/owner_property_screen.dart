import 'package:airbnb/airbnb_global_imports.dart';

class OwnerPropertyScreen extends GetView<OwnerPropertyController> {
  const OwnerPropertyScreen({super.key});

  // add new property form
  void addNewPropertyForm() {
    controller.name.clear();
    controller.distance.clear();
    controller.availableDate.clear();
    controller.price.clear();
    controller.ratings.clear();
    controller.pickedImagesForUI.clear();
      Get.bottomSheet(
        isScrollControlled: true,
        backgroundColor: AppColor.white,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12),
          child: Form(
            key: controller.addPropertyFormKey,
            child: Padding(
              padding: EdgeInsetsGeometry.only(top: 18,),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 15,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),

                    CustomButton(
                      type: ButtonTypes.icon,
                      icon: Icon(Icons.arrow_back),
                      onPressed: (){
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
                    children: [
                      Obx(() {
                        if (controller.pickedImagesForUI.isNotEmpty) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: controller.pickedImagesForUI.map((file) {
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
                    // profile image


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
                  )
                ],
              ),
                        ),
            ),
        ),
              ),
    );
  }

  // edit property form
  void editPropertyForm(String propertyId) {
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColor.white,
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: controller.editPropertyFormKey,
          child: SingleChildScrollView(
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
                  controller.name.text = snapshot.data['name'] ?? "name";
                  controller.distance.text = snapshot.data['distance'] ?? "distance";
                  controller.availableDate.text = snapshot.data['available_dates'] ?? "availableDate";
                  controller.price.text = snapshot.data['price'] ?? "price";
                  controller.ratings.text = snapshot.data['rating'] ?? "rating";
                  controller.ownerPropertyImagesFromFirebase.clear();
                  controller.ownerPropertyImagesFromFirebase.addAll(List.from(snapshot.data['images'])); // ensuring list<dynamic>

                  controller.pickedImagesForUI.clear();
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
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Stack(children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(10),
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
                                          iconButtonStyle: IconButton.styleFrom(backgroundColor: AppColor.red),
                                          type: ButtonTypes.icon,
                                          onPressed: () {
                                            deleteConfirmDialog(file,true,propertyId);
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
                                    children: controller.pickedImagesForUI.map((file) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          right: 15.0,
                                        ),
                                        child: Stack(children: [
                                          ClipRRect(
                                            borderRadius: BorderRadiusGeometry.circular(10),
                                            child: Image.file(
                                              file,
                                              height: 150,
                                              width: 150,
                                              fit: BoxFit.cover,
                                              errorBuilder: (
                                                context,
                                                error,
                                                stacktrace,
                                              ) {
                                                return Icon(
                                                  Icons.broken_image,
                                                );
                                              },
                                            ),
                                          ),
                                          Positioned(
                                            top: 55,
                                            left: 50,
                                            child: CustomButton(
                                              type: ButtonTypes.icon,
                                              iconButtonStyle: IconButton.styleFrom(backgroundColor: AppColor.red),
                                              onPressed: () {
                                                // deleteConfirmDialog(file.toString(), false);

                                                controller.pickedImagesForUI.remove(file); // changes left
                                              },
                                              icon: Icon(
                                                Icons.delete_outline,
                                              ),
                                            ),
                                          ),
                                        ],),
                                      );
                                    }).toList(),
                                  ),
                                );
                              } else if (controller.pickedSvgImagesForUI.isNotEmpty) {
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: controller.pickedSvgImagesForUI
                                        .map((svg) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15.0),
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
                      Obx(
                        () => CustomButton(
                          type: ButtonTypes.elevated,
                          isLoading: controller.isLoading.value,
                          onPressed: () {
                            if (controller.editPropertyFormKey.currentState!
                                .validate()) {
                              if (controller.pickedImagesForUI.isNotEmpty) {
                                controller.uploadImagesToImageKit(isAdd: false,propertyId: propertyId);
                              } else {
                                controller.updateOwnerPropertyDetails(propertyId);
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

  void deleteConfirmDialog(String fileUrl, bool deleteFromFirebase,String propertyId) {
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
                  if(deleteFromFirebase == true) {
                    controller.deleteImageFromFirebase(fileUrl,propertyId);
                    controller.ownerPropertyImagesFromFirebase.remove(fileUrl);
                  }else{
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
              stream: controller.getAllPropertiesByOwnerId(FirebaseAuth.instance.currentUser!.uid.toString()),
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
                                    path: snapshot.data[docId]['images']?.isNotEmpty
                                        ? snapshot.data[docId]['images'][0]
                                        : "assets/images/Image-Not-Found.jpg",
                                    fit: BoxFit.cover,
                                    width: Get.width,
                                  ),
                                ),
                              ),
                              CustomButton(
                                type: ButtonTypes.icon,
                                onPressed: (){},
                                icon: IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.more_vert,),
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
                                    snapshot.data[docId]["name"] ?? "name",
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
                                            "rating",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                snapshot.data[docId]["distance"] ?? "distance",
                                style: TextStyle(
                                  color: AppColor.blueGrey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                snapshot.data[docId]["available_dates"] ??
                                    "availableDates",
                                style: TextStyle(
                                  color: AppColor.blueGrey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                spacing: 3,
                                children: [
                                  Text(
                                    '₹${snapshot.data[docId]["price"] ?? "price"}',
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
