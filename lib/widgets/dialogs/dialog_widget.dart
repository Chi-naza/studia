import 'package:flutter/material.dart';
import 'package:studia/configuration/themes/custom_textStyle.dart';
import 'package:studia/utils/dimensions.dart';

class Dialog {
  static final Dialog _singleton = Dialog._internal();

  Dialog._internal();

  static Widget questionStartDialog({ required VoidCallback onTap }){
    return AlertDialog(
      title: Text(
        "Login Required",
        style: TextStyle(
          fontSize: Dimensions.font23,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Hi . . . friend  \nPlease log In before you start !",
            style: TextStyle(
              fontSize: Dimensions.font20,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onTap, 
          child: Text(
            "Proceed",
            style: TextStyle(
              fontSize: Dimensions.font20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}