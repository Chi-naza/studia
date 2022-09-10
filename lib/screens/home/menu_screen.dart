import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studia/configuration/themes/app_colors.dart';
import 'package:studia/configuration/themes/ui_parameters.dart';
import 'package:studia/controllers/zoom_drawer_controller.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: UIParameters.mobileScreenPadding,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: onSurfaceTextColor)),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // the back button
              Positioned(
                top: 0,
                right: 0,
                child: BackButton(
                  color: onSurfaceTextColor,
                  onPressed: () => controller.toggleDrawer(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}