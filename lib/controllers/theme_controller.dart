import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studia/configuration/themes/app_dark_theme.dart';
import 'package:studia/configuration/themes/app_light_theme.dart';

class ThemeController extends GetxController {
  late ThemeData _lightTheme;
  late ThemeData _darkTheme;

  // A function used to initialize stuffs. From Getx, called before the app boots
  // Here, we use it to initialize our appThemes
  @override
  void onInit(){
    initializeThemeData();
    super.onInit();
  }


  initializeThemeData(){
    _lightTheme = LightTheme().buildLightTheme();
    _darkTheme = DarkTheme().buildDarkTheme();
  }

  // Getters for our private variables
  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;



}