import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:studia/controllers/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController{
  final zoomDrawerController = ZoomDrawerController();

  Rxn<User?> user = Rxn();

  @override
  void onReady() {
    // calling getUser() from authController
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  // A function which will toggle the drawer whenever called. This will be called by our menu icon
  void toggleDrawer(){
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut(){
    Get.find<AuthController>().signOut();
  }


  void signIn(){

  }


  void website(){
    _launch("https://portfolio-xx.herokuapp.com/");
  }

  void facebook(){
    _launch("https://facebook.com/");
  }

  // Function which enables a user to send email. whenever it is called
  void email(){
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'ugwuokechinazajames@gmail.com'
    );

    _launch(emailLaunchUri.toString());
  }


  // A function which launches the default browser when email or any other url is clicked. In order to send the email
  // The plugIn: url_launcher provedes us with launch() method which executes the launching
  // it takes in url as a string and launches it whenever called
  Future<void> _launch(String url) async{
    if(!await launch(url)){
      throw 'Could not launch $url';
    }
  }




}