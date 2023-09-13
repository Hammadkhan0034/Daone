import 'package:daone/presentation/grade_yourself_dialog/controller/grade_yourself_controller.dart';
import 'package:daone/presentation/grade_yourself_dialog/grade_yourself_dialog.dart';

import 'controller/complete_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class CompleteScreen extends GetWidget<CompleteController> {
  const CompleteScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        // appBar: CustomAppBar(
        //   height: getVerticalSize(
        //     97,
        //   ),
        //   leadingWidth: 375,
        //   leading: AppbarIconbutton(
        //     svgPath: ImageConstant.imgInfo,
        //     margin: getMargin(
        //       left: 30,
        //       top: 4,
        //       right: 297,
        //       bottom: 4,
        //     ),
        //   ),
        // ),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            top: 12,
            bottom: 12,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(
                  left: 24,
                  top: 10,
                ),
                child: Row(
                  children: [
                    AppbarIconbutton(
                      onTap: (){
                        Get.back();
                      },
                      svgPath: ImageConstant.imgInfo,

                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getVerticalSize(
                  20,
                ),
              ),
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
                width: double.maxFinite,
                margin: getMargin(
                  top: 13,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: getVerticalSize(
                          461,
                        ),
                        width: getHorizontalSize(
                          315,
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
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgClippathgroup,
                      height: getVerticalSize(
                        384,
                      ),
                      width: getHorizontalSize(
                        375,
                      ),
                      alignment: Alignment.center,
                    ),
                  ],
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
                  57,
                ),
                text: "lbl_update".tr,
                margin: getMargin(
                  left: 30,
                  top: 23,
                  right: 30,
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
                onTap: (){
                  Get.dialog(AlertDialog(backgroundColor: Colors.transparent,
                    contentPadding: EdgeInsets.zero,
                    insetPadding: const EdgeInsets.only(left: 0),
                    content:GradeYourselfDialog(Get.put(GradeYourselfController(),),),));
                },
                width: getHorizontalSize(
                  315,
                ),
                height: getVerticalSize(
                  57,
                ),
                text: "lbl_end_affirmation".tr,
                margin: getMargin(
                  left: 30,
                  top: 15,
                  right: 30,
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
