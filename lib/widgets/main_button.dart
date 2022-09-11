import 'package:flutter/material.dart';
import 'package:studia/configuration/themes/app_colors.dart';
import 'package:studia/utils/dimensions.dart';

class MainButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool? enabled;
  final Widget? child;
  final Color? color;


  const MainButton({Key? key, this.title = '', required this.onTap, this.enabled=true, this.child, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: StadiumBorder(),
      child: SizedBox(
        height: Dimensions.height30*2,
        width: Dimensions.screenWidth-80,
        child: InkWell(
          onTap: enabled==false? null : onTap,
          child: child?? Text(
            title,
            style: const TextStyle(
              color: onSurfaceTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}