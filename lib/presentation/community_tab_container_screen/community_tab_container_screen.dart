import 'controller/community_tab_container_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/community_page/community_page.dart';
import 'package:daone/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class CommunityTabContainerScreen extends GetWidget<CommunityTabContainerController> {
  const CommunityTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 45,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomIconButton(
                  height: 48,
                  width: 48,
                  margin: getMargin(
                    left: 29,
                  ),
                  padding: getPadding(
                    all: 11,
                  ),
                  child: CustomImageView(
                    onTap: (){
                      Get.back();
                    },
                    svgPath: ImageConstant.imgInfo,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(
                      left: 29,
                      top: 17,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: getVerticalSize(
                            44,
                          ),
                          width: getHorizontalSize(
                            131,
                          ),
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "lbl_community".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.titleLarge21,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: getPadding(
                                    left: 1,
                                  ),
                                  child: Text(
                                    "lbl_good_morning".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.bodySmallGray900019,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: getVerticalSize(
                            40,
                          ),
                          width: getHorizontalSize(
                            166,
                          ),
                          margin: getMargin(
                            left: 20,
                            top: 1,
                            bottom: 2,
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
                            unselectedLabelColor: appTheme.gray900,
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
                                  "lbl_trending".tr,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "lbl_following".tr,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(
                    660,
                  ),
                  child: TabBarView(
                    controller: controller.tabviewController,
                    children: [
                      CommunityPage(),
                      CommunityPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
