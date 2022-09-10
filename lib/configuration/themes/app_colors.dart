import 'package:flutter/material.dart';
import 'package:studia/configuration/themes/app_dark_theme.dart';
import 'package:studia/configuration/themes/app_light_theme.dart';
import 'package:studia/configuration/themes/ui_parameters.dart';

const Color onSurfaceTextColor = Colors.white;

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