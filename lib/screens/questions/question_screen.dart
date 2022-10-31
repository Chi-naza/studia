import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studia/configuration/themes/app_colors.dart';
import 'package:studia/configuration/themes/custom_textStyle.dart';
import 'package:studia/configuration/themes/ui_parameters.dart';
import 'package:studia/controllers/question_paper/questions_controller.dart';
import 'package:studia/firebase_ref/loading_status.dart';
import 'package:studia/screens/questions/background_decoration.dart';
import 'package:studia/screens/questions/question_placeholder.dart';
import 'package:studia/screens/questions/quiz_overview_screen.dart';
import 'package:studia/utils/dimensions.dart';
import 'package:studia/widgets/answer_card.dart';
import 'package:studia/widgets/content_area.dart';
import 'package:studia/widgets/countdown_timer.dart';
import 'package:studia/widgets/header/custom_app_bar.dart';
import 'package:studia/widgets/main_button.dart';

class QuestionScreen extends GetView<QuestionsController> {
 
   
  const QuestionScreen({Key? key}) : super(key: key);

  static const String routeName = '/question_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // Our custom appBar here
      appBar: CustomAppBar(
        leading: Container(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width10*0.8, vertical: Dimensions.height10*0.4),
          // padding: EdgeInsets.symmetric(vertical: 20),
          decoration: const ShapeDecoration(
            shape: StadiumBorder(
              side: BorderSide(color: onSurfaceTextColor, width: 2),
            ),
          ),
          // the count down time is here
          child: Obx(()=> CountDownTimer(
            time: controller.time.value,
            color: onSurfaceTextColor,
          )),
        ),
        showActionIcon: true,
        // The Current Question Number
        titleWidget: Obx(() => Text(
          "Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}", 
          style: appBarTextStyle
        )),
      ),
      body: BackgroundDecoration(
        child: Obx(() {
          return Column(
            children: [
              // if data is still being loaded, show shimmer effect
              if(controller.loadingStatus.value == LoadingStatus.loading)
                Expanded(
                  child: ContentArea(
                    child: Column(
                      children: [
                        SizedBox(height: Dimensions.height45),
                        const QuestionsPlaceHolder(),
                      ],
                    )
                  ),
                ),
              // show our screen when data is completely loaded
              if(controller.loadingStatus.value == LoadingStatus.completed)
                Expanded(
                  child: ContentArea(
                    child: SingleChildScrollView(  
                      padding: EdgeInsets.only(top: Dimensions.height20),                    
                      child: Column(
                        children: [
                          // The question: text
                          Text(
                            controller.currentQuestion.value!.question,
                            style: questionTextStyle,
                          ),
                          SizedBox(height: Dimensions.height30),
                          // List of answers 
                          GetBuilder<QuestionsController>(id: 'answer_list', builder: (controller) {                            
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.currentQuestion.value!.answers.length,
                              separatorBuilder: ((context, index) => SizedBox(height: Dimensions.height10)),
                              itemBuilder: (context, index) {
                                final answer = controller.currentQuestion.value!.answers[index]; 
                                return AnswerCard(
                                  answer: '${answer.identifier}.  ${answer.answer}', 
                                  isSelected: answer.identifier == controller.currentQuestion.value!.selectedAnswer,
                                  onPressed: (){
                                    controller.selectedAnswer(answer.identifier);
                                  }
                                );
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
                // BUTTON for NAVIGATING from one QUESTION to another
                ColoredBox(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Padding(
                    padding: UIParameters.mobileScreenPadding,
                    child: Row(
                      children: [
                        Visibility(
                          visible: controller.isFirstQuestion,
                          child: SizedBox(
                            // height: Dimensions.height45 + Dimensions.height10,
                            width: Dimensions.height45 + Dimensions.height10,
                            child: MainButton(
                              wantShape: false,
                              onTap: (){
                                controller.prevQuestion();
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Get.isDarkMode? onSurfaceTextColor : Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: Dimensions.width10),
                        // Next Question Button
                        Expanded(
                          child: Visibility(
                            visible: controller.loadingStatus.value == LoadingStatus.completed,
                            child: MainButton(
                              wantShape: false,
                              onTap: (() {
                                controller.isLastQuestion? Get.toNamed(QuizOverviewScreen.routeName) : controller.nextQuestion();
                              }),
                              title: controller.isLastQuestion? 'Complete' : 'Next',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}