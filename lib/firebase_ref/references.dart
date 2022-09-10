import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fireStore = FirebaseFirestore.instance;

final questionPaperRF = fireStore.collection("questionPapers");

DocumentReference questionRF({ required paperId, required questionId}) {
  return questionPaperRF.doc(paperId).collection("questions").doc(questionId);
}


// Creating a getter refrence from firebase Storage
Reference get firebaseStorage => FirebaseStorage.instance.ref();