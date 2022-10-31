import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studia/configuration/themes/custom_textStyle.dart';
import 'package:studia/controllers/question_paper/questions_controller.dart';
import 'package:studia/screens/questions/background_decoration.dart';
import 'package:studia/screens/questions/result_screen.dart';
import 'package:studia/utils/dimensions.dart';
import 'package:studia/widgets/answer_card.dart';
import 'package:studia/widgets/content_area.dart';
import 'package:studia/widgets/header/custom_app_bar.dart';

class AnswerCheckScreen extends GetView<QuestionsController> {

  const AnswerCheckScreen({Key? key}) : super(key: key);

  static const String routeName = '/answer_check';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        titleWidget: Obx((){
            return Text(
              "Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}",
              style: appBarTextStyle,
            );
          }
        ),
        showActionIcon: true,
        onMenuActionTap: () => Get.toNamed(ResultScreen.routeName),
      ),
      body: BackgroundDecoration(
        child: Expanded(
          child: ContentArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: Dimensions.height10),
              child: Column(
                children: [
                  // question text
                  Text(
                    controller.currentQuestion.value!.question,
                    style: questionTextStyle,
                  ),
                  SizedBox(height: Dimensions.height45),
                  // question list builder
                  GetBuilder<QuestionsController>(
                    id: 'question_review_list',
                    builder: (controller) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.currentQuestion.value!.answers.length,
                        separatorBuilder: ((_, index) => SizedBox(height: Dimensions.height10)),
                        itemBuilder: (_, index) {
                          // setting up some variables to get the selected & correct answers
                          final answer = controller.currentQuestion.value!.answers[index]; 
                          final selectedAnswer = controller.currentQuestion.value!.selectedAnswer;
                          final correctAnswer = controller.currentQuestion.value!.correctAnswer;
                          // Answer Text
                          String answerText = "${answer.identifier}. ${answer.answer}";
                          // Checking the question to know the answer card to be returned
                          if(selectedAnswer==correctAnswer && answer.identifier==selectedAnswer){
                            return CorrectAnswerCard(answer: answerText);
                          }else if(selectedAnswer==null){
                            return NotAnsweredCard(answer: answerText);
                          }else if(correctAnswer!=selectedAnswer && answer.identifier==selectedAnswer){
                            return WrongAnswerCard(answer: answerText);
                          }else if(correctAnswer==answer.identifier){
                            return CorrectAnswerCard(answer: answerText);
                          }
                          // returning question card as item to be used in the ListView Builder
                          return AnswerCard(
                            answer: '${answer.identifier}.  ${answer.answer}', 
                            isSelected: false,
                            onPressed: (){},
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}