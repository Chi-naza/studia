import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:studia/firebase_ref/references.dart';
import 'package:studia/screens/auth/login_screen.dart';
import 'package:studia/screens/home/home_screen.dart';
import 'package:studia/widgets/dialogs/dialog_widget.dart';

class AuthController extends GetxController {

// onReady(): called immediately the app starts running
  @override
  void onReady(){
    initAuth();
    super.onReady();
  }

  // creating a fireBaseAuth variable;
  late FirebaseAuth _auth;

  final _user = Rxn<User>();

  late Stream<User?> _authStateChanges;





  // The Future.delayed() here enables the functions to wait for some seconds before calling the navigateToIntoScreen function
  // instantiating firebaseAuth
  Future<void> initAuth() async{
    await Future.delayed(Duration(seconds: 3));

    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();

    // checking if the current user is registered or exists
    _authStateChanges.listen((User? user){ 
      _user.value = user;
    });

    navigateToIntroduction();
  }



  // function which navigates to the intro screen after the splash screen
  void navigateToIntroduction(){
    Get.offAllNamed('/introduction');
  }


  // Google signIn function
  signInWithGoogle() async {
    final GoogleSignIn _googleSignIn =  GoogleSignIn();

    try{
      GoogleSignInAccount? account = await _googleSignIn.signIn();

      if (account != null){
        final _authAccount = await account.authentication;

        final _credential = GoogleAuthProvider.credential(
          idToken: _authAccount.idToken,
          accessToken: _authAccount.accessToken,
        );

        await _auth.signInWithCredential(_credential);
        await saveUser(account);  // saving the user details in our firebase DB
        navigateToHomeScreen();
      }
    }on Exception catch(error){
      return debugPrint("GOOGLE SIGN IN Exception ::: $error");
    }
  }


  // Function which gets currentUser's values/data
  User? getUser(){
    _user.value = _auth.currentUser;
    return _user.value;
  }

// This function retrieves some data from Google Account and saves it in our fireStore (dataBase)
  saveUser(GoogleSignInAccount account){
    userRF.doc(account.email).set({
      "email" : account.email,
      "name" : account.displayName,
      "profile_pic" : account.photoUrl,
    });
  }



  // shows alertDialog. It calls our custom alertDialog in the Dialog Class
  showLogInAlertDialog(){
    Get.dialog(
      Dialog.questionStartDialog(onTap: (){
        Get.back();
        //Navigate to LoginScreen function called here
        navigateToLoginScreen();
      }),
      barrierDismissible: false,
    );
  }


  // checking of a current user is loggedIn
  bool isLoggedIn(){
    return _auth.currentUser != null;
  }


  // A function that takes a user to the logIn screen
  navigateToLoginScreen(){
    Get.toNamed(LoginScreen.routeName);
  }


  // The main signOut function
  Future<void> signOut() async {
    try{
      await _auth.signOut();
      navigateToHomeScreen();
    }on FirebaseAuthException catch(e){
      print("SignOut Error From FireBase: $e");
    }
  }


  // A function that takes a user to the home screen
  navigateToHomeScreen(){
    Get.offAllNamed(HomeScreen.routeName);
  }



}