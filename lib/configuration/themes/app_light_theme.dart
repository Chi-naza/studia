import 'package:flutter/material.dart';
import 'package:studia/configuration/themes/sub_theme_data_mixin.dart';

const Color primaryLightColor = Color(0xFF3ac3cb);
const Color primaryLightColor2 = Color(0xFFf85187);
const Color mainTextColor = Color.fromARGB(255, 40, 40, 40);
const Color cardColor= Color.fromARGB(255, 254, 254, 255);

class LightTheme with SubThemeData{
  buildLightTheme(){
    final ThemeData systemLightTheme = ThemeData.light();

    return systemLightTheme.copyWith(
      cardColor: cardColor,
      primaryColor: primaryLightColor2,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      iconTheme: getIconTheme(),
      textTheme: getTextThemes().apply(bodyColor: mainTextColor, displayColor: mainTextColor),
    );
  }
}