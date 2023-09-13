import 'package:daone/widgets/text_widget.dart';
import 'controller/home_one_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class HomeOneScreen extends GetWidget<HomeOneController> {
  const HomeOneScreen({Key? key})
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Image.asset(ImageConstant.imgUntit11,scale: 2.8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    TextWidget(text:"lbl_welcome_back2".tr, color: Colors.black38, fsize: 12),
                    TextWidget(text:"lbl_stefani".tr, color: Colors.black, fsize: 20,font: FontWeight.bold),
                  ],),
                  SizedBox(width: Get.width*0.36,),
                  Image.asset(ImageConstant.notificationIcon,scale: 3.3),

                ],
              ),
            ),

            SizedBox(
              height: getVerticalSize(
                124,
              ),
              width: getHorizontalSize(
                317,
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgBa,
                    height: getVerticalSize(
                      124,
                    ),
                    width: getHorizontalSize(
                      317,
                    ),
                    radius: BorderRadius.circular(
                      getHorizontalSize(
                        22,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: getVerticalSize(
                        90,
                      ),
                      width: getHorizontalSize(
                        273,
                      ),
                      margin: getMargin(
                        bottom: 11,
                      ),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              width: getHorizontalSize(
                                205,
                              ),
                              child: Text(
                                "msg_transform_your_mind".tr,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles
                                    .titleSmallPoppinsWhiteA70015,
                              ),
                            ),
                          ),
                          CustomElevatedButton(
                            text: "lbl_read_more".tr,
                            buttonStyle: CustomButtonStyles
                                .fillDeeporangeA20006
                                .copyWith(
                                    fixedSize:
                                        MaterialStateProperty.all<Size>(
                                            Size(
                              getHorizontalSize(
                                77,
                              ),
                              getVerticalSize(
                                36,
                              ),
                            ))),
                            buttonTextStyle:
                                CustomTextStyles.labelSmallWhiteA700,
                            alignment: Alignment.bottomRight,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomImageView(
              svgPath: ImageConstant.imgGroup10071,
              height: getVerticalSize(
                5,
              ),
              width: getHorizontalSize(
                57,
              ),
              margin: getMargin(
                top: 7,
              ),
            ),
            // Container(
            //
            //   height: getVerticalSize(
            //     602,
            //   ),
            //   width: double.maxFinite,
            //   margin: getMargin(
            //     top: 19,
            //   ),
            //   child: Stack(
            //     alignment: Alignment.topLeft,
            //     children: [
            //       Opacity(
            //         opacity: 0.15,
            //         child: CustomImageView(
            //           imagePath: ImageConstant.imgEllipse255270x169,
            //           height: getVerticalSize(
            //             270,
            //           ),
            //           width: getHorizontalSize(
            //             169,
            //           ),
            //           alignment: Alignment.bottomRight,
            //           margin: getMargin(
            //             bottom: 130,
            //           ),
            //         ),
            //       ),
            //       Align(
            //         alignment: Alignment.topLeft,
            //         child: Container(
            //           height: getVerticalSize(
            //             210,
            //           ),
            //           width: getHorizontalSize(
            //             173,
            //           ),
            //           margin: getMargin(
            //             top: 97,
            //           ),
            //           child: Stack(
            //             alignment: Alignment.topRight,
            //             children: [
            //               Opacity(
            //                 opacity: 0.15,
            //                 child: CustomImageView(
            //                   imagePath: ImageConstant.imgEllipse254210x173,
            //                   height: getVerticalSize(
            //                     210,
            //                   ),
            //                   width: getHorizontalSize(
            //                     173,
            //                   ),
            //                   alignment: Alignment.center,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       Align(
            //         alignment: Alignment.bottomCenter,
            //         child: Container(
            //           margin: getMargin(
            //             left: 30,
            //             right: 29,
            //             bottom: 95,
            //           ),
            //           padding: getPadding(
            //             left: 20,
            //             top: 12,
            //             right: 20,
            //             bottom: 12,
            //           ),
            //           decoration: AppDecoration.outline1.copyWith(
            //             borderRadius: BorderRadiusStyle.circleBorder37,
            //           ),
            //           child: CustomImageView(
            //             svgPath: ImageConstant.imgGroup681,
            //             height: getVerticalSize(
            //               50,
            //             ),
            //             width: getHorizontalSize(
            //               268,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

          ],
        ),
      ),
    );
  }
}
