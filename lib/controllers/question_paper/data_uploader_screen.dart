import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studia/controllers/question_paper/data_uploader.dart';

class DataUploaderScreen extends StatelessWidget {
  const DataUploaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataUploader controller = Get.put(DataUploader());
    return Scaffold(
      body: Center(
        child: Text("Uploading ..."),
      ),
    );
  }
}