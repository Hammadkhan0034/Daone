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
                      itemCount: controller.viewAllTaskTabContainerModelObj
                          .value.listmonthItemList.value.length,
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
                            "lbl_in_progress".tr,
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
                      Container(
                        height: Get.height * 0.3,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                            //  color: Colors.teal
                            ),
                        child: Column(
                          children: [
                            SizedBox(height: Get.height * 0.08),
                            Center(
                                child: Image.asset(
                              ImageConstant.vector21,
                              scale: 4,
                            )),
                            SizedBox(height: Get.height * 0.04),
                            TextWidget(
                              text:
                                  "You don't have any schedule today.\n Tap the plus button to create new task",
                              color: Colors.black38,
                              fsize: 14,
                              font: FontWeight.w500,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: Get.height * 0.3,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                        ),
                        child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: Get.height * 0.12,
                                  width: Get.width * 0.9,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white24,
                                    border: Border.all(
                                     color: Colors.black12,
                                      // color:Color(0xffF46837),// Border color
                                      width: 2.0, // Border width
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white, // Shadow color
                                        offset: Offset(0, 2), // Specify the offset of the shadow
                                        blurRadius: 6.0, // Specify the blur radius
                                        spreadRadius: 2.0, // Specify the spread radius
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(text:"10 min Cardio, Biceps", color:Color(0xff4F5753) , fsize: 15),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            TextWidget(text:"Work out", color:Color(0xffF46837) , fsize: 15),
                                            Container(
                                                width: Get.width*0.2,
                                                height:Get.height*0.04,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(31.000001907348633),
                                                    color: Color(0xff048c44)),
                                              child: Center(
                                                child: TextWidget(text: "Done",color: Colors.white,fsize: 14,font: FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      ViewAllTaskPage(),
                      ViewAllTaskPage(),
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
