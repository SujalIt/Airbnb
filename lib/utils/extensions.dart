
import 'package:airbnb/airbnb_global_imports.dart';

extension ScreenUtils on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
}

