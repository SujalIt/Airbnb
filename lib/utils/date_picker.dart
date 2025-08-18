import 'package:airbnb/airbnb_global_imports.dart';

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