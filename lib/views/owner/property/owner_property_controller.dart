import 'package:airbnb/airbnb_global_imports.dart';

class OwnerPropertyController extends GetxController{

  GlobalKey<FormState> fieldFormKey = GlobalKey<FormState>();
  TextEditingController propertyName = TextEditingController();

  var selectedDate = Rxn<DateTime>();
  Future<void> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      if ((DateTime.now().year - pickedDate.year) >= 18) {
        selectedDate.value = pickedDate;
      } else {
        SmartAlert.customSnackBar(
          title: 'Sorry',
          desc: 'You are not eligible ... you must be 18 year old.',
        );
      }
    }
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
}