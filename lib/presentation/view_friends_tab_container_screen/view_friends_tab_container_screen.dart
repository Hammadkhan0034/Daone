import 'controller/view_friends_tab_container_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/view_friend_full_profile_page/view_friend_full_profile_page.dart';
import 'package:daone/presentation/view_friends_page/view_friends_page.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ViewFriendsTabContainerScreen
    extends GetWidget<ViewFriendsTabContainerController> {
  const ViewFriendsTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            97,
          ),
          leadingWidth: 77,
          leading: AppbarIconbutton(
            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              left: 29,
              top: 4,
              bottom: 4,
            ),
          ),
          centerTitle: true,
          title: AppbarSubtitle2(
            text: "lbl_profile".tr,
          ),
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: getVerticalSize(
                  40,
                ),
                width: getHorizontalSize(
                  305,
                ),
                margin: getMargin(
                  top: 42,
                ),
                decoration: BoxDecoration(
                  color: appTheme.gray20001,
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      20,
                    ),
                  ),
                ),
                child: TabBar(
                  controller: controller.tabviewController,
                  labelColor: appTheme.whiteA700,
                  labelStyle: TextStyle(),
                  unselectedLabelColor: theme.colorScheme.primaryContainer,
                  unselectedLabelStyle: TextStyle(),
                  indicatorPadding: getPadding(
                    all: 2.0,
                  ),
                  indicator: BoxDecoration(
                    color: appTheme.deepOrangeA20005,
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        18,
                      ),
                    ),
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        "lbl_friends".tr,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "lbl_groups".tr,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getVerticalSize(
                  633,
                ),
                child: TabBarView(
                  controller: controller.tabviewController,
                  children: [
                    ViewFriendFullProfilePage(),
                    ViewFriendsPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
