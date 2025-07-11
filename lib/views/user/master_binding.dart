import 'package:airbnb/airbnb_global_imports.dart';

class MasterBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> MasterController());
  }
}