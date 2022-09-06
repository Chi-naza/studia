import 'package:get/get.dart';
import 'package:studia/Introduction/introduction.dart';
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
  ];
}