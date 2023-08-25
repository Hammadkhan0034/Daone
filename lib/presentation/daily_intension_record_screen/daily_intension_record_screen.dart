import 'controller/daily_intension_record_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class DailyIntensionRecordScreen
    extends GetWidget<DailyIntensionRecordController> {
  const DailyIntensionRecordScreen({Key? key})
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
            left: 23,
            top: 102,
            right: 23,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: getVerticalSize(
                  303,
                ),
                width: getHorizontalSize(
                  321,
                ),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgGroupDeepOrangeA20006292x277,
                      height: getVerticalSize(
                        292,
                      ),
                      width: getHorizontalSize(
                        277,
                      ),
                      alignment: Alignment.topCenter,
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgGroup10085,
                      height: getVerticalSize(
                        56,
                      ),
                      width: getHorizontalSize(
                        103,
                      ),
                      alignment: Alignment.topRight,
                      margin: getMargin(
                        top: 79,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: getVerticalSize(
                          294,
                        ),
                        width: getHorizontalSize(
                          275,
                        ),
                        padding: getPadding(
                          left: 97,
                          top: 57,
                          bottom: 57,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: fs.Svg(
                              ImageConstant.imgGroup7,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgContrast,
                              height: getSize(
                                7,
                              ),
                              width: getSize(
                                7,
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgGlobe,
                              height: getSize(
                                6,
                              ),
                              width: getSize(
                                6,
                              ),
                              alignment: Alignment.topLeft,
                              margin: getMargin(
                                left: 1,
                                top: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgCut,
                      height: getVerticalSize(
                        85,
                      ),
                      width: getHorizontalSize(
                        89,
                      ),
                      alignment: Alignment.bottomLeft,
                      margin: getMargin(
                        left: 24,
                      ),
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgOffer,
                      height: getVerticalSize(
                        33,
                      ),
                      width: getHorizontalSize(
                        39,
                      ),
                      alignment: Alignment.bottomLeft,
                      margin: getMargin(
                        left: 11,
                        bottom: 61,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 45,
                ),
                child: Text(
                  "msg_record_your_today_s".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.titleLargeGray90002,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  283,
                ),
                margin: getMargin(
                  left: 23,
                  top: 11,
                  right: 21,
                ),
                child: Text(
                  "msg_capture_your_daily".tr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodySmallGray60005,
                ),
              ),
              CustomElevatedButton(
                onTap: (){
                  Get.toNamed(AppRoutes.recordingScreen);
                },
                width: getHorizontalSize(
                  315,
                ),
                height: getVerticalSize(
                  57,
                ),
                text: "lbl_let_s_record".tr,
                margin: getMargin(
                  left: 6,
                  top: 56,
                  right: 6,
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
