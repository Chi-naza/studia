import 'package:flutter/material.dart';
import 'package:studia/configuration/themes/custom_textStyle.dart';
import 'package:studia/utils/dimensions.dart';

class CountDownTimer extends StatelessWidget {
  final Color? color;
  final String time;
  
  const CountDownTimer({Key? key, this.color, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timer,
          color: color?? Theme.of(context).primaryColor,
        ),
        SizedBox(width: Dimensions.width10/2),
        Text(
          time,
          style: countDownTextStyle().copyWith(color: color),
        ),
      ],
    );
  }
}