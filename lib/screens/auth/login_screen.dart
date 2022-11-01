import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studia/configuration/themes/app_colors.dart';
import 'package:studia/controllers/auth_controller.dart';
import 'package:studia/utils/dimensions.dart';
import 'package:studia/widgets/main_button.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // book image
            Image.asset(
              'assets/images/logo.png',
              width: Dimensions.width30*9,
              height: Dimensions.height30*9,
            ),
            // long text below the logo
            Padding(
              padding: EdgeInsets.symmetric(vertical: Dimensions.height20*2),
              child: const Text(
                "With Studia, you can effectively carry out your studies on any subject of your interest. We try much to cover as much subjects as possible in order to accommodate all manner of students. Sign in already !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: onSurfaceTextColor,
                ),
              ),
            ),
            // Our custom button
            MainButton(
              onTap: () => controller.signInWithGoogle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google svg icon
                  SvgPicture.asset("assets/icons/google.svg"),
                  SizedBox(width: Dimensions.width15),
                  // text
                  Text(
                    "Sign in with Google",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),         
          ],
        ),
      ),
    );
  }
}