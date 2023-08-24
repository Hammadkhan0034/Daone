import 'controller/login_page_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/core/utils/validation_functions.dart';
import 'package:daone/widgets/custom_icon_button.dart';
import 'package:daone/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class LoginPageScreen extends GetWidget<LoginPageController> {
  LoginPageScreen({Key? key})
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
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: getPadding(
              left: 30,
              top: 38,
              right: 30,
              bottom: 38,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    top: 3,
                  ),
                  child: Text(
                    "lbl_hey_there".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.bodyLargePoppinsGray90002,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 2,
                  ),
                  child: Text(
                    "lbl_welcome_back".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.titleLargeGray90002,
                  ),
                ),
                CustomTextFormField(
                  controller: controller.emailController,
                  margin: getMargin(
                    top: 30,
                  ),
                  contentPadding: getPadding(
                    top: 15,
                    right: 30,
                    bottom: 15,
                  ),
                  textStyle: CustomTextStyles.bodySmallGray50005,
                  hintText: "lbl_email".tr,
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
                      top: 15,
                    ),
                    contentPadding: getPadding(
                      top: 15,
                      bottom: 15,
                    ),
                    textStyle: CustomTextStyles.bodySmallGray50005,
                    hintText: "lbl_password".tr,
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
                        controller.isShowPassword.value =
                            !controller.isShowPassword.value;
                      },
                      child: Container(
                        margin: getMargin(
                          left: 30,
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
                Padding(
                  padding: getPadding(
                    top: 11,
                  ),
                  child: Text(
                    "msg_forgot_your_password".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.labelLargeGray50005.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 7,
                        bottom: 6,
                      ),
                      child: SizedBox(
                        width: getHorizontalSize(
                          141,
                        ),
                        child: Divider(
                          height: getVerticalSize(
                            1,
                          ),
                          thickness: getVerticalSize(
                            1,
                          ),
                          color: appTheme.gray300,
                        ),
                      ),
                    ),
                    Text(
                      "lbl_or".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.bodySmallInterGray90002,
                    ),
                    Padding(
                      padding: getPadding(
                        top: 7,
                        bottom: 6,
                      ),
                      child: SizedBox(
                        width: getHorizontalSize(
                          140,
                        ),
                        child: Divider(
                          height: getVerticalSize(
                            1,
                          ),
                          thickness: getVerticalSize(
                            1,
                          ),
                          color: appTheme.gray300,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: getPadding(
                    top: 21,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconButton(
                        height: 50,
                        width: 50,
                        padding: getPadding(
                          all: 15,
                        ),
                        decoration: IconButtonStyleHelper.outlineGray300,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgGroup9684,
                        ),
                      ),
                      CustomIconButton(
                        height: 50,
                        width: 50,
                        margin: getMargin(
                          left: 30,
                        ),
                        padding: getPadding(
                          all: 15,
                        ),
                        decoration: IconButtonStyleHelper.outlineGray300,
                        child: CustomImageView(
                          svgPath: ImageConstant.imgFacebook1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 31,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "msg_don_t_have_an_account2".tr,
                          style: CustomTextStyles.bodyMediumGray90002_1,
                        ),
                        TextSpan(
                          text: "lbl_register".tr,
                          style:
                              CustomTextStyles.titleSmallPoppinsErrorContainer,
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
      ),
    );
  }
}
