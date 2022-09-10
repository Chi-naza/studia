import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:studia/configuration/themes/app_colors.dart';
import 'package:studia/configuration/themes/custom_textStyle.dart';
import 'package:studia/configuration/themes/ui_parameters.dart';
import 'package:studia/controllers/question_paper_controller.dart';
import 'package:studia/controllers/zoom_drawer_controller.dart';
import 'package:studia/screens/home/menu_screen.dart';
import 'package:studia/screens/home/question_card.dart';
import 'package:studia/utils/dimensions.dart';
import 'package:studia/widgets/app_circle_button.dart';
import 'package:studia/widgets/app_custom_icons.dart';
import 'package:studia/widgets/content_area.dart';

//NB: With GetView from Getx, we have access to the controller that we passed in as a type anywhere in our class/screen.
// GetView itself extends Stateless widget. And we access the given controller with a variable named "controller"

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();

    return Scaffold(
      // ZoomDrawer widget from zoomDrawer plugIn
      body: GetBuilder<MyZoomDrawerController>(builder: (_){
        return ZoomDrawer(
          controller: _.zoomDrawerController,
          borderRadius: Dimensions.height30*2,
          showShadow: true,
          angle: -2.0,
          style: DrawerStyle.DefaultStyle,
          backgroundColor: Colors.white.withOpacity(0.4),
          slideWidth: Dimensions.screenWidth*0.6,
          // menu screen shows when the drawer is enabled
          menuScreen: MenuScreen(), 
          // our main screen is the homeScreen
          mainScreen: Container(
            decoration: BoxDecoration(gradient: mainGradient()),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header column wrapped with Padding()
                  Padding(
                    padding: EdgeInsets.all(mobileScreenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // menu icon wrapped with appCircle button
                        AppCircleButton(
                          onTap: controller.toggleDrawer,
                          child: const Icon(AppIcons.menuLeft),
                        ),
                        SizedBox(height: Dimensions.height15),
                        // text & icon
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: Dimensions.height15),
                          child: Row(
                            children: [
                              // icon
                              Icon(
                                AppIcons.peace,
                              ),
                              Text(
                                "  Hello Friend",
                                style: detailText.copyWith(
                                  color: onSurfaceTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // what do you want to learn
                        Text(
                          "What do you want to learn today?",
                          style: TextStyle(
                            color: onSurfaceTextColor,
                            fontSize: Dimensions.font26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // body with subjects/papers
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.width10/2, vertical: Dimensions.height10),
                      child: ContentArea(
                        addPadding: false,
                        // Obx: monitoring changes in an observable variables
                        child: Obx(() =>  ListView.separated(
                          padding: UIParameters.mobileScreenPadding,
                          // shrinkWrap: true,
                          itemBuilder: (context, index) {
                            // clipRRect to create a rounded Rectangular clip
                            return QuestionCard(
                              paperModel: _questionPaperController.allPapers[index],
                            );
                          }, 
                          separatorBuilder: (context, index) {
                            return SizedBox(height: Dimensions.height30);
                          },
                          itemCount: _questionPaperController.allPapers.length,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),   
          ),
        );
      }),
    );
  }
}