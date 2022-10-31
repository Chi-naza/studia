import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studia/configuration/themes/app_colors.dart';
import 'package:studia/configuration/themes/ui_parameters.dart';
import 'package:studia/utils/dimensions.dart';

TextStyle cardTitle(context){
  return TextStyle(
    // setting color based on theme
    color: UIParameters.isDarkMode()? Theme.of(context).textTheme.bodyText1!.color : Theme.of(context).primaryColor,
    fontSize: Dimensions.font23,
    fontWeight: FontWeight.bold,
  );
}

const detailText = TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
var questionTextStyle = TextStyle(fontSize: Dimensions.font12*2, fontWeight: FontWeight.w800);

var appBarTextStyle = TextStyle(fontSize: Dimensions.font16, fontWeight: FontWeight.bold, color: onSurfaceTextColor);

TextStyle countDownTextStyle(){
  return TextStyle(
    color: UIParameters.isDarkMode()? Theme.of(Get.context!).textTheme.bodyText1!.color :  Theme.of(Get.context!).primaryColor,
    letterSpacing: 2,
    fontWeight: FontWeight.w800
  );
}