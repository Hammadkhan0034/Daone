import 'controller/daily_intension_record_one_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class DailyIntensionRecordOneScreen
    extends GetWidget<DailyIntensionRecordOneController> {
  const DailyIntensionRecordOneScreen({Key? key})
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
            97,
          ),
          leadingWidth: 375,
          leading: AppbarIconbutton(
            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              left: 30,
              top: 4,
              right: 297,
              bottom: 4,
            ),
          ),
        ),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 30,
            top: 12,
            right: 30,
            bottom: 12,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "msg_my_first_affirmation".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: CustomTextStyles.bodyLargePoppinsGray9000318,
              ),
              Container(
                height: getVerticalSize(
                  461,
                ),
                width: getHorizontalSize(
                  315,
                ),
                margin: getMargin(
                  top: 13,
                ),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle5946,
                      height: getVerticalSize(
                        461,
                      ),
                      width: getHorizontalSize(
                        315,
                      ),
                      radius: BorderRadius.circular(
                        getHorizontalSize(
                          42,
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgEye,
                      height: getSize(
                        58,
                      ),
                      width: getSize(
                        58,
                      ),
                      alignment: Alignment.bottomRight,
                      margin: getMargin(
                        right: 27,
                        bottom: 25,
                      ),
                    ),
                  ],
                ),
              ),
              CustomElevatedButton(
                onTap: (){
                  Get.toNamed(AppRoutes.updateRemindersScreen);
                },
                width: getHorizontalSize(
                  315,
                ),
                height: getVerticalSize(
                  57,
                ),
                text: "lbl_update".tr,
                margin: getMargin(
                  top: 23,
                ),
                buttonStyle:
                    CustomButtonStyles.outlineIndigoA1004cTL28.copyWith(
                        fixedSize: MaterialStateProperty.all<Size>(Size(
                  double.maxFinite,
                  getVerticalSize(
                    57,
                  ),
                ))),
                decoration:
                    CustomButtonStyles.outlineIndigoA1004cTL28Decoration,
                buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
              ),
              CustomElevatedButton(
                width: getHorizontalSize(
                  315,
                ),
                height: getVerticalSize(
                  57,
                ),
                text: "lbl_end_intension".tr,
                margin: getMargin(
                  top: 15,
                  bottom: 5,
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
            ],
          ),
        ),
      ),
    );
  }
}
