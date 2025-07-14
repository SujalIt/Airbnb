import 'package:airbnb/airbnb_global_imports.dart';

class OwnerPropertyController extends GetxController{

  // Get.put(ImagePickerController());
  // Get.lazyPut(()=>ImagePickerController());

  // Get.put(ImagePickerController());
  // final imageController = Get.find<ImagePickerController>();
  // print("p");
  // print(imageController);


  GlobalKey<FormState> fieldFormKey = GlobalKey<FormState>();
  TextEditingController propertyName = TextEditingController();
  TextEditingController propertyDistance = TextEditingController();
  TextEditingController availableDate = TextEditingController();
  TextEditingController propertyPrice = TextEditingController();
  TextEditingController propertyRatings = TextEditingController();

  void addNewPropertyForm(){
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColor.white,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 25),
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

                CustomImage(
                  path: 'https://images.unsplash.com/photo-1575361204480-aadea25e6e68?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmFsbHxlbnwwfHwwfHx8MA%3D%3D',
                ),

                // SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () => controller.pickImage(),
                //   child: Text('Pick Image'),
                // ),

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
                CustomButton(
                  type: ButtonTypes.elevated,
                  onPressed: () {
                    if (fieldFormKey.currentState!.validate()) {}
                  },
                  width: Get.width,
                  text: "Add",
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
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