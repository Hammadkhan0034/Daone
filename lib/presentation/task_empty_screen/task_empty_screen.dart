import '../task_empty_screen/widgets/listgroup_item_widget.dart';
import '../task_empty_screen/widgets/listmonth1_item_widget.dart';
import 'controller/task_empty_controller.dart';
import 'models/listgroup_item_model.dart';
import 'models/listmonth1_item_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/appbar_subtitle.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_bottom_bar.dart';
import 'package:daone/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class TaskEmptyScreen extends GetWidget<TaskEmptyController> {
  const TaskEmptyScreen({Key? key})
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
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: getVerticalSize(
                    85,
                  ),
                  child: Obx(
                    () => ListView.separated(
                      padding: getPadding(
                        left: 4,
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
                      itemCount: controller.taskEmptyModelObj.value
                          .listmonth1ItemList.value.length,
                      itemBuilder: (context, index) {
                        Listmonth1ItemModel model = controller.taskEmptyModelObj
                            .value.listmonth1ItemList.value[index];
                        return Listmonth1ItemWidget(
                          model,
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: getVerticalSize(
                      65,
                    ),
                    child: Obx(
                      () => ListView.separated(
                        padding: getPadding(
                          left: 21,
                          top: 30,
                        ),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (
                          context,
                          index,
                        ) {
                          return SizedBox(
                            width: getHorizontalSize(
                              13,
                            ),
                          );
                        },
                        itemCount: controller.taskEmptyModelObj.value
                            .listgroupItemList.value.length,
                        itemBuilder: (context, index) {
                          ListgroupItemModel model = controller
                              .taskEmptyModelObj
                              .value
                              .listgroupItemList
                              .value[index];
                          return ListgroupItemWidget(
                            model,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  height: getVerticalSize(
                    519,
                  ),
                  width: double.maxFinite,
                  margin: getMargin(
                    top: 36,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Opacity(
                        opacity: 0.15,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgEllipse2542,
                          height: getVerticalSize(
                            270,
                          ),
                          width: getHorizontalSize(
                            172,
                          ),
                          alignment: Alignment.topLeft,
                        ),
                      ),
                      Opacity(
                        opacity: 0.15,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgEllipse2553,
                          height: getVerticalSize(
                            270,
                          ),
                          width: getHorizontalSize(
                            169,
                          ),
                          alignment: Alignment.bottomRight,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: getPadding(
                            left: 69,
                            top: 45,
                            right: 70,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomImageView(
                                svgPath: ImageConstant.imgObjectsDeepOrangeA100,
                                height: getVerticalSize(
                                  196,
                                ),
                                width: getHorizontalSize(
                                  200,
                                ),
                              ),
                              Container(
                                width: getHorizontalSize(
                                  236,
                                ),
                                margin: getMargin(
                                  top: 33,
                                ),
                                child: Text(
                                  "msg_you_don_t_have_any".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyles
                                      .titleSmallHindSiliguriGray70001,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 30,
                    top: 118,
                    right: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: getPadding(
                          top: 3,
                          bottom: 3,
                        ),
                        child: Text(
                          "msg_workout_progress".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      CustomDropDown(
                        width: getHorizontalSize(
                          76,
                        ),
                        icon: Container(
                          margin: getMargin(
                            left: 5,
                            right: 10,
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgArrowdown,
                          ),
                        ),
                        hintText: "lbl_weekly".tr,
                        textStyle: CustomTextStyles.bodySmallWhiteA70010,
                        items: controller
                            .taskEmptyModelObj.value.dropdownItemList.value,
                        contentPadding: getPadding(
                          left: 10,
                          top: 7,
                          bottom: 7,
                        ),
                        onChanged: (value) {
                          controller.onSelected(value);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: getVerticalSize(
                    182,
                  ),
                  width: getHorizontalSize(
                    315,
                  ),
                  margin: getMargin(
                    top: 5,
                  ),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: getVerticalSize(
                                164,
                              ),
                              width: getHorizontalSize(
                                283,
                              ),
                              margin: getMargin(
                                top: 8,
                              ),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      height: getVerticalSize(
                                        137,
                                      ),
                                      width: getHorizontalSize(
                                        283,
                                      ),
                                      padding: getPadding(
                                        top: 11,
                                        bottom: 11,
                                      ),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: fs.Svg(
                                            ImageConstant.imgGroup116,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          CustomImageView(
                                            imagePath:
                                                ImageConstant.imgLinegraph,
                                            height: getVerticalSize(
                                              110,
                                            ),
                                            width: getHorizontalSize(
                                              282,
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      width: getHorizontalSize(
                                        275,
                                      ),
                                      margin: getMargin(
                                        left: 4,
                                        top: 146,
                                        right: 4,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "lbl_sun".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                          Text(
                                            "lbl_mon".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                          Text(
                                            "lbl_tue".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                          Text(
                                            "lbl_wed".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                          Text(
                                            "lbl_thu".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                          Text(
                                            "lbl_fri".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.labelLarge,
                                          ),
                                          Text(
                                            "lbl_sat".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  CustomImageView(
                                    imagePath:
                                        ImageConstant.imgActivegraphPink900,
                                    height: getVerticalSize(
                                      121,
                                    ),
                                    width: getHorizontalSize(
                                      25,
                                    ),
                                    alignment: Alignment.bottomRight,
                                    margin: getMargin(
                                      right: 39,
                                      bottom: 5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 3,
                                bottom: 18,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "lbl_100".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.right,
                                      style: CustomTextStyles.bodySmall10,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 2,
                                      top: 12,
                                    ),
                                    child: Text(
                                      "lbl_80".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.right,
                                      style: CustomTextStyles.bodySmall10,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 2,
                                      top: 11,
                                    ),
                                    child: Text(
                                      "lbl_60".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.right,
                                      style: CustomTextStyles.bodySmall10,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 12,
                                    ),
                                    child: Text(
                                      "lbl_40".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.right,
                                      style: theme.textTheme.labelMedium,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 3,
                                      top: 11,
                                    ),
                                    child: Text(
                                      "lbl_20".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.right,
                                      style: CustomTextStyles.bodySmall10,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 3,
                                      top: 12,
                                    ),
                                    child: Text(
                                      "lbl_0".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.right,
                                      style: CustomTextStyles.bodySmall10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: getMargin(
                            left: 94,
                            right: 91,
                          ),
                          padding: getPadding(
                            all: 10,
                          ),
                          decoration: AppDecoration.outline2.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder8,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "lbl_fri_28_may".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.bodySmallGray500058,
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 33,
                                    ),
                                    child: Text(
                                      "lbl_90".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          CustomTextStyles.bodySmallGreen5008,
                                    ),
                                  ),
                                  CustomImageView(
                                    svgPath: ImageConstant.imgUpload,
                                    height: getSize(
                                      8,
                                    ),
                                    width: getSize(
                                      8,
                                    ),
                                    margin: getMargin(
                                      top: 2,
                                      bottom: 2,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 3,
                                ),
                                child: Text(
                                  "msg_upperbody_workout".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.bodySmall10_1,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 3,
                                ),
                                child: Container(
                                  height: getVerticalSize(
                                    5,
                                  ),
                                  width: getHorizontalSize(
                                    110,
                                  ),
                                  decoration: BoxDecoration(
                                    color: appTheme.gray50,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        2,
                                      ),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        2,
                                      ),
                                    ),
                                    child: LinearProgressIndicator(
                                      value: 0.79,
                                      backgroundColor: appTheme.gray50,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
