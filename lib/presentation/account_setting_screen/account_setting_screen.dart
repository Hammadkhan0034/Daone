import 'controller/account_setting_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:daone/widgets/custom_switch.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class AccountSettingScreen extends GetWidget<AccountSettingController> {
  const AccountSettingScreen({Key? key})
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
          leadingWidth: 77,
          leading: AppbarIconbutton(
            onTap: (){
              Get.back();
            },
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
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 32,
            ),
            child: Padding(
              padding: getPadding(
                left: 22,
                right: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgUntit11,
                        height: getSize(
                          78,
                        ),
                        width: getSize(
                          78,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 12,
                          bottom: 21,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "lbl_stefani".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style:
                                  CustomTextStyles.titleSmallPoppinsGray90002_1,
                            ),
                            Padding(
                              padding: getPadding(
                                top: 5,
                              ),
                              child: Text(
                                "lbl_the_crixus".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.bodySmallGray60005,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      CustomElevatedButton(
                        onTap: (){
                          Get.toNamed(AppRoutes.personalDataUpdateTwoScreen);
                        },
                        width: getHorizontalSize(
                          83,
                        ),
                        height: getVerticalSize(
                          30,
                        ),
                        text: "lbl_edit".tr,
                        margin: getMargin(
                          top: 20,
                          bottom: 28,
                        ),
                        buttonStyle: CustomButtonStyles
                            .gradientnamedeeporangeA20006nameprimaryTL15
                            .copyWith(
                                fixedSize: MaterialStateProperty.all<Size>(Size(
                          getHorizontalSize(
                            83,
                          ),
                          getVerticalSize(
                            30,
                          ),
                        ))),
                        decoration: CustomButtonStyles
                            .gradientnamedeeporangeA20006nameprimaryTL15Decoration,
                        buttonTextStyle:
                            CustomTextStyles.labelLargeWhiteA700Medium,
                      ),
                    ],
                  ),
                  Container(
                    margin: getMargin(
                      left: 8,
                      top: 7,
                    ),
                    padding: getPadding(
                      left: 15,
                      top: 20,
                      right: 15,
                      bottom: 20,
                    ),
                    decoration: AppDecoration.outline2.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder18,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(
                            left: 5,
                          ),
                          child: Text(
                            "lbl_account".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.personalDataUpdateTwoScreen);
                          },
                          child: Padding(
                            padding: getPadding(
                              left: 5,
                              top: 14,
                            ),
                            child: Row(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgIconlylightprofile,
                                  height: getSize(
                                    20,
                                  ),
                                  width: getSize(
                                    20,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 10,
                                    bottom: 1,
                                  ),
                                  child: Text(
                                    "lbl_personal_data".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.bodySmallGray60005,
                                  ),
                                ),
                                Spacer(),
                                CustomImageView(
                                  svgPath: ImageConstant.imgArrowrightGray60005,
                                  height: getSize(
                                    18,
                                  ),
                                  width: getSize(
                                    18,
                                  ),
                                  margin: getMargin(
                                    top: 1,
                                    bottom: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.personalDataUpdateScreen);
                          },
                          child: Padding(
                            padding: getPadding(
                              left: 5,
                              top: 10,
                            ),
                            child: Row(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgIconlylightdocument,
                                  height: getSize(
                                    20,
                                  ),
                                  width: getSize(
                                    20,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 10,
                                    bottom: 1,
                                  ),
                                  child: Text(
                                    "lbl_achievement".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.bodySmallGray60005,
                                  ),
                                ),
                                Spacer(),
                                CustomImageView(
                                  svgPath: ImageConstant.imgArrowrightGray60005,
                                  height: getSize(
                                    18,
                                  ),
                                  width: getSize(
                                    18,
                                  ),
                                  margin: getMargin(
                                    top: 1,
                                    bottom: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.personalDataUpdateOneScreen);
                          },
                          child: Padding(
                            padding: getPadding(
                              left: 7,
                              top: 11,
                            ),
                            child: Row(
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.imgClock,
                                  height: getSize(
                                    16,
                                  ),
                                  width: getSize(
                                    16,
                                  ),
                                  margin: getMargin(
                                    top: 1,
                                    bottom: 1,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 11,
                                    top: 1,
                                  ),
                                  child: Text(
                                    "lbl_highlights".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.bodySmallGray60005,
                                  ),
                                ),
                                Spacer(),
                                CustomImageView(
                                  svgPath: ImageConstant.imgArrowrightGray60005,
                                  height: getSize(
                                    18,
                                  ),
                                  width: getSize(
                                    18,
                                  ),
                                  margin: getMargin(
                                    bottom: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.blogScreen);
                          },
                          child: Padding(
                            padding: getPadding(
                              left: 5,
                              top: 9,
                            ),
                            child: Row(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgIconlylightchart,
                                  height: getSize(
                                    20,
                                  ),
                                  width: getSize(
                                    20,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 10,
                                    bottom: 1,
                                  ),
                                  child: Text(
                                    "lbl_notes".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.bodySmallGray60005,
                                  ),
                                ),
                                Spacer(),
                                CustomImageView(
                                  svgPath: ImageConstant.imgArrowrightGray60005,
                                  height: getSize(
                                    18,
                                  ),
                                  width: getSize(
                                    18,
                                  ),
                                  margin: getMargin(
                                    top: 1,
                                    bottom: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.communityTabContainerScreen);
                          },
                          child: Padding(
                            padding: getPadding(
                              left: 6,
                              top: 11,
                            ),
                            child: Row(
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.imgLocation,
                                  height: getSize(
                                    18,
                                  ),
                                  width: getSize(
                                    18,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 11,
                                  ),
                                  child: Text(
                                    "lbl_community".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.bodySmallGray60005,
                                  ),
                                ),
                                Spacer(),
                                CustomImageView(
                                  svgPath: ImageConstant.imgArrowrightGray60005,
                                  height: getSize(
                                    18,
                                  ),
                                  width: getSize(
                                    18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.viewFriendsTabContainerScreen);
                          },
                          child: Padding(
                            padding: getPadding(
                              left: 6,
                              top: 10,
                            ),
                            child: Row(
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.imgIconworkout,
                                  height: getVerticalSize(
                                    16,
                                  ),
                                  width: getHorizontalSize(
                                    18,
                                  ),
                                  margin: getMargin(
                                    top: 1,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 11,
                                  ),
                                  child: Text(
                                    "lbl_friends".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.bodySmallGray60005,
                                  ),
                                ),
                                Spacer(),
                                CustomImageView(
                                  svgPath: ImageConstant.imgArrowrightGray60005,
                                  height: getSize(
                                    18,
                                  ),
                                  width: getSize(
                                    18,
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
                    margin: getMargin(
                      left: 8,
                      top: 15,
                    ),
                    padding: getPadding(
                      left: 15,
                      top: 19,
                      right: 15,
                      bottom: 19,
                    ),
                    decoration: AppDecoration.outline2.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder18,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(
                            left: 5,
                          ),
                          child: Text(
                            "lbl_notification".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 5,
                            top: 15,
                          ),
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath:
                                    ImageConstant.imgIconlylightnotification,
                                height: getSize(
                                  20,
                                ),
                                width: getSize(
                                  20,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 10,
                                  top: 1,
                                ),
                                child: Text(
                                  "msg_pop_up_notification".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.bodySmallGray60005,
                                ),
                              ),
                              Spacer(),
                              Obx(
                                () => CustomSwitch(
                                  margin: getMargin(
                                    top: 1,
                                    bottom: 1,
                                  ),
                                  value: controller.isSelectedSwitch.value,
                                  onChange: (value) {
                                    controller.isSelectedSwitch.value = value;
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
                      left: 8,
                      top: 15,
                    ),
                    padding: getPadding(
                      left: 15,
                      top: 19,
                      right: 15,
                      bottom: 19,
                    ),
                    decoration: AppDecoration.outline2.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder18,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(
                            left: 5,
                          ),
                          child: Text(
                            "lbl_other".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 5,
                            top: 14,
                          ),
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath:
                                    ImageConstant.imgIconlylightmessage20x20,
                                height: getSize(
                                  20,
                                ),
                                width: getSize(
                                  20,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 10,
                                  bottom: 1,
                                ),
                                child: Text(
                                  "lbl_contact_us".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.bodySmallGray60005,
                                ),
                              ),
                              Spacer(),
                              CustomImageView(
                                svgPath: ImageConstant.imgArrowrightGray60005,
                                height: getSize(
                                  18,
                                ),
                                width: getSize(
                                  18,
                                ),
                                margin: getMargin(
                                  top: 1,
                                  bottom: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 5,
                            top: 9,
                          ),
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgIconlylightshield,
                                height: getSize(
                                  20,
                                ),
                                width: getSize(
                                  20,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 10,
                                  top: 2,
                                ),
                                child: Text(
                                  "lbl_privacy_policy".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.bodySmallGray60005,
                                ),
                              ),
                              Spacer(),
                              CustomImageView(
                                svgPath: ImageConstant.imgArrowrightGray60005,
                                height: getSize(
                                  18,
                                ),
                                width: getSize(
                                  18,
                                ),
                                margin: getMargin(
                                  top: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 5,
                            top: 10,
                          ),
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgIconlylightsetting,
                                height: getSize(
                                  20,
                                ),
                                width: getSize(
                                  20,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 10,
                                  top: 2,
                                ),
                                child: Text(
                                  "lbl_settings".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.bodySmallGray60005,
                                ),
                              ),
                              Spacer(),
                              CustomImageView(
                                svgPath: ImageConstant.imgArrowrightGray60005,
                                height: getSize(
                                  18,
                                ),
                                width: getSize(
                                  18,
                                ),
                                margin: getMargin(
                                  top: 1,
                                  bottom: 1,
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
      ),
    );
  }
}
