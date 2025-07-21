import 'package:airbnb/airbnb_global_imports.dart';

class CustomBottomSheet{
  void showBottomSheet(){
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColor.white,
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          child: SingleChildScrollView(

          ),
        ),
      )
    );
  }
}


// void editPropertyForm(String propertyId) {
//   Get.bottomSheet(
//     isScrollControlled: true,
//     backgroundColor: AppColor.white,
//     Padding(
//       padding: const EdgeInsets.all(25.0),
//       child: Form(
//         key: editPropertyFormKey,
//         child: SingleChildScrollView(
//           child: FutureBuilder(
//             future: fetchOwnerPropertyDetails(propertyId),
//             builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//               if (snapshot.hasError) {
//                 return Center(
//                   child: Text("Error"),
//                 );
//               }
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               if (snapshot.hasData) {
//                 editPropertyName.text = snapshot.data['name'] ?? "name";
//                 editPropertyDistance.text = snapshot.data['distance'] ?? "distance";
//                 editAvailableDate.text = snapshot.data['available_dates'] ?? "availableDate";
//                 editPropertyPrice.text = snapshot.data['price'] ?? "price";
//                 editPropertyRatings.text = snapshot.data['rating'] ?? "rating";
//                 ownerPropertyImagesFromFirebase.clear();
//                 ownerPropertyImagesFromFirebase.addAll(List.from(snapshot.data['images'])); // ensuring list<dynamic>
//
//                 pickedImagesForUI.clear();
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   spacing: 15,
//                   children: [
//                     // title
//                     Text(
//                       "Edit Property Details",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 27,
//                       ),
//                     ),
//                     // name
//                     TextFormField(
//                       controller: editPropertyName,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hint: Text(
//                           'Enter name',
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter name';
//                         }
//                         return null;
//                       },
//                     ),
//                     // distance
//                     TextFormField(
//                       controller: editPropertyDistance,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hint: Text(
//                           'Enter distance',
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter distance';
//                         }
//                         return null;
//                       },
//                     ),
//                     // available dates
//                     TextFormField(
//                       controller: editAvailableDate,
//                       decoration: InputDecoration(
//                         hintText: 'Enter available dates eg. 14-20 Dec',
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter available dates!';
//                         }
//                         return null;
//                       },
//                     ),
//                     // price
//                     TextFormField(
//                       controller: editPropertyPrice,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hint: Text(
//                           'Enter price',
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter price';
//                         }
//                         return null;
//                       },
//                     ),
//                     // ratings
//                     TextFormField(
//                       controller: editPropertyRatings,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hint: Text(
//                           'Enter ratings',
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter ratings';
//                         }
//                         return null;
//                       },
//                     ),
//
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           Obx(()=> Row(
//                             children: ownerPropertyImagesFromFirebase.map((file) {
//                               return Padding(
//                                 padding: const EdgeInsets.only(right: 15.0),
//                                 child: Stack(children: [
//                                   ClipRRect(
//                                     borderRadius: BorderRadiusGeometry.circular(10),
//                                     child: CustomImage(
//                                       path: '$file',
//                                       height: 150,
//                                       width: 150,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                   Positioned(
//                                     top: 55,
//                                     left: 50,
//                                     child: CustomButton(
//                                       type: ButtonTypes.icon,
//                                       onPressed: () {
//                                         deleteConfirmDialog(file);
//                                       },
//                                       icon: Icon(
//                                         Icons.delete_outline,
//                                       ),
//                                     ),
//                                   ),
//                                 ]),
//                               );
//                             }).toList(),
//                           ),
//                           ),
//
//                           Obx(() {
//                             if (pickedImagesForUI.isNotEmpty) {
//                               return SingleChildScrollView(
//                                 scrollDirection: Axis.horizontal,
//                                 child: Row(
//                                   children: pickedImagesForUI.map((file) {
//                                     return Padding(
//                                       padding: const EdgeInsets.only(
//                                           right: 15.0),
//                                       child: ClipRRect(
//                                         borderRadius:
//                                         BorderRadiusGeometry
//                                             .circular(10),
//                                         child: Image.file(
//                                           file,
//                                           height: 150,
//                                           width: 150,
//                                           fit: BoxFit.cover,
//                                           errorBuilder: (context, error,
//                                               stacktrace) {
//                                             return Icon(
//                                                 Icons.broken_image);
//                                           },
//                                         ),
//                                       ),
//                                     );
//                                   }).toList(),
//                                 ),
//                               );
//                             } else if (pickedSvgImagesForUI.isNotEmpty) {
//                               return SingleChildScrollView(
//                                 scrollDirection: Axis.horizontal,
//                                 child: Row(
//                                   children: pickedSvgImagesForUI.map((svg) {
//                                     return Padding(
//                                       padding: const EdgeInsets.only(
//                                           right: 15.0),
//                                       child: ClipRRect(
//                                         borderRadius:
//                                         BorderRadiusGeometry
//                                             .circular(10),
//                                         child: SvgPicture.string(
//                                           svg,
//                                           height: 150,
//                                           width: 150,
//                                           fit: BoxFit.cover,
//                                           placeholderBuilder: (context) =>
//                                               CircularProgressIndicator(),
//                                         ),
//                                       ),
//                                     );
//                                   }).toList(),
//                                 ),
//                               );
//                             } else {
//                               return Text('',);
//                             }
//                           }),
//                         ],
//                       ),
//                     ),
//
//                     CustomButton(
//                       type: ButtonTypes.elevated,
//                       onPressed: () => pickImages(),
//                       text: 'Add new Images',
//                     ),
//                     Obx(
//                           () => CustomButton(
//                         type: ButtonTypes.elevated,
//                         isLoading: isLoading.value,
//                         onPressed: () {
//                           if (editPropertyFormKey.currentState!.validate()) {
//                             if (pickedImagesForUI.isNotEmpty) {
//                               uploadImagesToImageKit(isAdd: false);
//                             }else{
//                               updateOwnerPropertyDetails();
//                             }
//                           }
//                         },
//                         width: Get.width,
//                         text: "Save",
//                         textStyle: TextStyle(
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               }
//               return Center(
//                 child: Text("No data found."),
//               );
//             },
//           ),
//         ),
//       ),
//     ),
//   );
// }