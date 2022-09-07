import 'package:flutter/material.dart';
import 'package:studia/configuration/themes/sub_theme_data_mixin.dart';

const Color primaryDarkColor = Color(0xFF2e3c62);
const Color primaryDarkColor2 = Color(0xFF99ace1);
const Color mainTextDarkColor = Colors.white;


class DarkTheme with SubThemeData{
  buildDarkTheme(){
    final ThemeData systemDarkTheme = ThemeData.dark();

    return systemDarkTheme.copyWith(
      iconTheme: getIconTheme(),
      textTheme: getTextThemes().apply(
        bodyColor: mainTextDarkColor,
        displayColor: mainTextDarkColor,
      ),
    );
  }
}