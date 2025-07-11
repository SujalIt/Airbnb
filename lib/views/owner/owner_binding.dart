import 'package:airbnb/airbnb_global_imports.dart';

class OwnerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OwnerController());
  }
}