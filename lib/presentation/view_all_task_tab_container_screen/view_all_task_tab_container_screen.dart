import 'package:daone/presentation/view_all_task_tab_container_screen/widgets/all_tasks_list.dart';
import 'package:daone/widgets/text_widget.dart';

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
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          height: getVerticalSize(
            79,
          ),
          leadingWidth: 72,
          leading: AppbarIconbutton(
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               
                // SizedBox(
                //   height: getVerticalSize(
                //     101,
                //   ),
                //   child: Obx(
                //     () => ListView.separated(
                //       padding: getPadding(
                //         left: 4,
                //         top: 16,
                //         right: 6,
                //       ),
                //       scrollDirection: Axis.horizontal,
                //       separatorBuilder: (
                //         context,
                //         index,
                //       ) {
                //         return SizedBox(
                //           width: getHorizontalSize(
                //             12,
                //           ),
                //         );
                //       },
                //       itemCount: controller.viewAllTaskTabContainerModelObj
                //           .value.listmonthItemList.value.length,
                //       itemBuilder: (context, index) {
                //         ListmonthItemModel model = controller
                //             .viewAllTaskTabContainerModelObj
                //             .value
                //             .listmonthItemList
                //             .value[index];
                //         return ListmonthItemWidget(
                //           model,
                //         );
                //       },
                //     ),
                //   ),
                // ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18.0, horizontal: 2),
                  child: SizedBox(
                    height: Get.height * 0.04,
                    width: Get.width,
                    child: TabBar(
                      controller: controller.tabviewController,
                      labelColor: appTheme.whiteA700,
                      labelStyle: TextStyle(),
                      unselectedLabelColor: appTheme.deepOrangeA20002,
                      unselectedLabelStyle: TextStyle(),
                      indicator: BoxDecoration(
                        color: appTheme.deepOrangeA20002,
                        borderRadius: BorderRadius.circular(50),
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
                            "lbl_complete".tr,
                            overflow: TextOverflow.ellipsis,
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
                      allTaskList(),
                      allTaskList(),
                      allTaskList(),
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
