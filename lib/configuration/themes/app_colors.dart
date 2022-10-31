import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studia/configuration/themes/app_dark_theme.dart';
import 'package:studia/configuration/themes/app_light_theme.dart';
import 'package:studia/configuration/themes/ui_parameters.dart';

const Color onSurfaceTextColor = Colors.white;
const Color correctAnswerColor = Color(0xFF3ac3cb);
const Color wrongAnswerColor = Color(0xFFf85187);
const Color notAnsweredColor = Color(0xFF2a3c65);

// for light
const mainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryLightColor,
    primaryLightColor2,
  ],
);

// for dark
const mainGradientDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryDarkColor,
    primaryDarkColor2,
  ],
);


// A function that changes the app theme to dark or light depending on the condition
LinearGradient mainGradient(){
  return UIParameters.isDarkMode()? mainGradientDark : mainGradientLight;
}

// seeting scaffold color based on theme
Color customScaffoldColor(BuildContext context){
  return UIParameters.isDarkMode()? Color(0xFF2e3c62) : Color.fromARGB(255,240,237,255);
}

// our answer selected Color is returned by this function
Color answerSelectedColor(){
  return UIParameters.isDarkMode()? Theme.of(Get.context!).cardColor.withOpacity(0.5) : Theme.of(Get.context!).primaryColor;
}


// The borderColor of our answer card is returned by this function
Color answerBorderColor(){
  return UIParameters.isDarkMode()? const Color.fromARGB(255, 20, 46, 154) : const Color.fromARGB(255, 221, 221, 221);
}

