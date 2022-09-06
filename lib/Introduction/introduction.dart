import 'package:flutter/material.dart';
import 'package:studia/utils/dimensions.dart';
import 'package:studia/widgets/app_circle_button.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: Dimensions.screenWidth*0.2),
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
              ),
              SizedBox(height: Dimensions.height20*2,),
              // arrow in a circular border
              AppCircleButton(
                child: Icon(Icons.arrow_forward_ios, size: Dimensions.height45-Dimensions.height10),
              ),
          ],
        ),
      ),
    );
  }
}