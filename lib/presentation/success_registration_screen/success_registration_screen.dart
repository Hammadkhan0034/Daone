import 'controller/success_registration_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SuccessRegistrationScreen
    extends GetWidget<SuccessRegistrationController> {
  const SuccessRegistrationScreen({Key? key})
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
            left: 48,
            top: 102,
            right: 48,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgGroupDeepOrangeA20006,
                height: getVerticalSize(
                  304,
                ),
                width: getHorizontalSize(
                  277,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 44,
                ),
                child: Text(
                  "msg_welcome_stefani".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.titleLargeGray90002,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  210,
                ),
                margin: getMargin(
                  left: 33,
                  top: 5,
                  right: 34,
                  bottom: 5,
                ),
                child: Text(
                  "msg_you_are_all_set".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodySmallGray60005,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomElevatedButton(
          width: getHorizontalSize(
            315,
          ),
          height: getVerticalSize(
            57,
          ),
          text: "lbl_go_to_home".tr,
          margin: getMargin(
            left: 30,
            right: 30,
            bottom: 43,
          ),
          buttonStyle: CustomButtonStyles.outlineIndigoA1004c.copyWith(
              fixedSize: MaterialStateProperty.all<Size>(Size(
            double.maxFinite,
            getVerticalSize(
              57,
            ),
          ))),
          decoration: CustomButtonStyles.outlineIndigoA1004cDecoration,
          buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
        ),
      ),
    );
  }
}
