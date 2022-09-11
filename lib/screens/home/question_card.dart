import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:studia/configuration/themes/custom_textStyle.dart';
import 'package:studia/configuration/themes/ui_parameters.dart';
import 'package:studia/controllers/question_paper_controller.dart';
import 'package:studia/models/question_paper_model.dart';
import 'package:studia/utils/dimensions.dart';
import 'package:studia/widgets/app_custom_icons.dart';
import 'package:studia/widgets/app_icon_text.dart';

class QuestionCard extends GetView<QuestionPaperController> {
  final QuestionPaperModel paperModel;
  
  const QuestionCard({Key? key, required this.paperModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: Theme.of(context).cardColor,
      ),
      padding: EdgeInsets.all(Dimensions.height10),
      child: InkWell(
        onTap: (() {
          controller.navigateToQuestions(paperModel: paperModel);
        }),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radius20/2),
                child: ColoredBox(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  child: SizedBox(
                    height: Dimensions.screenWidth*0.15,
                    width: Dimensions.screenWidth*0.15,
                    // cachedNetworkImage: a plugin to manage network images efficiently in memory
                    child: CachedNetworkImage( 
                      imageUrl: paperModel.imageUrl!,
                      placeholder: ((context, url) {
                        return Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        );
                      }),
                      errorWidget: (context, url, error) => Image.asset('assets/images/app_splash_logo.png'), // shown when image fails
                    ),
                  ),
                ),
              ),
              SizedBox(width: Dimensions.width10+2),
              // The column of items beside the image in the card
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title
                    Text(
                      paperModel.title,
                      style: cardTitle(context),
                    ),
                    // description
                    Padding(
                      padding: EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height15),
                      child: Text(
                        paperModel.description,
                        style: detailText,
                      ),
                    ),
                    // The row of icons & texts beneath
                    Row(
                      children: [
                        // questions
                        AppIconText(
                          icon: Icon(
                            Icons.help_outline_sharp,
                            color: Get.isDarkMode? Colors.white : Theme.of(context).primaryColor,
                          ), 
                          text: Text(
                            "${paperModel.questionCount} questions",
                            style: detailText.copyWith(
                              color: Get.isDarkMode? Colors.white : Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(width: Dimensions.width10),
                        // time for it
                        AppIconText(
                          icon: Icon(
                            Icons.timer,
                            color: Get.isDarkMode? Colors.white : Theme.of(context).primaryColor,
                          ), 
                          text: Text(
                            paperModel.timeInMinits(),
                            style: detailText.copyWith(
                              color: Get.isDarkMode? Colors.white : Theme.of(context).primaryColor,                     
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ],
            ),
            // The trophy Icon on the bottom Right of the card
            Positioned(
              bottom: -Dimensions.height10,
              right: -Dimensions.height10,
              // Wrapped with gesture detector
              child: GestureDetector(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: Dimensions.height10+2, horizontal: Dimensions.width20),
                  //trophy icon
                  child: Icon(AppIcons.trophyOutline),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(cardBorderRadius),
                      bottomRight: Radius.circular(cardBorderRadius),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}