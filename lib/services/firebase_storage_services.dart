import 'package:get/get.dart';
import 'package:studia/firebase_ref/references.dart';



class FirebaseStorageService extends GetxService {

  // A function that gets the images stored in the firebase Storages
  Future<String?> getImage(String? imageName) async {
    if(imageName == null){
      return null;
    }

    try{
      var urlRef = firebaseStorage.child('question_paper_images').child('${imageName.toLowerCase()}.png');
      var imageUrl = await urlRef.getDownloadURL();
      return imageUrl;
    }catch (e){
      print("From Firebase Service File: $e");
      return null;
    }
  }


}