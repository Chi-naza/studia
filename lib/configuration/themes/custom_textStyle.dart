import 'package:flutter/material.dart';
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