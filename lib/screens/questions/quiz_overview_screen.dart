import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studia/configuration/themes/custom_textStyle.dart';
import 'package:studia/configuration/themes/ui_parameters.dart';
import 'package:studia/controllers/question_paper/questions_controller.dart';
import 'package:studia/screens/questions/background_decoration.dart';
import 'package:studia/utils/dimensions.dart';
import 'package:studia/widgets/answer_card.dart';
import 'package:studia/widgets/content_area.dart';
import 'package:studia/widgets/countdown_timer.dart';
import 'package:studia/widgets/header/custom_app_bar.dart';
import 'package:studia/widgets/main_button.dart';
import 'package:studia/widgets/question_number_card.dart';

class QuizOverviewScreen extends GetView<QuestionsController> {
  const QuizOverviewScreen({Key? key}) : super(key: key);

  static const String routeName = '/quiz_overview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.completedQuiz, //calling the completedQuiz function
      ),
      body: BackgroundDecoration(
        child: Expanded(
          child: ContentArea(
            child: Column(
              children: [
                Row(
                  children: [
                    CountDownTimer(
                      time: '',
                      color: UIParameters.isDarkMode()? Theme.of(context).textTheme.bodyText1!.color : Theme.of(context).primaryColor,
                    ),
                    Obx(() => Text(
                      "${controller.time} Remaining",
                      style: countDownTextStyle(),
                    )),
                  ],
                ),
                SizedBox(height: Dimensions.height30),
                // The boxes: Grid
                Expanded(
                  child: GridView.builder(
                    itemCount: controller.allQuestions.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Get.width ~/ 75,
                      childAspectRatio: 1,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8
                    ), 
                    itemBuilder: ((_, index) {
                      AnswerStatus? answerStatus;
                      if(controller.allQuestions[index].selectedAnswer != null){
                        answerStatus = AnswerStatus.answered;
                      }
                      return QuestionNumberCard(
                        indexNum: index + 1,
                        status: answerStatus,
                        onTap: () => controller.jumpToQuestion(index),
                      );
                    })
                  ),
                ),
                // The Complete Button Area
                ColoredBox(
                  color: Colors.transparent, //Theme.of(context).scaffoldBackgroundColor,
                  child: Padding(
                    padding: UIParameters.mobileScreenPadding,
                    child: MainButton(
                      title: 'Submit',
                      wantShape: false,
                      onTap: () => controller.quizFinished(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}