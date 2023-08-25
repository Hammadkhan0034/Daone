import 'controller/onboarding_four_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

// ignore_for_file: must_be_immutable
class OnboardingFourScreen extends GetWidget<OnboardingFourController> {
  const OnboardingFourScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgGroupBlueGray900,
                height: getVerticalSize(
                  422,
                ),
                width: getHorizontalSize(
                  375,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  177,
                ),
                margin: getMargin(
                  left: 30,
                  top: 49,
                ),
                child: Text(
                  "msg_improve_sleep_quality".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.headlineSmallGray90002,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  299,
                ),
                margin: getMargin(
                  left: 30,
                  top: 11,
                  right: 45,
                ),
                child: Text(
                  "msg_improve_the_quality".tr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Container(
              //     margin: getMargin(
              //       top: 90,
              //       right: 30,
              //       bottom: 40,
              //     ),
              //     decoration: AppDecoration.outline.copyWith(
              //       borderRadius: BorderRadiusStyle.circleBorder30,
              //     ),
              //     child: OutlineGradientButton(
              //       padding: EdgeInsets.only(
              //         left: getHorizontalSize(
              //           2,
              //         ),
              //         top: getVerticalSize(
              //           2,
              //         ),
              //         right: getHorizontalSize(
              //           2,
              //         ),
              //         bottom: getVerticalSize(
              //           2,
              //         ),
              //       ),
              //       strokeWidth: getHorizontalSize(
              //         2,
              //       ),
              //       gradient: LinearGradient(
              //         begin: Alignment(
              //           1,
              //           1,
              //         ),
              //         end: Alignment(
              //           -0.24,
              //           -0.31,
              //         ),
              //         colors: [
              //           appTheme.deepOrangeA20006,
              //           theme.colorScheme.primary,
              //         ],
              //       ),
              //       corners: Corners(
              //         topLeft: Radius.circular(
              //           30,
              //         ),
              //         topRight: Radius.circular(
              //           30,
              //         ),
              //         bottomLeft: Radius.circular(
              //           30,
              //         ),
              //         bottomRight: Radius.circular(
              //           30,
              //         ),
              //       ),
              //       child: Container(
              //         height: getSize(
              //           60,
              //         ),
              //         width: getSize(
              //           60,
              //         ),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(
              //             getHorizontalSize(
              //               30,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        floatingActionButton: CustomFloatingButton(
          height: 75,
          width: 75,
          child: CustomImageView(
            svgPath: ImageConstant.imgArrowright,
            height: getVerticalSize(
              25.0,
            ),
            width: getHorizontalSize(
              25.0,
            ),
          ),
        ),
      ),
    );
  }
}
