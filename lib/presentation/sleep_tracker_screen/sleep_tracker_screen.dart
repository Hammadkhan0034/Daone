import 'controller/sleep_tracker_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_switch.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SleepTrackerScreen extends GetWidget<SleepTrackerController> {
  const SleepTrackerScreen({Key? key})
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
            56,
          ),
          leadingWidth: 78,
          leading: AppbarIconbutton(
            onTap: (){
              Get.back();
            },

            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              left: 30,
              top: 5,
              bottom: 5,
            ),
          ),
          centerTitle: true,
          title: Text(
            "lbl_sleep_tracker".tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: CustomTextStyles.titleMediumBold,
          ),
        ),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 30,
            top: 8,
            right: 30,
            bottom: 8,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: getVerticalSize(
                    171,
                  ),
                  width: getHorizontalSize(
                    306,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                    Opacity(
                                      opacity: 0.3,
                                      child: CustomImageView(
                                        svgPath: ImageConstant.imgGroup194,
                                        height: getVerticalSize(
                                          137,
                                        ),
                                        width: getHorizontalSize(
                                          283,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 4,
                                        top: 8,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "lbl_sun".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                          Padding(
                                            padding: getPadding(
                                              left: 20,
                                            ),
                                            child: Text(
                                              "lbl_mon".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.bodySmall,
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
                                              style: theme.textTheme.bodySmall,
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
                                              style: theme.textTheme.bodySmall,
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
                                              style: theme.textTheme.labelLarge,
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
                                              style: theme.textTheme.bodySmall,
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
                                              style: theme.textTheme.bodySmall,
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
                                left: 5,
                                bottom: 17,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "lbl_10h".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles.bodySmall10,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 12,
                                    ),
                                    child: Text(
                                      "lbl_8h".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: theme.textTheme.labelMedium,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 10,
                                    ),
                                    child: Text(
                                      "lbl_6h".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles.bodySmall10,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 11,
                                    ),
                                    child: Text(
                                      "lbl_4h".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles.bodySmall10,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 11,
                                    ),
                                    child: Text(
                                      "lbl_2h".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles.bodySmall10,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 12,
                                    ),
                                    child: Text(
                                      "lbl_0h".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles.bodySmall10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgGraph,
                        height: getVerticalSize(
                          109,
                        ),
                        width: getHorizontalSize(
                          285,
                        ),
                        alignment: Alignment.bottomLeft,
                        margin: getMargin(
                          bottom: 26,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: getPadding(
                            right: 67,
                            bottom: 17,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: getPadding(
                                      left: 10,
                                      top: 9,
                                      right: 10,
                                      bottom: 9,
                                    ),
                                    decoration: AppDecoration.outline2.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder8,
                                    ),
                                    child: Text(
                                      "lbl_43_increase".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles.bodySmallGreen500,
                                    ),
                                  ),
                                  CustomImageView(
                                    svgPath: ImageConstant.imgComputer,
                                    height: getSize(
                                      8,
                                    ),
                                    width: getSize(
                                      8,
                                    ),
                                  ),
                                ],
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgActivedays,
                                height: getVerticalSize(
                                  83,
                                ),
                                width: getHorizontalSize(
                                  7,
                                ),
                                margin: getMargin(
                                  top: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: getVerticalSize(
                    388,
                  ),
                  width: getHorizontalSize(
                    315,
                  ),
                  margin: getMargin(
                    top: 26,
                    bottom: 5,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgSleepgraph,
                        height: getVerticalSize(
                          78,
                        ),
                        width: getHorizontalSize(
                          315,
                        ),
                        alignment: Alignment.topCenter,
                        margin: getMargin(
                          top: 74,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "lbl_today_schedule".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.titleMedium,
                            ),
                            Container(
                              margin: getMargin(
                                top: 12,
                              ),
                              padding: getPadding(
                                all: 15,
                              ),
                              decoration: AppDecoration.outline2.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder22,
                              ),
                              child: Row(
                                children: [
                                  CustomImageView(
                                    svgPath: ImageConstant.imgFolderDeepPurple50,
                                    height: getSize(
                                      30,
                                    ),
                                    width: getSize(
                                      30,
                                    ),
                                    margin: getMargin(
                                      top: 17,
                                      bottom: 16,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 15,
                                      top: 7,
                                      bottom: 6,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "lbl_bedtime".tr,
                                                style: CustomTextStyles
                                                    .titleSmallPoppinsGray90002,
                                              ),
                                              TextSpan(
                                                text: "lbl_09_00pm".tr,
                                                style: theme.textTheme.bodySmall,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            top: 6,
                                          ),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "lbl_in".tr,
                                                  style:
                                                      theme.textTheme.bodyMedium,
                                                ),
                                                TextSpan(
                                                  text: "lbl_6".tr,
                                                  style: CustomTextStyles
                                                      .titleMediumGray80005,
                                                ),
                                                TextSpan(
                                                  text: "lbl_hours".tr,
                                                  style:
                                                      theme.textTheme.bodyMedium,
                                                ),
                                                TextSpan(
                                                  text: "lbl_22minutes".tr,
                                                  style: CustomTextStyles
                                                      .titleMediumGray80005,
                                                ),
                                              ],
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: getPadding(
                                      bottom: 5,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                          svgPath: ImageConstant.imgOverflowmenu,
                                          height: getSize(
                                            14,
                                          ),
                                          width: getSize(
                                            14,
                                          ),
                                        ),
                                        Obx(
                                          () => CustomSwitch(
                                            margin: getMargin(
                                              top: 20,
                                            ),
                                            value:
                                                controller.isSelectedSwitch.value,
                                            onChange: (value) {
                                              controller.isSelectedSwitch.value =
                                                  value;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: getMargin(
                                top: 15,
                              ),
                              padding: getPadding(
                                all: 15,
                              ),
                              decoration: AppDecoration.outline2.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder22,
                              ),
                              child: Row(
                                children: [
                                  CustomImageView(
                                    svgPath: ImageConstant.imgIconalaarm,
                                    height: getSize(
                                      30,
                                    ),
                                    width: getSize(
                                      30,
                                    ),
                                    margin: getMargin(
                                      top: 17,
                                      bottom: 16,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 15,
                                      top: 7,
                                      bottom: 6,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "lbl_alarm".tr,
                                                style: CustomTextStyles
                                                    .titleSmallPoppinsGray90002,
                                              ),
                                              TextSpan(
                                                text: "lbl_05_10am".tr,
                                                style: theme.textTheme.bodySmall,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            top: 7,
                                          ),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "lbl_in".tr,
                                                  style:
                                                      theme.textTheme.bodyMedium,
                                                ),
                                                TextSpan(
                                                  text: "lbl_14".tr,
                                                  style: CustomTextStyles
                                                      .titleMediumGray80005,
                                                ),
                                                TextSpan(
                                                  text: "lbl_hours".tr,
                                                  style:
                                                      theme.textTheme.bodyMedium,
                                                ),
                                                TextSpan(
                                                  text: "lbl_30minutes".tr,
                                                  style: CustomTextStyles
                                                      .titleMediumGray80005,
                                                ),
                                              ],
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 44,
                                      bottom: 5,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                          svgPath: ImageConstant.imgOverflowmenu,
                                          height: getSize(
                                            14,
                                          ),
                                          width: getSize(
                                            14,
                                          ),
                                        ),
                                        Obx(
                                          () => CustomSwitch(
                                            margin: getMargin(
                                              top: 20,
                                            ),
                                            value: controller
                                                .isSelectedSwitch1.value,
                                            onChange: (value) {
                                              controller.isSelectedSwitch1.value =
                                                  value;
                                            },
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
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: getVerticalSize(
                            117,
                          ),
                          width: getHorizontalSize(
                            315,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: getVerticalSize(
                                    115,
                                  ),
                                  width: getHorizontalSize(
                                    315,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        22,
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
                              CustomImageView(
                                svgPath: ImageConstant.imgSleepgraph,
                                height: getVerticalSize(
                                  78,
                                ),
                                width: getHorizontalSize(
                                  315,
                                ),
                                alignment: Alignment.bottomCenter,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: getPadding(
                                    left: 20,
                                    top: 12,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "msg_last_night_sleep".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: CustomTextStyles
                                            .titleSmallPoppinsWhiteA700,
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          top: 3,
                                        ),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "lbl_8".tr,
                                                style: CustomTextStyles
                                                    .titleMediumWhiteA700Medium_1,
                                              ),
                                              TextSpan(
                                                text: "lbl_h".tr,
                                                style: CustomTextStyles
                                                    .bodyMediumWhiteA700_1,
                                              ),
                                              TextSpan(
                                                text: " ",
                                                style: CustomTextStyles
                                                    .titleSmallPoppinsWhiteA700_1,
                                              ),
                                              TextSpan(
                                                text: "lbl_202".tr,
                                                style: CustomTextStyles
                                                    .titleMediumWhiteA700Medium_1,
                                              ),
                                              TextSpan(
                                                text: "lbl_m".tr,
                                                style: CustomTextStyles
                                                    .bodyMediumWhiteA700_1,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.left,
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
                    ],
                  ),
                ),
                Container(

                  height: getVerticalSize(
                    100,
                  ),
                  width: getHorizontalSize(
                    375,
                  ),
                  margin: getMargin(
                    top: 20,
                  ),
                  padding: getPadding(
                    left: 20,
                    top: 15,
                    right: 20,
                    bottom: 15,
                  ),
                  decoration: AppDecoration
                      .gradientnameerrorContaineropacity042namecyan900opacity042
                      .copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder22,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "lbl_you_will_get".tr,
                              style: CustomTextStyles.bodySmallGray90002_1,
                            ),
                            TextSpan(
                              text: "lbl_8".tr,
                              style: CustomTextStyles.titleSmallPoppinsGray90002,
                            ),
                            TextSpan(
                              text: "lbl_hours".tr,
                              style: CustomTextStyles.bodySmallGray90002_1,
                            ),
                            TextSpan(
                              text: "lbl_10".tr,
                              style: CustomTextStyles.titleSmallPoppinsGray90002,
                            ),
                            TextSpan(
                              text: "msg_minutes_for_tonight".tr,
                              style: CustomTextStyles.bodySmallGray90002_1,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        height: getVerticalSize(
                          15,
                        ),
                        width: getHorizontalSize(
                          275,
                        ),
                        margin: getMargin(
                          top: 16,
                        ),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: getVerticalSize(
                                  15,
                                ),
                                width: getHorizontalSize(
                                  275,
                                ),
                                decoration: BoxDecoration(
                                  color: appTheme.gray50,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      7,
                                    ),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      7,
                                    ),
                                  ),
                                  child: LinearProgressIndicator(
                                    value: 0.89,
                                    backgroundColor: appTheme.gray50,
                                    color: Color.fromRGBO(0, 116, 109, 1),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: getPadding(
                                  left: 112,
                                ),
                                child: Text(
                                  "lbl_96".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.labelMediumWhiteA700,
                                ),
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
        ),

      ),
    );
  }
}
