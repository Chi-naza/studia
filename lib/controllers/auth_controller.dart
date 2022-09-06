import 'package:get/get.dart';

class AuthController extends GetxController {

// onReady(): called immediately the app starts running
  @override
  void onReady(){
    initAuth();
    super.onReady();
  }


  // The Future.delayed() here enables the functions to wait for some seconds before calling the navigateToIntoScreen function
  Future<void> initAuth() async{
    await Future.delayed(Duration(seconds: 3));
    navigateToIntroduction();
  }


// function which navigates to the intro screen after the splash screen
  void navigateToIntroduction(){
    Get.offAllNamed('/introduction');
  }


}