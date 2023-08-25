import 'controller/onboarding_one_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class OnboardingOneScreen extends GetWidget<OnboardingOneController> {
  const OnboardingOneScreen({Key? key})
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
                imagePath: ImageConstant.imgGroup,
                height: getVerticalSize(
                  430,
                ),
                width: getHorizontalSize(
                  375,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 30,
                  top: 63,
                ),
                child: Text(
                  "msg_track_your_goals".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.headlineSmallGray90002,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: getHorizontalSize(
                    308,
                  ),
                  margin: getMargin(
                    left: 30,
                    top: 15,
                    right: 36,
                  ),
                  child: Text(
                    "msg_don_t_worry_if_you".tr,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ),
              Spacer(),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Card(
              //     clipBehavior: Clip.antiAlias,
              //     elevation: 0,
              //     margin: getMargin(
              //       right: 30,
              //       bottom: 40,
              //     ),
              //     shape: RoundedRectangleBorder(
              //       side: BorderSide(
              //         color: appTheme.gray50,
              //         width: getHorizontalSize(
              //           1,
              //         ),
              //       ),
              //       borderRadius: BorderRadiusStyle.circleBorder30,
              //     ),
              //     child: Container(
              //       height: getSize(
              //         60,
              //       ),
              //       width: getSize(
              //         60,
              //       ),
              //       decoration: AppDecoration.outline.copyWith(
              //         borderRadius: BorderRadiusStyle.circleBorder30,
              //       ),
              //       child: Stack(
              //         children: [
              //           CustomImageView(
              //             imagePath: ImageConstant.imgEllipse31,
              //             height: getSize(
              //               30,
              //             ),
              //             width: getSize(
              //               30,
              //             ),
              //             alignment: Alignment.topRight,
              //           ),
              //         ],
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
