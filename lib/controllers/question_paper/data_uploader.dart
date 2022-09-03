import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:studia/firebase_ref/references.dart';
import 'package:studia/main.dart';
import 'package:studia/models/question_paper_model.dart';

class DataUploader extends GetxController {

  @override  // called once when the app starts 
  void onReady(){
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {
    // Because we want to upload our data to firebase. We get an instance of firestore
    final fireStore = FirebaseFirestore.instance;


    print("Data is uploading . . . ");  // testing
    
    // Loading the files in our assets.
    final manifestContent = await DefaultAssetBundle.of(Get.context!).loadString("AssetManifest.json");

    final Map<String, dynamic> manifestMap =  json.decode(manifestContent);

    // Sifting out other files and making sure that only paper files ending with .json are uploaded & read
    // We load all the papers and covert them to a list
    final papersInAssets = manifestMap.keys.where((path) => path.startsWith("assets/DB/papers") && path.contains(".json")).toList();

    print("PAPERS in ASSETS :::: $papersInAssets"); // testing to see the loaded papers

    // creating an empty list of type QuestionPaperModel
    List<QuestionPaperModel> questionPapers = [];

    // Using for loop to get the content of each of the papers in the list]
    for(var paper in papersInAssets){
      String stringPaperContent = await rootBundle.loadString(paper); // NB: each paper item contains the path to the actual item
      //print("Paper Contents in String ::: $stringPaperContent"); // test:seeing the contents
      questionPapers.add(QuestionPaperModel.fromJson(jsonDecode(stringPaperContent)));
    }

    print("No. of Papers Available: ${questionPapers.length}"); // testing 

    var batch = fireStore.batch();

    // programmatically uploading our paper data
    for(var paper in questionPapers){
      batch.set(questionPaperRF.doc(paper.id) , {
        'title': paper.title,
        'image_url': paper.imageUrl,
        'description': paper.description,
        'time_seconds': paper.timeSeconds,
        'questions_count': paper.questions == null? 0 : paper.questions!.length
      });
    }

    // saving the batch file to the FireStore after the loop
    await batch.commit(); 


  }

}