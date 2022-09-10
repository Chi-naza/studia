import 'package:get/get.dart';
import 'package:studia/controllers/question_paper_controller.dart';
import 'package:studia/controllers/zoom_drawer_controller.dart';
import 'package:studia/screens/Introduction/introduction.dart';
import 'package:studia/screens/home/home_screen.dart';
import 'package:studia/screens/splash/splash_screen.dart';

class AppRoutes {

  static List<GetPage> routes() => [
    // splash
    GetPage(
      name: '/', 
      page: () => SplashScreen(),
    ),
    
    // Intro
    GetPage(
      name: '/introduction', 
      page: () => IntroductionScreen(),
    ),

    // home
    GetPage(
      name: '/home', 
      page: () => HomeScreen(),
      // Injecting questionPaperController in the bindings. If you dont inject it, you cannot use it
      binding: BindingsBuilder((() {
        Get.put(QuestionPaperController());
        Get.put(MyZoomDrawerController());
      })),
    ),

  ];


}