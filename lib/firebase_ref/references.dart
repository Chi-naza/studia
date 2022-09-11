import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

// Instantiating fireStore
final fireStore = FirebaseFirestore.instance;

// Question paper 'Collection' reference
final questionPaperRF = fireStore.collection("questionPapers");

// Question reference: questions is a sub-collection in Question Paper Collection
DocumentReference questionRF({ required paperId, required questionId}) {
  return questionPaperRF.doc(paperId).collection("questions").doc(questionId);
}


// Creating a getter refrence from firebase Storage
Reference get firebaseStorage => FirebaseStorage.instance.ref();


// Creating a user reference for a firebase collection
final userRF = fireStore.collection("users");