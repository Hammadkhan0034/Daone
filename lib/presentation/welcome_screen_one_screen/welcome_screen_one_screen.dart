import 'controller/welcome_screen_one_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class WelcomeScreenOneScreen extends GetWidget<WelcomeScreenOneController> {
  const WelcomeScreenOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
          backgroundColor: appTheme.whiteA700,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

            Container(
              width: double.maxFinite,
              padding: getPadding(
                left: 30,
                top: 200,
                right: 30,
                bottom: 43,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgDaonelogo1,
                height: getVerticalSize(
                  131,
                ),
                width: getHorizontalSize(
                  172,
                ),
              fit: BoxFit.scaleDown,

              ),
            ),
            CustomElevatedButton(
              onTap: () {
                onTapBtnGetStarted();
              },
              width: getHorizontalSize(
                315,
              ),
              height: getVerticalSize(
                57,
              ),
              text: "lbl_get_started".tr,
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
          ])),
    );
  }

  void onTapBtnGetStarted() {
    Get.toNamed(AppRoutes.onboardingOneScreen);
  }
}
