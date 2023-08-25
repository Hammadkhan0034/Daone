import 'controller/blog_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_bottom_bar.dart';
import 'package:daone/widgets/custom_drop_down.dart';
import 'package:daone/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class BlogScreen extends GetWidget<BlogController> {
  const BlogScreen({Key? key})
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
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 29,
            ),
            child: Padding(
              padding: getPadding(
                left: 26,
                right: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomIconButton(
                    height: 48,
                    width: 48,
                    margin: getMargin(
                      left: 3,
                    ),
                    padding: getPadding(
                      all: 11,
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgInfo,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 3,
                      top: 32,
                      right: 4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_latest_blog".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: CustomTextStyles.titleMediumGray90003Medium,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 6,
                            bottom: 4,
                          ),
                          child: Text(
                            "lbl_august_02_2023".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.labelMediumGray60001,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle5917,
                    height: getVerticalSize(
                      174,
                    ),
                    width: getHorizontalSize(
                      315,
                    ),
                    radius: BorderRadius.circular(
                      getHorizontalSize(
                        14,
                      ),
                    ),
                    margin: getMargin(
                      left: 3,
                      top: 7,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: getHorizontalSize(
                        302,
                      ),
                      margin: getMargin(
                        left: 4,
                        top: 11,
                        right: 12,
                      ),
                      child: Text(
                        "msg_the_power_of_se".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.titleMediumBlack90018,
                      ),
                    ),
                  ),
                  Container(
                    width: getHorizontalSize(
                      316,
                    ),
                    margin: getMargin(
                      top: 6,
                    ),
                    child: Text(
                      "msg_life_can_be_a_rollercoaster".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.bodySmallBlack900,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 3,
                      top: 13,
                    ),
                    child: Text(
                      "lbl_recent_blogs".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleSmallPoppinsBlack900SemiBold,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 3,
                      top: 13,
                      right: 4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgRectangle5918,
                          height: getVerticalSize(
                            86,
                          ),
                          width: getHorizontalSize(
                            87,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              8,
                            ),
                          ),
                          margin: getMargin(
                            bottom: 3,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 3,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: getHorizontalSize(
                                  50,
                                ),
                                padding: getPadding(
                                  left: 7,
                                  top: 2,
                                  right: 7,
                                  bottom: 2,
                                ),
                                decoration: AppDecoration.txtFill4.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.txtCircleBorder7,
                                ),
                                child: Text(
                                  "lbl_affirmation".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      CustomTextStyles.poppinsWhiteA700Regular6,
                                ),
                              ),
                              Container(
                                width: getHorizontalSize(
                                  206,
                                ),
                                margin: getMargin(
                                  top: 10,
                                ),
                                child: Text(
                                  "msg_the_power_of_se".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles
                                      .labelLargeBlack900SemiBold,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 3,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "lbl_by_philips".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          CustomTextStyles.bodySmallGray60003,
                                    ),
                                    Container(
                                      height: getSize(
                                        5,
                                      ),
                                      width: getSize(
                                        5,
                                      ),
                                      margin: getMargin(
                                        left: 9,
                                        top: 3,
                                        bottom: 7,
                                      ),
                                      decoration: BoxDecoration(
                                        color: appTheme.gray60003,
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 13,
                                      ),
                                      child: Text(
                                        "lbl_august_01_2023".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            CustomTextStyles.bodySmallGray60003,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 3,
                      top: 21,
                    ),
                    child: Row(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgRectangle591886x87,
                          height: getVerticalSize(
                            86,
                          ),
                          width: getHorizontalSize(
                            87,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              8,
                            ),
                          ),
                          margin: getMargin(
                            bottom: 3,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 17,
                            top: 3,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: getHorizontalSize(
                                  50,
                                ),
                                padding: getPadding(
                                  left: 7,
                                  top: 2,
                                  right: 7,
                                  bottom: 2,
                                ),
                                decoration: AppDecoration.txtFill4.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.txtCircleBorder7,
                                ),
                                child: Text(
                                  "lbl_affirmation".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      CustomTextStyles.poppinsWhiteA700Regular6,
                                ),
                              ),
                              Container(
                                width: getHorizontalSize(
                                  165,
                                ),
                                margin: getMargin(
                                  top: 10,
                                ),
                                child: Text(
                                  "msg_unraveling_the_concept".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles
                                      .labelLargeBlack900SemiBold,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 3,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "lbl_by_philips".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          CustomTextStyles.bodySmallGray60003,
                                    ),
                                    Container(
                                      height: getSize(
                                        5,
                                      ),
                                      width: getSize(
                                        5,
                                      ),
                                      margin: getMargin(
                                        left: 9,
                                        top: 3,
                                        bottom: 7,
                                      ),
                                      decoration: BoxDecoration(
                                        color: appTheme.gray60003,
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 13,
                                      ),
                                      child: Text(
                                        "lbl_july_28_2023".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            CustomTextStyles.bodySmallGray60003,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 3,
                      top: 21,
                      right: 4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgRectangle59181,
                          height: getVerticalSize(
                            86,
                          ),
                          width: getHorizontalSize(
                            87,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              8,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 3,
                            bottom: 39,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: getHorizontalSize(
                                  50,
                                ),
                                padding: getPadding(
                                  left: 7,
                                  top: 2,
                                  right: 7,
                                  bottom: 2,
                                ),
                                decoration: AppDecoration.txtFill4.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.txtCircleBorder7,
                                ),
                                child: Text(
                                  "lbl_affirmation".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      CustomTextStyles.poppinsWhiteA700Regular6,
                                ),
                              ),
                              Container(
                                width: getHorizontalSize(
                                  206,
                                ),
                                margin: getMargin(
                                  top: 8,
                                ),
                                child: Text(
                                  "msg_the_power_of_se".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles
                                      .labelLargeBlack900SemiBold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {},
        ),
      ),
    );
  }
}
