import 'package:airbnb/airbnb_global_imports.dart';
import 'package:intl/intl.dart';

class OwnerPropertyScreen extends GetView<OwnerPropertyController> {
  const OwnerPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Form(
          key: controller.fieldFormKey,
          child: SingleChildScrollView(
            child: Column(
              spacing: 15,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add Property Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27,),),
                TextFormField(
                  controller: controller.propertyName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hint: Text('Enter name',),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  // controller: controller.fnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hint: Text('Enter distance',),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter distance';
                    }
                    return null;
                  },
                ),
                Obx(() => TextFormField(
                    readOnly: true,
                    controller: TextEditingController(
                      text: controller.selectedDate.value != null ? DateFormat("dd/MM/yyyy").format(controller.selectedDate.value!) : "",
                    ),
                    decoration: InputDecoration(
                      hintText: 'Please Enter Your DOB',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                        ),
                        onPressed: () => controller.pickDate(context),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Select Your date of birth!';
                      }
                      return null;
                    },
                  ),
                ),
                TextFormField(
                  // controller: controller.fnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hint: Text('Enter price',),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter price';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  // controller: controller.fnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hint: Text('Enter ratings',),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter ratings';
                    }
                    return null;
                  },
                ),



                CustomButton(
                  type: ButtonTypes.elevated,
                  onPressed: (){},
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
}
