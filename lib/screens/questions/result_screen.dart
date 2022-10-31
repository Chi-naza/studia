import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:studia/configuration/themes/ui_parameters.dart';
import 'package:studia/controllers/question_controller_extension.dart';
import 'package:studia/controllers/question_paper/questions_controller.dart';
import 'package:studia/screens/questions/answer_check_screen.dart';
import 'package:studia/screens/questions/background_decoration.dart';
import 'package:studia/utils/dimensions.dart';
import 'package:studia/widgets/answer_card.dart';
import 'package:studia/widgets/content_area.dart';
import 'package:studia/widgets/header/custom_app_bar.dart';
import 'package:studia/widgets/main_button.dart';
import 'package:studia/widgets/question_number_card.dart';

class ResultScreen extends GetView<QuestionsController> {
  const ResultScreen({Key? key}) : super(key: key);

  static const String routeName = '/result_screen';

  @override
  Widget build(BuildContext context) {

    var textColor = Get.isDarkMode? Colors.white : Theme.of(context).primaryColor;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.quizResultRemarkText,
        leading: SizedBox(height: Dimensions.height20*4),
      ),
      body: BackgroundDecoration(
        child: Expanded(
          child: ContentArea(
            child: Column(
              children: [
                // Bulb image
                SvgPicture.asset('assets/images/bulb.svg'),
                // congratulations text
                Padding(
                  padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height9),
                  child: Text(
                    'Congratulations',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.font26,
                    ),
                  ),
                ),
                // num of points text
                Text(
                  'You have ${controller.quizPoints} points',
                  style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: Dimensions.height30),
                // Tap to view correct answers
                const Text(
                  'Tap below question numbers to view correct answers',
                  textAlign: TextAlign.center,
                  // style: TextStyle(),
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
                      // our AnswerStatus enum
                      AnswerStatus? answerStatus;
                      // creating some variables to check selected and correctAnswers
                      final _question = controller.allQuestions[index];
                      final _selectedAnswer = _question.selectedAnswer;
                      final _correctAnswer = _question.correctAnswer;
                      // if statement to return the appropriate status of each question after the quiz
                      if(_selectedAnswer == _correctAnswer){
                        answerStatus = AnswerStatus.correct;
                      }else if(_selectedAnswer == null){
                        answerStatus = AnswerStatus.wrong;
                      }else{
                        answerStatus = AnswerStatus.wrong;
                      }
                      // Our QuestionNumber card is returned as a grid Item
                      return QuestionNumberCard(
                        indexNum: index + 1,
                        status: answerStatus,
                        onTap: () {
                          controller.jumpToQuestion(index, isGoBack: false);
                          Get.toNamed(AnswerCheckScreen.routeName);
                        },
                      );
                    })
                  ),
                ),
                // The Two Buttons at the Bottom of the Screen
                ColoredBox(
                  color: Colors.transparent,
                  child: Padding(
                    padding: UIParameters.mobileScreenPadding,
                    child: Row(
                      children: [
                        // try again
                        Expanded(
                          child: MainButton(
                            onTap: (){
                              controller.tryAgain();
                            },
                            title: 'Try Again',
                            color: Color.fromARGB(255, 18, 60, 82),
                          ),
                        ),
                        SizedBox(width: Dimensions.width10),
                        Expanded(
                          child: MainButton(
                            onTap: (){
                              controller.saveQuizResult();
                            },                            
                            title: 'Go to Home',
                            color: Color.fromARGB(255, 221, 218, 218),
                          ),
                        ),
                      ],
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