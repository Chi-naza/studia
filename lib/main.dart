import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studia/bindings/initial_bindings.dart';
import 'package:studia/configuration/themes/app_dark_theme.dart';
import 'package:studia/configuration/themes/app_light_theme.dart';
import 'package:studia/controllers/question_paper/data_uploader_screen.dart';
import 'package:studia/controllers/theme_controller.dart';
import 'package:studia/firebase_options.dart';
import 'package:studia/routes/app_routes.dart';
import 'package:studia/screens/home/home_screen.dart';
import 'package:studia/screens/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

// void main() {
//   WidgetsFlutterBinding.ensureInitialized(); // ensures bindings & necessary initializations before the app finally runs
//   InitialBindings().dependencies();
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'studia',
      debugShowCheckedModeBanner: false,
      theme: Get.find<ThemeController>().lightTheme,
      // home: HomeScreen(),
      getPages: AppRoutes.routes(),
    );
  }
}


