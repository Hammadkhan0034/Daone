import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/community_tab_container_screen/models/community_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the CommunityTabContainerScreen.
///
/// This class manages the state of the CommunityTabContainerScreen, including the
/// current communityTabContainerModelObj
class CommunityTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<CommunityTabContainerModel> communityTabContainerModelObj =
      CommunityTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 2));
}
