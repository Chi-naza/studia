import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class MyZoomDrawerController extends GetxController{
  final zoomDrawerController = ZoomDrawerController();

  // A function which will toggle the drawer whenever called. This will be called by our menu icon
  void toggleDrawer(){
    zoomDrawerController.toggle?.call();
    update();
  }
}