import 'package:flutter/material.dart';
import 'package:studia/configuration/themes/app_colors.dart';
import 'package:studia/utils/dimensions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center ,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Image.asset(
          'assets/images/logo.png',
          width: Dimensions.width30*9,
          height: Dimensions.height30*9,
        ),
      ),
    );
  }
}