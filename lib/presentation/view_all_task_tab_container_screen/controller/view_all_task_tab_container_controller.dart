import 'package:daone/presentation/view_all_task_tab_container_screen/models/view_all_task_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../date_widget/date_utils.dart' as date_utils;





class ViewAllTaskTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<ViewAllTaskTabContainerModel> viewAllTaskTabContainerModelObj =
      ViewAllTaskTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 3));



  }
