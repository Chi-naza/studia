import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:studia/controllers/auth_controller.dart';
import 'package:studia/firebase_ref/references.dart';
import 'package:studia/models/question_paper_model.dart';
import 'package:studia/services/firebase_storage_services.dart';

class QuestionPaperController extends GetxController {
  // A list containing all the images gotten from the Firebase Storage. This list is 'observable'
  // i.e Getx observes this variable in case of changes, and redraws the UI accordingly.
  // Obx() is used to implement this in the UI
  final allPaperImages = <String>[].obs;

  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async{
    List<String> imageName = ['biology', 'chemistry', 'maths', 'physics']; // used for testing before

    try{
      // From cloud FireStore: getting the docs of the questionPaper collection. Data is returned in json format
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();

      // Looping through the data with map() & saving it in a list 'paperList'
      final paperList = data.docs.map((paper) => QuestionPaperModel.fromSnapshot(paper)).toList();

      // storing the data mapped through in our 'allPapers' list
      allPapers.assignAll(paperList);




      // Looping through the imageName list and getting the full path of the image 
      // Using getImage() from our firebaseStorageService controller. 
      //Then adding the imagePath/imageUrl to a list: allPaperImages
      // for(var img in imageName){
      //   final imageUrl = await Get.find<FirebaseStorageService>().getImage(img);
      //   allPaperImages.add(imageUrl!);
      // }

      // Getting our images from Firebase Storages & Adding the path to the image_url field of our Controller through our List
      // NB: Images is stored separately in the storages
      for(var paper in paperList){
        final imageUrl = await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imageUrl;
      }

      // Putting all the  data in our list after image_url has been modified.
      allPapers.assignAll(paperList);

    }catch (e){
      print("From Question Paper Controller: $e");
      return null;
    }
  }


  
  void navigateToQuestions({ required QuestionPaperModel paperModel, bool tryAgain=false}){
    AuthController _authController = Get.find();

    if (_authController.isLoggedIn()){
      if(tryAgain){
        Get.back();
        // Get.offNamed()
      }else{
        // Get.toNamed()
      }
    }else{
      _authController.showLogInAlertDialog();
    }
  }



}