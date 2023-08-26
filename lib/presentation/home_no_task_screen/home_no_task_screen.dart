import 'controller/home_no_task_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_image.dart';
import 'package:daone/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:daone/widgets/app_bar/appbar_subtitle_6.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_bottom_bar.dart';
import 'package:daone/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class HomeNoTaskScreen extends GetWidget<HomeNoTaskController> {
  const HomeNoTaskScreen({Key? key})
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
            81,
          ),
          leadingWidth: 91,
          leading: AppbarImage(
            height: getSize(
              70,
            ),
            width: getSize(
              70,
            ),
            imagePath: ImageConstant.imgUntit11,
            margin: getMargin(
              left: 21,
            ),
          ),
          title: Padding(
            padding: getPadding(
              left: 1,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppbarSubtitle6(
                  text: "lbl_welcome_back2".tr,
                ),
                AppbarSubtitle1(
                  text: "lbl_stefani".tr,
                  margin: getMargin(
                    right: 18,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            AppbarImage(
              height: getSize(
                40,
              ),
              width: getSize(
                40,
              ),
              svgPath: ImageConstant.imgFolder,
              margin: getMargin(
                left: 30,
                top: 5,
                right: 30,
                bottom: 25,
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 21,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: getVerticalSize(
                    124,
                  ),
                  width: getHorizontalSize(
                    317,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgBa,
                        height: getVerticalSize(
                          124,
                        ),
                        width: getHorizontalSize(
                          317,
                        ),
                        radius: BorderRadius.circular(
                          getHorizontalSize(
                            22,
                          ),
                        ),
                        alignment: Alignment.center,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: getHorizontalSize(
                            205,
                          ),
                          margin: getMargin(
                            left: 22,
                            bottom: 23,
                          ),
                          child: Text(
                            "msg_transform_your_mind".tr,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                CustomTextStyles.titleSmallPoppinsWhiteA70015,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: getVerticalSize(
                    472,
                  ),
                  width: double.maxFinite,
                  margin: getMargin(
                    top: 21,
                  ),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Opacity(
                        opacity: 0.15,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgEllipse2551,
                          height: getVerticalSize(
                            270,
                          ),
                          width: getHorizontalSize(
                            169,
                          ),
                          alignment: Alignment.bottomRight,
                        ),
                      ),
                      Opacity(
                        opacity: 0.15,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgEllipse2541,
                          height: getVerticalSize(
                            210,
                          ),
                          width: getHorizontalSize(
                            173,
                          ),
                          alignment: Alignment.topLeft,
                          margin: getMargin(
                            top: 97,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: getMargin(
                            left: 29,
                          ),
                          padding: getPadding(
                            left: 4,
                            right: 4,
                          ),
                          decoration: AppDecoration
                              .gradientnamedeeporange300namedeeporangeA200
                              .copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder14,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  height: getVerticalSize(
                                    85,
                                  ),
                                  width: getHorizontalSize(
                                    131,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Opacity(
                                        opacity: 0.5,
                                        child: CustomImageView(
                                          imagePath: ImageConstant.imgVector8,
                                          height: getVerticalSize(
                                            75,
                                          ),
                                          width: getHorizontalSize(
                                            58,
                                          ),
                                          alignment: Alignment.topLeft,
                                          margin: getMargin(
                                            left: 33,
                                          ),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.5,
                                        child: CustomImageView(
                                          imagePath: ImageConstant.imgVector8,
                                          height: getVerticalSize(
                                            75,
                                          ),
                                          width: getHorizontalSize(
                                            58,
                                          ),
                                          alignment: Alignment.topRight,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: SizedBox(
                                          height: getVerticalSize(
                                            68,
                                          ),
                                          width: getHorizontalSize(
                                            67,
                                          ),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "lbl_60".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: CustomTextStyles
                                                      .titleMediumWhiteA700Medium_2,
                                                ),
                                              ),
                                              CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgSearch,
                                                height: getSize(
                                                  67,
                                                ),
                                                width: getSize(
                                                  67,
                                                ),
                                                alignment: Alignment.center,
                                              ),
                                              CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgVector67x57,
                                                height: getVerticalSize(
                                                  67,
                                                ),
                                                width: getHorizontalSize(
                                                  57,
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: getVerticalSize(
                                  35,
                                ),
                                width: getHorizontalSize(
                                  90,
                                ),
                                margin: getMargin(
                                  left: 11,
                                  top: 12,
                                  bottom: 16,
                                ),
                                child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: SizedBox(
                                        height: getVerticalSize(
                                          24,
                                        ),
                                        width: getHorizontalSize(
                                          90,
                                        ),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "lbl_completed".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: CustomTextStyles
                                                    .titleMediumWhiteA700Medium_2,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "lbl_completed".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: CustomTextStyles
                                                    .titleMediumWhiteA700Medium_2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        "lbl_80_tasks".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: CustomTextStyles
                                            .labelMediumWhiteA700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: getVerticalSize(
                            149,
                          ),
                          width: getHorizontalSize(
                            151,
                          ),
                          margin: getMargin(
                            right: 30,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgRectangle11,
                                height: getVerticalSize(
                                  149,
                                ),
                                width: getHorizontalSize(
                                  151,
                                ),
                                radius: BorderRadius.circular(
                                  getHorizontalSize(
                                    15,
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: getPadding(
                                    left: 14,
                                    right: 13,
                                    bottom: 11,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: getHorizontalSize(
                                          124,
                                        ),
                                        child: Text(
                                          "msg_i_deserve_to_experience".tr,
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: CustomTextStyles
                                              .bodyMediumRadleyGray800,
                                        ),
                                      ),
                                      CustomImageView(
                                        svgPath:
                                            ImageConstant.imgArrowrightBlack900,
                                        height: getSize(
                                          20,
                                        ),
                                        width: getSize(
                                          20,
                                        ),
                                        margin: getMargin(
                                          top: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: getHorizontalSize(
                            204,
                          ),
                          margin: getMargin(
                            bottom: 85,
                          ),
                          child: Text(
                            "msg_you_don_t_have_any".tr,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles
                                .labelLargeHindSiliguriGray70001,
                          ),
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgObjectsDeepOrangeA100,
                        height: getVerticalSize(
                          129,
                        ),
                        width: getHorizontalSize(
                          132,
                        ),
                        alignment: Alignment.bottomCenter,
                        margin: getMargin(
                          bottom: 152,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 30,
                    top: 188,
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
                            .homeNoTaskModelObj.value.dropdownItemList.value,
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
                                    imagePath: ImageConstant.imgActivegraph,
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
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {},
        ),
      ),
    );
  }
}
