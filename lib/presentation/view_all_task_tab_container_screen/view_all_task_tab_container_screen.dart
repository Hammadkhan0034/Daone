import '../view_all_task_tab_container_screen/widgets/listmonth_item_widget.dart';
import 'controller/view_all_task_tab_container_controller.dart';
import 'models/listmonth_item_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/view_all_task_page/view_all_task_page.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/appbar_subtitle.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ViewAllTaskTabContainerScreen
    extends GetWidget<ViewAllTaskTabContainerController> {
  const ViewAllTaskTabContainerScreen({Key? key})
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
            79,
          ),
          leadingWidth: 72,
          leading: AppbarIconbutton(
            onTap: (){
              Get.back();
            },
            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              left: 24,
              top: 4,
              bottom: 4,
            ),
          ),
          centerTitle: true,
          title: AppbarSubtitle(
            text: "lbl_tasks".tr,
          ),
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: getVerticalSize(
                  101,
                ),
                child: Obx(
                  () => ListView.separated(
                    padding: getPadding(
                      left: 4,
                      top: 16,
                      right: 6,
                    ),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (
                      context,
                      index,
                    ) {
                      return SizedBox(
                        width: getHorizontalSize(
                          12,
                        ),
                      );
                    },
                    itemCount: controller.viewAllTaskTabContainerModelObj.value
                        .listmonthItemList.value.length,
                    itemBuilder: (context, index) {
                      ListmonthItemModel model = controller
                          .viewAllTaskTabContainerModelObj
                          .value
                          .listmonthItemList
                          .value[index];
                      return ListmonthItemWidget(
                        model,
                      );
                    },
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: getPadding(
                    left: 21,
                    top: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: getVerticalSize(
                          35,
                        ),
                        width: getHorizontalSize(
                          299,
                        ),
                        child: TabBar(
                          controller: controller.tabviewController,
                          labelColor: appTheme.whiteA700,
                          labelStyle: TextStyle(),
                          unselectedLabelColor: appTheme.deepOrangeA20002,
                          unselectedLabelStyle: TextStyle(),
                          indicator: BoxDecoration(
                            color: appTheme.deepOrangeA20002,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                14,
                              ),
                            ),
                          ),
                          tabs: [
                            Tab(
                              child: Text(
                                "lbl_all".tr,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Tab(
                              child: Text(
                                "lbl_to_do".tr,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Tab(
                              child: Text(
                                "lbl_in_progress".tr,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(
                          123,
                        ),
                        margin: getMargin(
                          left: 10,
                        ),
                        padding: getPadding(
                          left: 17,
                          top: 4,
                          right: 17,
                          bottom: 4,
                        ),
                        decoration: AppDecoration.txtFill3.copyWith(
                          borderRadius: BorderRadiusStyle.txtRoundedBorder16,
                        ),
                        child: Text(
                          "lbl_completed".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style:
                              CustomTextStyles.titleSmallPoppinsDeeporangeA20002,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getVerticalSize(
                  448,
                ),
                child: TabBarView(
                  controller: controller.tabviewController,
                  children: [
                    ViewAllTaskPage(),
                    ViewAllTaskPage(),
                    ViewAllTaskPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {},
        ),
      ),
    );
  }
}
