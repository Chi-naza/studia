import 'package:flutter/material.dart';
import 'package:studia/utils/dimensions.dart';

class AppIconText extends StatelessWidget {
  final Icon icon;
  final Widget text;
  
  const AppIconText({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(width: Dimensions.width10/2),
        text
      ],
    );
  }
}