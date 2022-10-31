import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studia/configuration/themes/custom_textStyle.dart';
import 'package:studia/configuration/themes/ui_parameters.dart';
import 'package:studia/screens/questions/quiz_overview_screen.dart';
import 'package:studia/utils/dimensions.dart';
import 'package:studia/widgets/app_circle_button.dart';
import 'package:studia/widgets/app_custom_icons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;
  
  const CustomAppBar({Key? key, this.title='', this.titleWidget, this.leading, this.showActionIcon=false, this.onMenuActionTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(Dimensions.height30),
        child: Stack(
          children: [
            // position.fill creates a positioned widget with top,right,left&right set to 0.0 by default.
            Positioned.fill(
              // if titleWidget is null, show 'title'
              child: titleWidget == null? Center(
                child: Text(
                  title,
                  style: appBarTextStyle,
                ),
              ) 
              : 
              Center(
                child: titleWidget,
              ),
            ),
            // Row of items on the AppBar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Back button shows if leading widget is null
                leading?? Transform.translate(
                  offset: Offset(-Dimensions.width30/2, 0),
                  child: const BackButton(),
                ),
                // if showActionIcon is given
                if(showActionIcon)
                  Transform.translate(
                    offset: Offset(Dimensions.width10, 0),
                    child: AppCircleButton(
                      child: Icon(AppIcons.menu),
                      onTap: onMenuActionTap?? () => Get.toNamed(QuizOverviewScreen.routeName),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.maxFinite, Dimensions.height20*6);
}