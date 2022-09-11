import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studia/configuration/themes/app_colors.dart';
import 'package:studia/utils/dimensions.dart';
import 'package:studia/widgets/app_circle_button.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  static const String routeName = '/intoduction';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: Dimensions.screenWidth*0.2),
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: Dimensions.height45*1.6,
              ),
              SizedBox(height: Dimensions.height20*2,),
              // text
              Text(
                "This is a study app which helps to make you excellent. Make your studies easier by using this app. No limits to what you can learn",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: Dimensions.font23,
                  color: onSurfaceTextColor, // this color is useful in case of lightTheme
                ),
              ),
              SizedBox(height: Dimensions.height20*2),
              // arrow in a circular border
              AppCircleButton(
                onTap:  () => Get.offAndToNamed("/home"),
                child: Icon(Icons.arrow_forward_ios, size: Dimensions.height45-Dimensions.height10),
              ),
          ],
        ),
      ),
    );
  }
}