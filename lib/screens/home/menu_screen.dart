import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studia/configuration/themes/app_colors.dart';
import 'package:studia/configuration/themes/ui_parameters.dart';
import 'package:studia/controllers/zoom_drawer_controller.dart';
import 'package:studia/utils/dimensions.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  static const String routeName = '/drawer-menu';

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
              // Column of user details
              Column(
                children: [
                  // if user is logged in and also users data is available. Else return empty sizedBox
                  
                  Obx(() => controller.user.value==null? const Text("No name Yet", style: TextStyle(color: Colors.white, fontSize: 40)): Text(
                    controller.user.value!.displayName??"Chinaza",
                    style: TextStyle(
                      fontSize: Dimensions.font23,
                      fontWeight: FontWeight.w900,
                      color: onSurfaceTextColor,
                    ),
                  )),
                  Spacer(flex: 1),
                  // Custom button: website
                  _DrawerButton(
                    icon: Icons.web,
                    label: 'Website',
                    onTap: (){
                      print("Website is clicked");
                      controller.website();
                    },
                  ),
                  // Custom button: facebook
                  _DrawerButton(
                    icon: Icons.facebook,
                    label: 'Facebook',
                    onTap: (){
                      print("Facebook is clicked");
                      controller.facebook();
                    },
                  ),
                  // Custom button: email
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.width10/2),
                    child: _DrawerButton(
                      icon: Icons.email,
                      label: 'Email',
                      onTap: (){
                        print("Email is clicked");
                        controller.email();
                      },
                    ),
                  ),
                  Spacer(flex: 4),
                  // Custom button: signOut
                  _DrawerButton(
                    icon: Icons.logout,
                    label: 'SignOut',
                    onTap: (){
                      print("SignOut is clicked");
                      controller.signOut();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// A reusable widget just for this class

class _DrawerButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  
  const _DrawerButton({Key? key, required this.icon, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap, 
      icon: Icon(
        icon,
        size: Dimensions.font16,
      ), 
      label: Text(label),
    );
  }
}