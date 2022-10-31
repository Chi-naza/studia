import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studia/configuration/themes/app_colors.dart';
import 'package:studia/utils/dimensions.dart';

class MainButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool? enabled;
  final Widget? child;
  final Color? color;
  final bool wantShape;


  const MainButton({Key? key, this.title = '', required this.onTap, this.enabled=true, this.child, this.color, this.wantShape=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: wantShape? const StadiumBorder() : null,
      borderRadius: wantShape? null : BorderRadius.circular(Dimensions.font12),
      color: color,
      elevation: 3,
      child: SizedBox(
        height: Dimensions.height30*2,
        width: Dimensions.screenWidth-80,
        child: InkWell(
          onTap: enabled==false? null : onTap,
          child: Center(
            child: child?? Text(
              title,
              style: TextStyle(
                color: Get.isDarkMode? onSurfaceTextColor : Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}