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
                    onTap: (){
                      Get.toNamed(AppRoutes.homeScreen);
                    },
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
