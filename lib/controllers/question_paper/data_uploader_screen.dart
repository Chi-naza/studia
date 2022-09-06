import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studia/controllers/question_paper/data_uploader.dart';
import 'package:studia/firebase_ref/loading_status.dart';

class DataUploaderScreen extends StatelessWidget {


  DataUploaderScreen({Key? key}) : super(key: key);

  DataUploader controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    DataUploader controller = Get.put(DataUploader());
    return Scaffold(
      body: Center(
        child:Obx(() => Text(controller.loadingStatus == LoadingStatus.loading? "Uploading ..." : "Uploaded Successfully ...")) ,
      ),
    );
  }
}