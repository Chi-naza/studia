import 'package:get/get.dart';
import 'package:studia/controllers/question_paper_controller.dart';
import 'package:studia/controllers/zoom_drawer_controller.dart';
import 'package:studia/screens/Introduction/introduction.dart';
import 'package:studia/screens/auth/login_screen.dart';
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
      name: IntroductionScreen.routeName, 
      page: () => IntroductionScreen(),
    ),

    // home
    GetPage(
      name: HomeScreen.routeName, 
      page: () => HomeScreen(),
      // Injecting questionPaperController in the bindings. If you dont inject it, you cannot use it
      binding: BindingsBuilder((() {
        Get.put(QuestionPaperController());
        Get.put(MyZoomDrawerController());
      })),
    ),

      // Login Screen
    GetPage(
      name: LoginScreen.routeName, 
      page: () => LoginScreen(),
    ),


  ];


}