import 'package:airbnb/airbnb_global_imports.dart';

class OwnerDashboardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OwnerDashboardController());
  }
}