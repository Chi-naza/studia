import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:studia/controllers/question_paper_controller.dart';
import 'package:studia/firebase_ref/loading_status.dart';
import 'package:studia/firebase_ref/references.dart';
import 'package:studia/models/question_paper_model.dart';
import 'package:studia/screens/home/home_screen.dart';
import 'package:studia/screens/questions/result_screen.dart';

class QuestionsController extends GetxController {

  final loadingStatus = LoadingStatus.loading.obs;

  late QuestionPaperModel questionPaperModel;

  final allQuestions = <Questions>[];

  Rxn<Questions> currentQuestion = Rxn<Questions>();

  //Next Question variables
  final questionIndex = 0.obs;
  bool get isFirstQuestion => questionIndex > 0;

  bool get isLastQuestion => questionIndex.value == allQuestions.length-1;

  // Timer
  Timer? _timer;
  int remainSeconds = 1;
  final time = '00.00'.obs;



  @override
  void onReady() {
    // Retrieving the arguments passed to our screen
    final _questionPaper = Get.arguments as QuestionPaperModel;
    print("PAPER TITLE: ${_questionPaper.title}");
    //  calling the method that fetches data from fireBase
    loadData(_questionPaper);
    super.onReady();
  }



  // A function which fetches Questions and their respective answer data from firebase
  Future<void> loadData(QuestionPaperModel questionPaper) async {
    // initializing our questionPaperModel variable we declared above
    questionPaperModel = questionPaper;

    try{
      // for tracking
      loadingStatus.value = LoadingStatus.loading; 

      QuerySnapshot<Map<String, dynamic>> questionData =  await questionPaperRF.doc(questionPaper.id).collection('questions').get();

      final questions = questionData.docs.map((e) => Questions.fromSnapshot(e)).toList();

      // updating questions field in our model
      questionPaper.questions = questions;

      // Getting the answers field from firestore by looping through each of the questions
      for(var question in questionPaper.questions!){
        final answersData = await questionPaperRF.doc(questionPaper.id).collection('questions').doc(question.id).collection('answers').get();
        final answers = answersData.docs.map((e) => Answers.fromSnapshot(e)).toList();
        //updating answers field in our model
        question.answers = answers;
      }

    }catch(e){
      loadingStatus.value = LoadingStatus.error;
      if(kDebugMode){
        print("Load question error: $e");
      }
    }

    // if question data exists and is not null, we . . .
    if(questionPaper.questions != null && questionPaper.questions!.isNotEmpty){
      allQuestions.assignAll(questionPaper.questions!);
      print("QUESTION GOTTEN: ${questionPaper.questions![0].question}");// testing
      // Setting the current question to the first one in the list
      currentQuestion.value = questionPaper.questions![0];
      // calling our time countDown method
      _startCountDown(questionPaper.timeSeconds);
      loadingStatus.value = LoadingStatus.completed;
    }else{
      loadingStatus.value = LoadingStatus.error;
    }

  }




  // A function which gets the answer that was picked and updates our model
  void selectedAnswer(String? answer){
    currentQuestion.value!.selectedAnswer = answer;
    // The list takes the id of the particular GetBuilder we want to update.
    update(['answer_list']);
  }




  // Function which implemets 'next-question-functionality'.
  // If the question index is not equal to allQuestion length, increment it.
  // Then, the next question is ushered in, as the allQuestions List is passed a new index
  void nextQuestion(){
    if(questionIndex.value == allQuestions.length-1){
      return;
    }else{
      questionIndex.value++;
      currentQuestion.value = allQuestions[questionIndex.value];
    }
  }




  // A function which selects the previous question, when it is called
  void prevQuestion(){
    if(questionIndex.value <= 0){
      return;
    }else{
      questionIndex.value--;
      currentQuestion.value = allQuestions[questionIndex.value];
    }
  }





  // A function which performs time countDown
  void _startCountDown(int secondz){

    const duration = Duration(seconds: 1);
    // modifiying the value of our remainSeconds with the new time of the quiz
    remainSeconds = secondz;

    // This timer.Periodic is called repeatedly like a loop until the timer is canceled
    _timer = Timer.periodic(duration, (Timer timer) { 
      if(remainSeconds == 0){
        timer.cancel();
      }else{
        int minutes = remainSeconds~/60;
        int seconds = remainSeconds%60;
        time.value = "${minutes.toString().padLeft(2,'0')}:${seconds.toString().padLeft(2,'0')}"; //updating the value of time
        print("Time :::::: ${time.value}"); //testing
        remainSeconds--; // countDown
      }
    });
  }




  // A getter function which returns the number of questions answered
  String get completedQuiz{
    final answered = allQuestions.where((question) => question.selectedAnswer != null).toList().length;
    return "$answered out of ${allQuestions.length} answered";
  }



  // A function which helps a user jump from one question to another
  void jumpToQuestion(int index, {bool isGoBack =true}){
    questionIndex.value = index;
    currentQuestion.value = allQuestions[index];
    if(isGoBack){
      Get.back();
    }
  }



  // A function invoked when user have completed the quiz.
  void quizFinished(){
    _timer!.cancel();
    Get.offAndToNamed(ResultScreen.routeName);
  }


  // A function called when a user want to try again
  void tryAgain(){
    Get.find<QuestionPaperController>().navigateToQuestions(
      paperModel: questionPaperModel,
      tryAgain: true,
    );
  }


  // A function which takes user to the homeScreen
  void navigateToHomeScreen(){
    _timer!.cancel();
    Get.offNamedUntil(HomeScreen.routeName, (route) => false);
  }




}