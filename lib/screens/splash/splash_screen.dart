import 'package:flutter/material.dart';
import 'package:studia/utils/dimensions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center ,
        child: Image.asset(
          'assets/images/app_splash_logo.png',
          width: Dimensions.width30*7,
          height: Dimensions.height30*7,
        ),
      ),
    );
  }
}