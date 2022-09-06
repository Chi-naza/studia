import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studia/models/question_paper_model.dart';

final fireStore = FirebaseFirestore.instance;

final questionPaperRF = fireStore.collection("questionPapers");

DocumentReference questionRF({ required paperId, required questionId}) {
  return questionPaperRF.doc(paperId).collection("questions").doc(questionId);
}