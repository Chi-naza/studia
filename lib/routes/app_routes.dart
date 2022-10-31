import 'package:get/get.dart';
import 'package:studia/controllers/question_paper/questions_controller.dart';
import 'package:studia/controllers/question_paper_controller.dart';
import 'package:studia/controllers/zoom_drawer_controller.dart';
import 'package:studia/screens/Introduction/introduction.dart';
import 'package:studia/screens/auth/login_screen.dart';
import 'package:studia/screens/home/home_screen.dart';
import 'package:studia/screens/questions/answer_check_screen.dart';
import 'package:studia/screens/questions/question_screen.dart';
import 'package:studia/screens/questions/quiz_overview_screen.dart';
import 'package:studia/screens/questions/result_screen.dart';
import 'package:studia/screens/splash/splash_screen.dart';

class AppRoutes {

  static List<GetPage> routes() => [
    // splash
    GetPage(
      name: '/', 
      page: () => const SplashScreen(),
    ),
    
    // Intro
    GetPage(
      name: IntroductionScreen.routeName, 
      page: () => const IntroductionScreen(),
    ),

    // home
    GetPage(
      name: HomeScreen.routeName, 
      page: () => const HomeScreen(),
      // Injecting questionPaperController in the bindings. If you dont inject it, you cannot use it
      binding: BindingsBuilder((() {
        Get.put(QuestionPaperController());
        Get.put(MyZoomDrawerController());
      })),
    ),

    // Login Screen
    GetPage(
      name: LoginScreen.routeName, 
      page: () => const LoginScreen(),
    ),

    // Question Screen Screen
    GetPage(
      name: QuestionScreen.routeName, 
      page: () => const QuestionScreen(),
      binding: BindingsBuilder(() {
        Get.put<QuestionsController>(QuestionsController());
      }),
    ),

    // Quiz Overview Screen
    GetPage(
      name: QuizOverviewScreen.routeName, 
      page: () => const QuizOverviewScreen(),
    ),

    // Result Screen
    GetPage(
      name: ResultScreen.routeName, 
      page: () => const ResultScreen(),
    ),

    // Answer Check Screen
    GetPage(
      name: AnswerCheckScreen.routeName, 
      page: () => const AnswerCheckScreen(),
    ),


  ];


}