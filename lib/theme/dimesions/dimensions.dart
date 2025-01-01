import 'package:flutter/widgets.dart';

class Dimensions {
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  static double paddingSmall = screenWidth * 0.02; // 2% of screen width
  static double paddingMedium = screenWidth * 0.04; // 4% of screen width
  static double paddingLarge = screenWidth * 0.06; // 6% of screen width

  static double fontSmall = screenWidth * 0.04; // 4% of screen width
  static double fontMedium = screenWidth * 0.05; // 5% of screen width
  static double fontLarge = screenWidth * 0.06; // 6% of screen width

  static double buttonHeight = screenHeight * 0.06; // 6% of screen height
  static double buttonWidth = screenWidth * 0.5; // 50% of screen width
}
