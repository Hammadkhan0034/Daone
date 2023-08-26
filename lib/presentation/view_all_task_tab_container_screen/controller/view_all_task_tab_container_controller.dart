import 'package:daone/core/app_export.dart';import 'package:daone/presentation/view_all_task_tab_container_screen/models/view_all_task_tab_container_model.dart';import 'package:flutter/material.dart';/// A controller class for the ViewAllTaskTabContainerScreen.
///
/// This class manages the state of the ViewAllTaskTabContainerScreen, including the
/// current viewAllTaskTabContainerModelObj
class ViewAllTaskTabContainerController extends GetxController with  GetSingleTickerProviderStateMixin {Rx<ViewAllTaskTabContainerModel> viewAllTaskTabContainerModelObj = ViewAllTaskTabContainerModel().obs;

late TabController tabviewController = Get.put(TabController(vsync: this, length: 3));

 }
