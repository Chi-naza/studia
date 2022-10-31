

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:studia/controllers/auth_controller.dart';
import 'package:studia/controllers/question_paper/questions_controller.dart';
import 'package:studia/firebase_ref/references.dart';
import 'package:studia/utils/app_logger.dart';

// extension: Gives us a way of adding methods to an already existing class. 
//The parent class cannot be overridden. You can also access the extension methods 
// through the parent class --you don't need to call the name of the extension or subclass.

extension QuestionsControllerExtensions on QuestionsController{

  // Using the where method on the allQuestions list to get the no. of correctly answered questions
  int get correctQuestionCount => allQuestions.where((question) {
    return question.selectedAnswer == question.correctAnswer;
  }).toList().length;


  // A getter to return the remark Text
  String get quizResultRemarkText {
    return "$correctQuestionCount out of ${allQuestions.length} are correct";
  }


  // A getter to return the points gotten by the student
  String get quizPoints{
    var points = (correctQuestionCount/allQuestions.length)*100;
    return points.toStringAsFixed(2);
  }


  // Saving the user's Quiz result and details to the DataBase
  Future<void> saveQuizResult() async {
    // initializing batch instance using fireStore ref object
    var batch = fireStore.batch();
    User? user = Get.find<AuthController>().getUser();
    // if user is not loggedIn, return
    if(user == null) return;

    try{
      // setting user's quiz details and preparing for upload
      batch.set(
        userRF.doc(user.email).collection('Quizes_Taken').doc(questionPaperModel.id), 
        {
          'points' : quizPoints,
          'correct_answer' : '$correctQuestionCount/${allQuestions.length}',
          'question_id' : questionPaperModel.id,
          'time_used' : questionPaperModel.timeSeconds - remainSeconds,
        }
      );

      // saving the details
      await batch.commit();
      // go to home when successful
      navigateToHomeScreen(); 
    }catch (e){
      AppLogger.e(e);
    }
  }


}