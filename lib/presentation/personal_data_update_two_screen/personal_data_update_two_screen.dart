import 'controller/personal_data_update_two_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/core/utils/validation_functions.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/appbar_image.dart';
import 'package:daone/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_bottom_bar.dart';
import 'package:daone/widgets/custom_drop_down.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:daone/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class PersonalDataUpdateTwoScreen
    extends GetWidget<PersonalDataUpdateTwoController> {
  PersonalDataUpdateTwoScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
            text: "lbl_personal_data".tr,
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
                top: 4,
                right: 30,
                bottom: 12,
              ),
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 16,
            ),
            child: Padding(
              padding: getPadding(
                left: 30,
                right: 29,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                      top: 1,
                    ),
                    child: Text(
                      "lbl_stefani".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleSmallPoppinsGray90002_1,
                    ),
                  ),
                  CustomTextFormField(
                    controller: controller.lastnameController,
                    margin: getMargin(
                      top: 40,
                    ),
                    contentPadding: getPadding(
                      top: 15,
                      right: 30,
                      bottom: 15,
                    ),
                    textStyle: CustomTextStyles.bodySmallGray50005,
                    hintText: "lbl_stefani".tr,
                    hintStyle: CustomTextStyles.bodySmallGray50005,
                    textInputAction: TextInputAction.next,
                    prefix: Container(
                      margin: getMargin(
                        left: 15,
                        top: 15,
                        right: 10,
                        bottom: 15,
                      ),
                      child: CustomImageView(
                        svgPath:
                            ImageConstant.imgIconlyLightoutlineProfileGray60005,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(
                        48,
                      ),
                    ),
                    filled: true,
                    fillColor: appTheme.gray50,
                  ),
                  CustomTextFormField(
                    controller: controller.phonenumberController,
                    margin: getMargin(
                      top: 17,
                    ),
                    contentPadding: getPadding(
                      top: 15,
                      right: 30,
                      bottom: 15,
                    ),
                    textStyle: CustomTextStyles.bodySmallGray50005,
                    hintText: "lbl_92_687_4874".tr,
                    hintStyle: CustomTextStyles.bodySmallGray50005,
                    textInputAction: TextInputAction.next,
                    prefix: Container(
                      margin: getMargin(
                        left: 16,
                        top: 16,
                        right: 11,
                        bottom: 16,
                      ),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgCall,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(
                        48,
                      ),
                    ),
                    filled: true,
                    fillColor: appTheme.gray50,
                  ),
                  CustomTextFormField(
                    controller: controller.emailController,
                    margin: getMargin(
                      top: 17,
                    ),
                    contentPadding: getPadding(
                      top: 15,
                      right: 30,
                      bottom: 15,
                    ),
                    textStyle: CustomTextStyles.bodySmallGray50005,
                    hintText: "msg_stefaniyes_gmail_com".tr,
                    hintStyle: CustomTextStyles.bodySmallGray50005,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    prefix: Container(
                      margin: getMargin(
                        left: 15,
                        top: 15,
                        right: 10,
                        bottom: 15,
                      ),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgIconlyLightMessage,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(
                        48,
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          (!isValidEmail(value, isRequired: true))) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                    filled: true,
                    fillColor: appTheme.gray50,
                  ),
                  Obx(
                    () => CustomTextFormField(
                      controller: controller.passwordController,
                      margin: getMargin(
                        top: 17,
                      ),
                      contentPadding: getPadding(
                        top: 15,
                        bottom: 15,
                      ),
                      textStyle: CustomTextStyles.bodySmallGray50005,
                      hintText: "msg_enter_your_current".tr,
                      hintStyle: CustomTextStyles.bodySmallGray50005,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.visiblePassword,
                      prefix: Container(
                        margin: getMargin(
                          left: 15,
                          top: 15,
                          right: 10,
                          bottom: 15,
                        ),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgLock,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(
                        maxHeight: getVerticalSize(
                          48,
                        ),
                      ),
                      suffix: InkWell(
                        onTap: () {
                          controller.isShowPassword.value =
                              !controller.isShowPassword.value;
                        },
                        child: Container(
                          margin: getMargin(
                            left: 12,
                            top: 15,
                            right: 15,
                            bottom: 15,
                          ),
                          child: CustomImageView(
                            svgPath: controller.isShowPassword.value
                                ? ImageConstant.imgArrowleft
                                : ImageConstant.imgArrowleft,
                          ),
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: getVerticalSize(
                          48,
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            (!isValidPassword(value, isRequired: true))) {
                          return "Please enter valid password";
                        }
                        return null;
                      },
                      obscureText: controller.isShowPassword.value,
                      filled: true,
                      fillColor: appTheme.gray50,
                    ),
                  ),
                  Obx(
                    () => CustomTextFormField(
                      controller: controller.newpasswordController,
                      margin: getMargin(
                        top: 17,
                      ),
                      contentPadding: getPadding(
                        top: 15,
                        bottom: 15,
                      ),
                      textStyle: CustomTextStyles.bodySmallGray50005,
                      hintText: "msg_enter_your_new_password".tr,
                      hintStyle: CustomTextStyles.bodySmallGray50005,
                      textInputType: TextInputType.visiblePassword,
                      prefix: Container(
                        margin: getMargin(
                          left: 15,
                          top: 15,
                          right: 10,
                          bottom: 15,
                        ),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgLock,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(
                        maxHeight: getVerticalSize(
                          48,
                        ),
                      ),
                      suffix: InkWell(
                        onTap: () {
                          controller.isShowPassword1.value =
                              !controller.isShowPassword1.value;
                        },
                        child: Container(
                          margin: getMargin(
                            left: 12,
                            top: 15,
                            right: 15,
                            bottom: 15,
                          ),
                          child: CustomImageView(
                            svgPath: controller.isShowPassword1.value
                                ? ImageConstant.imgArrowleft
                                : ImageConstant.imgArrowleft,
                          ),
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: getVerticalSize(
                          48,
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            (!isValidPassword(value, isRequired: true))) {
                          return "Please enter valid password";
                        }
                        return null;
                      },
                      obscureText: controller.isShowPassword1.value,
                      filled: true,
                      fillColor: appTheme.gray50,
                    ),
                  ),
                  CustomElevatedButton(
                    width: getHorizontalSize(
                      315,
                    ),
                    height: getVerticalSize(
                      60,
                    ),
                    text: "lbl_update".tr,
                    margin: getMargin(
                      top: 62,
                    ),
                    buttonStyle: CustomButtonStyles
                        .gradientnamedeeporangeA20006nameprimary
                        .copyWith(
                            fixedSize: MaterialStateProperty.all<Size>(Size(
                      double.maxFinite,
                      getVerticalSize(
                        60,
                      ),
                    ))),
                    decoration: CustomButtonStyles
                        .gradientnamedeeporangeA20006nameprimaryDecoration,
                    buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                  ),
                  Padding(
                    padding: getPadding(
                      top: 252,
                      right: 1,
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
                          items: controller.personalDataUpdateTwoModelObj.value
                              .dropdownItemList.value,
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
                                      style:
                                          CustomTextStyles.bodySmallGray500058,
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
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {},
        ),
      ),
    );
  }
}
