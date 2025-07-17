import 'package:airbnb/airbnb_global_imports.dart';

class OwnerPropertyBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> OwnerPropertyController());
  }
}