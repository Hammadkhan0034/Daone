import 'controller/add_new_friends_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/core/utils/validation_functions.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:daone/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddNewFriendsDialog extends StatelessWidget {
  AddNewFriendsDialog(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  AddNewFriendsController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: getHorizontalSize(
        316,
      ),
      padding: getPadding(
        left: 18,
        top: 33,
        right: 18,
        bottom: 33,
      ),
      decoration: AppDecoration.outline12.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder14,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            svgPath: ImageConstant.imgClippathgroupBlack900,
            height: getVerticalSize(
              157,
            ),
            width: getHorizontalSize(
              205,
            ),
          ),
          CustomTextFormField(
            controller: controller.emailController,
            margin: getMargin(
              top: 38,
            ),
            contentPadding: getPadding(
              left: 12,
              top: 21,
              right: 12,
              bottom: 21,
            ),
            textStyle: CustomTextStyles.bodySmallGray60002,
            hintText: "msg_enter_friend_s_email".tr,
            hintStyle: CustomTextStyles.bodySmallGray60002,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || (!isValidEmail(value, isRequired: true))) {
                return "Please enter valid email";
              }
              return null;
            },
            filled: true,
            fillColor: appTheme.whiteA700,
            defaultBorderDecoration: TextFormFieldStyleHelper.outlineGray40001,
            enabledBorderDecoration: TextFormFieldStyleHelper.outlineGray40001,
            focusedBorderDecoration: TextFormFieldStyleHelper.outlineGray40001,
            disabledBorderDecoration: TextFormFieldStyleHelper.outlineGray40001,
          ),
          CustomElevatedButton(
            width: getHorizontalSize(
              255,
            ),
            height: getVerticalSize(
              59,
            ),
            text: "lbl_add".tr,
            margin: getMargin(
              left: 12,
              top: 32,
              right: 13,
              bottom: 2,
            ),
            buttonStyle: CustomButtonStyles.outlineIndigoA1004c.copyWith(
                fixedSize: MaterialStateProperty.all<Size>(Size(
              double.maxFinite,
              getVerticalSize(
                59,
              ),
            ))),
            decoration: CustomButtonStyles.outlineIndigoA1004cDecoration,
            buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
          ),
        ],
      ),
    );
  }
}
