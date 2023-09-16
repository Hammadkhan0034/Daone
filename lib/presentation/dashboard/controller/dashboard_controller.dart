


import 'package:daone/core/app_export.dart';

class DashBoardController extends GetxController{
var tabIndex =0;
void changeTabIndex(var index){
  tabIndex=index;
  update();
}
}