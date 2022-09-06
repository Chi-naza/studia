import 'package:get/get.dart';

class Dimensions {
  
  static double screenWidth = Get.context!.width;
  static double screenHeight = Get.context!.height;

  // PageView builder
  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

  // dynamic heights
  static double height9 = screenHeight / 93.78;
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height18 = screenHeight / 46.89;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;

  // dynamic widths
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;

  // fonts
  static double font12 = screenHeight / 70.33;
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font23 = screenHeight / 36.70;
  static double font26 = screenHeight / 32.46;

  // Radii
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  // iconSize
  static double iconSize16 = screenHeight / 52.75;
  static double iconSize20 = screenHeight / 42.2;
  static double iconSize24 = screenHeight / 35.17;

}
