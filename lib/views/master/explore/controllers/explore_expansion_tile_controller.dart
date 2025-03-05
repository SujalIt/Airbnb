import 'package:airbnb/airbnb_global_imports.dart';

class ExploreExpansionTileController extends GetxController{
  var isExpanded1 = false.obs;
  var isExpanded2 = false.obs;
  var isExpandedd = false.obs;

  void handleExpansion(int tileIndex, bool isExpanded) {
    if (isExpanded) {
      // If the current tile is being expanded, close the other tile
      if (tileIndex == 1) {
        isExpanded2.value = false;
      } else if (tileIndex == 2) {
        isExpanded1.value = false;
      }
    } else {
      // If the current tile is being collapsed, expand the other tile
      if (tileIndex == 1 && !isExpanded2.value) {
        isExpanded2.value = true;
      } else if (tileIndex == 2 && !isExpanded1.value) {
        isExpanded1.value = true;
      }
    }
  }
}