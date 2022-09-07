import 'package:get/get.dart';
import 'package:studia/controllers/auth_controller.dart';
import 'package:studia/controllers/theme_controller.dart';

 // The Bindings with the dependencies are called even before the app boots up. Later we inject the bindings in the main()
 // Hence, we inject controllers inside the dependencies . . .
 // We inject with Get.put() command. Permanent ppty is set to make the controller to persist in the memory
class InitialBindings implements Bindings {

  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
  }

}