import 'controller/stats_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_bottom_bar.dart';
import 'package:daone/widgets/custom_drop_down.dart';
import 'package:daone/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class StatsScreen extends GetWidget<StatsController> {
  const StatsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 28,
            top: 43,
            right: 28,
            bottom: 43,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(
                height: 45,
                width: 48,
                margin: getMargin(
                  left: 1,
                ),
                padding: getPadding(
                  all: 11,
                ),
                child: CustomImageView(
                  svgPath: ImageConstant.imgInfo,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 43,
                  right: 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 4,
                        bottom: 1,
                      ),
                      child: Text(
                        "msg_affirmations_progress".tr,
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
                      items:
                          controller.statsModelObj.value.dropdownItemList.value,
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
                margin: getMargin(
                  left: 2,
                  top: 27,
                ),
                padding: getPadding(
                  left: 6,
                  top: 16,
                  right: 6,
                  bottom: 16,
                ),
                decoration: AppDecoration.outline8.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder18,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        bottom: 22,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_1002".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.bodySmallGray600058,
                          ),
                          Padding(
                            padding: getPadding(
                              top: 16,
                              right: 1,
                            ),
                            child: Text(
                              "lbl_802".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.labelSmallErrorContainer,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 16,
                              right: 1,
                            ),
                            child: Text(
                              "lbl_602".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.bodySmallGray600058,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 17,
                              right: 1,
                            ),
                            child: Text(
                              "lbl_402".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.bodySmallGray600058,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 16,
                              right: 1,
                            ),
                            child: Text(
                              "lbl_202".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.bodySmallGray600058,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: getPadding(
                                top: 17,
                              ),
                              child: Text(
                                "lbl_02".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.bodySmallGray600058,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: getPadding(
                          left: 3,
                          top: 6,
                          bottom: 4,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: getHorizontalSize(
                                285,
                              ),
                              padding: getPadding(
                                left: 10,
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: fs.Svg(
                                    ImageConstant.imgGroup663,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: getMargin(
                                      left: 9,
                                    ),
                                    decoration: AppDecoration.fill8.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder8,
                                    ),
                                    child: Container(
                                      height: getVerticalSize(
                                        43,
                                      ),
                                      width: getHorizontalSize(
                                        20,
                                      ),
                                      margin: getMargin(
                                        top: 106,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            10,
                                          ),
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment(
                                            1,
                                            1,
                                          ),
                                          end: Alignment(
                                            -0.24,
                                            -0.31,
                                          ),
                                          colors: [
                                            appTheme.deepOrangeA20006,
                                            theme.colorScheme.primary,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: getMargin(
                                      left: 18,
                                    ),
                                    decoration: AppDecoration.fill8.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder8,
                                    ),
                                    child: Container(
                                      height: getVerticalSize(
                                        108,
                                      ),
                                      width: getHorizontalSize(
                                        20,
                                      ),
                                      margin: getMargin(
                                        top: 41,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            10,
                                          ),
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment(
                                            1,
                                            1,
                                          ),
                                          end: Alignment(
                                            -0.24,
                                            -0.31,
                                          ),
                                          colors: [
                                            theme.colorScheme.errorContainer,
                                            appTheme.cyan900,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: getMargin(
                                      left: 18,
                                    ),
                                    decoration: AppDecoration.fill8.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder8,
                                    ),
                                    child: Container(
                                      height: getVerticalSize(
                                        71,
                                      ),
                                      width: getHorizontalSize(
                                        20,
                                      ),
                                      margin: getMargin(
                                        top: 78,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            10,
                                          ),
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment(
                                            1,
                                            1,
                                          ),
                                          end: Alignment(
                                            -0.24,
                                            -0.31,
                                          ),
                                          colors: [
                                            appTheme.deepOrangeA20006,
                                            theme.colorScheme.primary,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: getMargin(
                                      left: 18,
                                    ),
                                    decoration: AppDecoration.fill8.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder8,
                                    ),
                                    child: Container(
                                      height: getVerticalSize(
                                        94,
                                      ),
                                      width: getHorizontalSize(
                                        21,
                                      ),
                                      margin: getMargin(
                                        top: 55,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            10,
                                          ),
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment(
                                            1,
                                            1,
                                          ),
                                          end: Alignment(
                                            -0.24,
                                            -0.31,
                                          ),
                                          colors: [
                                            theme.colorScheme.errorContainer,
                                            appTheme.cyan900,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: getMargin(
                                      left: 18,
                                    ),
                                    decoration: AppDecoration.fill8.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder8,
                                    ),
                                    child: Container(
                                      height: getVerticalSize(
                                        120,
                                      ),
                                      width: getHorizontalSize(
                                        20,
                                      ),
                                      margin: getMargin(
                                        top: 30,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            10,
                                          ),
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment(
                                            1,
                                            1,
                                          ),
                                          end: Alignment(
                                            -0.24,
                                            -0.31,
                                          ),
                                          colors: [
                                            appTheme.deepOrangeA20006,
                                            theme.colorScheme.primary,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: getMargin(
                                      left: 18,
                                    ),
                                    decoration: AppDecoration.fill8.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder8,
                                    ),
                                    child: Container(
                                      height: getVerticalSize(
                                        43,
                                      ),
                                      width: getHorizontalSize(
                                        20,
                                      ),
                                      margin: getMargin(
                                        top: 106,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            10,
                                          ),
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment(
                                            1,
                                            1,
                                          ),
                                          end: Alignment(
                                            -0.24,
                                            -0.31,
                                          ),
                                          colors: [
                                            theme.colorScheme.errorContainer,
                                            appTheme.cyan900,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: getMargin(
                                      left: 18,
                                    ),
                                    decoration: AppDecoration.fill8.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder8,
                                    ),
                                    child: Container(
                                      height: getVerticalSize(
                                        96,
                                      ),
                                      width: getHorizontalSize(
                                        20,
                                      ),
                                      margin: getMargin(
                                        top: 53,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            10,
                                          ),
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment(
                                            1,
                                            1,
                                          ),
                                          end: Alignment(
                                            -0.24,
                                            -0.31,
                                          ),
                                          colors: [
                                            appTheme.deepOrangeA20006,
                                            theme.colorScheme.primary,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 19,
                                top: 6,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "lbl_sun".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        CustomTextStyles.bodySmallGray6000511,
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 16,
                                    ),
                                    child: Text(
                                      "lbl_mon".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          CustomTextStyles.bodySmallGray6000511,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 16,
                                    ),
                                    child: Text(
                                      "lbl_tue".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          CustomTextStyles.bodySmallGray6000511,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 17,
                                    ),
                                    child: Text(
                                      "lbl_wed".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          CustomTextStyles.bodySmallGray6000511,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 14,
                                    ),
                                    child: Text(
                                      "lbl_thu".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles
                                          .labelMediumErrorContainer11,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 21,
                                    ),
                                    child: Text(
                                      "lbl_fri".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          CustomTextStyles.bodySmallGray6000511,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 23,
                                    ),
                                    child: Text(
                                      "lbl_sat".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          CustomTextStyles.bodySmallGray6000511,
                                    ),
                                  ),
                                ],
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
                  top: 45,
                ),
                child: Text(
                  "lbl_tasks".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 2,
                  top: 16,
                  bottom: 3,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: getPadding(
                          top: 7,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: getVerticalSize(
                                137,
                              ),
                              width: getHorizontalSize(
                                285,
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: getVerticalSize(
                                        137,
                                      ),
                                      width: getHorizontalSize(
                                        283,
                                      ),
                                      padding: getPadding(
                                        top: 28,
                                        bottom: 28,
                                      ),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: fs.Svg(
                                            ImageConstant.imgGroup194,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          CustomImageView(
                                            imagePath: ImageConstant.imgLine1,
                                            height: getVerticalSize(
                                              79,
                                            ),
                                            width: getHorizontalSize(
                                              282,
                                            ),
                                            radius: BorderRadius.circular(
                                              getHorizontalSize(
                                                39,
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  CustomImageView(
                                    imagePath: ImageConstant.imgEllipse,
                                    height: getVerticalSize(
                                      85,
                                    ),
                                    width: getHorizontalSize(
                                      285,
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 4,
                                top: 8,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "lbl_sun".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.bodySmallGray60005,
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 20,
                                    ),
                                    child: Text(
                                      "lbl_mon".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          CustomTextStyles.bodySmallGray60005,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 20,
                                    ),
                                    child: Text(
                                      "lbl_tue".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          CustomTextStyles.bodySmallGray60005,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 20,
                                    ),
                                    child: Text(
                                      "lbl_wed".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          CustomTextStyles.bodySmallGray60005,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 20,
                                    ),
                                    child: Text(
                                      "lbl_thu".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles
                                          .labelLargeErrorContainer,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 18,
                                    ),
                                    child: Text(
                                      "lbl_fri".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          CustomTextStyles.bodySmallGray60005,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 20,
                                    ),
                                    child: Text(
                                      "lbl_sat".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          CustomTextStyles.bodySmallGray60005,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 2,
                        bottom: 17,
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
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.bodySmallGray6000510,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 1,
                              top: 12,
                            ),
                            child: Text(
                              "lbl_80".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.bodySmallGray6000510,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 10,
                            ),
                            child: Text(
                              "lbl_60".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.labelMediumErrorContainer,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 1,
                              top: 12,
                            ),
                            child: Text(
                              "lbl_40".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.bodySmallGray6000510,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 2,
                              top: 10,
                            ),
                            child: Text(
                              "lbl_20".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.bodySmallGray6000510,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 2,
                              top: 12,
                            ),
                            child: Text(
                              "lbl_0".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.bodySmallGray6000510,
                            ),
                          ),
                        ],
                      ),
                    ),
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
