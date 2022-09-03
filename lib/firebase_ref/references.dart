import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studia/models/question_paper_model.dart';

final fireStore = FirebaseFirestore.instance;

final questionPaperRF = fireStore.collection("questionPapers");