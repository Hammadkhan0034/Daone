import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/view_friends_tab_container_screen/models/view_friends_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ViewFriendsTabContainerScreen.
///
/// This class manages the state of the ViewFriendsTabContainerScreen, including the
/// current viewFriendsTabContainerModelObj
class ViewFriendsTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<ViewFriendsTabContainerModel> viewFriendsTabContainerModelObj =
      ViewFriendsTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 2));
}
