import 'package:airbnb/airbnb_global_imports.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class OwnerPropertyController extends GetxController {

  var isLoading = false.obs;

  HtmlEditorController aboutUs = HtmlEditorController();
  GlobalKey<FormState> addPropertyFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> editPropertyFormKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController distance = TextEditingController();
  TextEditingController availableDate = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController ratings = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController roomTitle = TextEditingController();
  TextEditingController roomSubtitle = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController link = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController latitude = TextEditingController();
  TextEditingController longitude = TextEditingController();
  TextEditingController cancellationPolicy = TextEditingController();
  TextEditingController houseRules = TextEditingController();
  TextEditingController safetynProperty = TextEditingController();

  // custom image picker
  var imageController = Get.find<ImagePickerController>();

  void clearAddFormFields(){
    name.clear();
    distance.clear();
    availableDate.clear();
    price.clear();
    ratings.clear();
    imageController.pickedImagesForUI.clear();
    // imageController.multiplePickedFiles.clear();

    title.clear();
    aboutUs.clear();
    roomTitle.clear();
    roomSubtitle.clear();
    address.clear();
    link.clear();
    state.clear();
    city.clear();
    pincode.clear();
    latitude.clear();
    longitude.clear();
    cancellationPolicy.clear();
    houseRules.clear();
    safetynProperty.clear();
  }

  Future<void> addProperty() async {
    List<String>? imageUrls;
    try {
      isLoading.value = true;
      if(imageController.pickedImagesForUI.isNotEmpty){
        imageUrls = await ImageKitApi.uploadImageToImageKit(imageFiles: imageController.pickedImagesForUI);
      }
      var aboutUsData = await aboutUs.getText();

      await FirebaseFirestore.instance
          .collection("places")
          .add({
        "name": name.text,
        "price": price.text,
        "images": imageUrls,
        "distance": distance.text,
        "available_dates": availableDate.text,
        "rating": ratings.text,
        "uuid": FirebaseAuth.instance.currentUser!.uid.toString(),
        "title": title.text,
        "room": [
          {
          'title': roomTitle.text,
          'subtitle': roomSubtitle.text,
          },
        ],
        "address": address.text,
        "about_us": aboutUsData,
        "link": link.text,
        "state": state.text,
        "city": city.text,
        "pin_code": pincode.text,
        "location": [
          {
            'latitude': latitude.text,
            'longitude': longitude.text,
          }
        ],
        "cancellation_policy": cancellationPolicy.text,
        "house_rules": houseRules.text,
        "safety_property": safetynProperty.text,
        "created_at": FieldValue.serverTimestamp(),
      });
      SmartAlert.customSnackBar(
        title: 'Property added Successfully',
        desc: "Now you can see your properties.",
      );
      Get.back(); // back is no working
    } catch (e) {
      SmartAlert.customSnackBar(title: "Failed..Try again", desc: '$e');
    } finally {
      isLoading.value = false;
    }
  }

  // edit property
  Future<dynamic> fetchOwnerPropertyDetails(String propertyId) async {
    try {
      try {
        var userId = await FirebaseFirestore.instance
            .collection('places')
            .doc(propertyId)
            .get();
        return userId.data();
      } on FirebaseFirestore catch (e) {
        SmartAlert.customSnackBar(
          title: 'Error!',
          desc: 'Something went wrong. $e',
        );
      }
    } on FirebaseFirestore catch (e) {
      SmartAlert.customSnackBar(
        title: 'Error!',
        desc: 'Something went wrong. $e',
      );
    }
  }

  var ownerPropertyImagesFromFirebase = [].obs;

  void deleteImageFromFirebase(String fileUrl,String propertyId) async {
    try {
      isLoading.value = true;
      await FirebaseFirestore.instance
          .collection('places')
          .doc(propertyId)
          .update(
        {
          'images': FieldValue.arrayRemove([fileUrl]),
        },
      );
    } on FirebaseFirestore catch (e) {
      SmartAlert.customSnackBar(title: 'Failed..Please try again', desc: 'Delete again. $e');
    } finally {
      isLoading.value = false;
      Get.back();
    }
  }

  // update property details method
  Future<void> updateOwnerPropertyDetails(String propertyId) async {
    List<String>? imageUrls;
    try {
      isLoading.value = true;
      if(imageController.pickedImagesForUI.isNotEmpty){
        imageUrls = await ImageKitApi.uploadImageToImageKit(imageFiles: imageController.pickedImagesForUI);
      }
      var aboutUsEditedData = await aboutUs.getText();
      await FirebaseFirestore.instance
          .collection('places')
          .doc(propertyId)
          .update(
        {
          "name": name.text,
          "price": price.text,
          "images": FieldValue.arrayUnion(imageUrls ?? []),
          "distance": distance.text,
          "available_dates": availableDate.text,
          "rating": ratings.text,
          "title": title.text,
          'about_us': aboutUsEditedData,
          "room": [
            {
              'title': roomTitle.text,
              'subtitle': roomSubtitle.text,
            },
          ],
          "address": address.text,
          "link": link.text,
          "state": state.text,
          "city": city.text,
          "pin_code": pincode.text,
          "location": [
            {
              'latitude': double.tryParse(latitude.text),
              'longitude': double.tryParse(longitude.text),
            }
          ],
          "cancellation_policy": cancellationPolicy.text,
          "house_rules": houseRules.text,
          "safety_property": safetynProperty.text,
          "created_at": FieldValue.serverTimestamp(),
        },
      );
      Get.back();
      SmartAlert.customSnackBar(title: 'Successfully edited your property.', desc: 'Now you can see.',);
    } on FirebaseFirestore catch (e) {
      SmartAlert.customSnackBar(
        title: 'Error!',
        desc: 'Something went wrong. $e',
      );
    } finally {
      isLoading.value = false;
    }
  }

  // owner all properties
  Stream<dynamic> getAllPropertiesByOwnerId(String documentId)  {
    try {
      return FirebaseFirestore.instance
          .collection('places')
          .where('uuid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .map((querySnapshot) {
        Map<String, Map<String, dynamic>> documents = {};
        for (var doc in querySnapshot.docs) {
          documents[doc.id] = doc.data();
        }
        return documents;
      });
    } catch (e) {
      return Stream.error('Something went wrong. $e');
    }
  }

  void deleteProperty(String docId) async{
    try{
      await FirebaseFirestore.instance.collection('places').doc(docId).delete();
      Get.back();
    } on FirebaseFirestore catch (e){
      SmartAlert.customSnackBar(title: 'Something wrong. $e', desc: 'Please try again');
      Get.back();
    }
  }
}
