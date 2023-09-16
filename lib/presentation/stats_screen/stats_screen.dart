import 'package:daone/widgets/text_widget.dart';

import 'controller/stats_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class StatsScreen extends GetWidget<StatsController> {
  const StatsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: double.maxFinite,
            padding: getPadding(
              left: 28,
              top: 43,
              right: 28,
              bottom: 43,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(
                  onTap: () {
                    Get.back();
                  },
                  height: 45,
                  width: 48,
                  margin: getMargin(
                    left: 1,
                  ),
                  padding: getPadding(
                    all: 11,
                  ),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgInfo,
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "lbl_daily_affirmations_progress".tr,
                      color: Colors.black,
                      fsize: 16,
                      font: FontWeight.w600,
                    ),
                    Container(
                      width: Get.width * 0.17,
                      height: Get.height * 0.044,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [Color(0xfff36430), Color(0xffff7e67)],
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                              text: "Daily", color: Colors.white, fsize: 12),
                          Image.asset(
                            ImageConstant.arrowDown2,
                            scale: 1.4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height*0.05),
                Row(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(25.921112060546875),
                      elevation: 5,
                      child: Container(
                        width: Get.width * 0.35,
                        height: Get.height * 0.16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.921112060546875),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: Get.width * 0.4,
                              height: Get.height * 0.08,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.04,
                                  ),
                                  TextWidget(
                                    text: "20",
                                    color: Colors.black,
                                    fsize: 50,
                                    font: FontWeight.w600,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:3.0),
                                    child: Image.asset(
                                      ImageConstant.group10110,
                                      scale: 3.8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.02,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Center(
                                child: TextWidget(
                              text: "lbl_affirmation_completed".tr,
                              color: Colors.black54,
                              fsize: 12,
                              font: FontWeight.w500,
                            )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: Get.width*0.13),
                    Material(
                      borderRadius: BorderRadius.circular(25.921112060546875),
                      elevation: 5,
                      child: Container(
                        width: Get.width * 0.35,
                        height: Get.height * 0.16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.921112060546875),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width * 0.4,
                              height: Get.height * 0.08,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.03,
                                  ),
                                  TextWidget(
                                    text: "13",
                                    color: Colors.black,
                                    fsize: 50,
                                    font: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.01,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Image.asset(
                                      ImageConstant.camIcon,
                                      scale: 3.8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.03,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Center(
                                child: TextWidget(
                                  text: "lbl_intentions_completed".tr,
                                  color: Colors.black54,
                                  fsize: 12,
                                  font: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height*0.05),
                Row(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(25.921112060546875),
                      elevation: 5,
                      child: Container(
                        width: Get.width * 0.35,
                        height: Get.height * 0.16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.921112060546875),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width * 0.4,
                              height: Get.height * 0.08,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.04,
                                  ),
                                  TextWidget(
                                    text: "29",
                                    color: Colors.black,
                                    fsize: 50,
                                    font: FontWeight.w600,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:3,top:8.0),
                                    child: Image.asset(
                                      ImageConstant.group10111,
                                      scale: 3.8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.02,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Center(
                                child: TextWidget(
                                  text: "lbl_tasks_completed".tr,
                                  color: Colors.black54,
                                  fsize: 12,
                                  font: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: Get.width*0.13),
                    Material(
                      borderRadius: BorderRadius.circular(25.921112060546875),
                      elevation: 5,
                      child: Container(
                        width: Get.width * 0.35,
                        height: Get.height * 0.16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.921112060546875),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width * 0.4,
                              height: Get.height * 0.08,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.03,
                                  ),
                                  TextWidget(
                                    text: "10",
                                    color: Colors.black,
                                    fsize: 50,
                                    font: FontWeight.w600,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8,left: 5,right: 5),
                                    child: Image.asset(
                                      ImageConstant.msgIcon,
                                      scale: 3.8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Center(
                                child: TextWidget(
                                  text: "lbl_blog_read".tr,
                                  color: Colors.black54,
                                  fsize: 12,
                                  font: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: TextWidget(
                    text: "lbl_week_badges".tr,
                    color: Colors.black,
                    fsize: 16,
                    font: FontWeight.w600,
                  ),
                ),
                Container(
                  height: Get.height*0.11,
                  width: Get.width,
                  child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                      itemCount: 15,
                      itemBuilder: (context,index){
                    return Center(
                      child: Image.asset(ImageConstant.imageBadges,fit: BoxFit.cover),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: TextWidget(
                    text:                     "lbl_weekly_improvements_graph".tr,
                    color: Colors.black,
                    fsize: 16,
                    font: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 2,
                    top: 16,
                    bottom: 3,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: getPadding(
                            top: 7,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: getVerticalSize(
                                  160,
                                ),
                                width: getHorizontalSize(
                                  285,
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: getVerticalSize(
                                          137,
                                        ),
                                        width: getHorizontalSize(
                                          283,
                                        ),
                                        padding: getPadding(
                                          top: 28,
                                          bottom: 28,
                                        ),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: fs.Svg(
                                              ImageConstant.imgGroup194,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            CustomImageView(
                                              imagePath: ImageConstant.imgLine1,
                                              height: getVerticalSize(
                                                79,
                                              ),
                                              width: getHorizontalSize(
                                                282,
                                              ),
                                              radius: BorderRadius.circular(
                                                getHorizontalSize(
                                                  39,
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgEllipse,
                                      height: getVerticalSize(
                                        85,
                                      ),
                                      width: getHorizontalSize(
                                        285,
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 4,
                                  top: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "lbl_sun".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          CustomTextStyles.bodySmallGray60005,
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 20,
                                      ),
                                      child: Text(
                                        "lbl_mon".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            CustomTextStyles.bodySmallGray60005,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 20,
                                      ),
                                      child: Text(
                                        "lbl_tue".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            CustomTextStyles.bodySmallGray60005,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 20,
                                      ),
                                      child: Text(
                                        "lbl_wed".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            CustomTextStyles.bodySmallGray60005,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 20,
                                      ),
                                      child: Text(
                                        "lbl_thu".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: CustomTextStyles
                                            .labelLargeErrorContainer,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 18,
                                      ),
                                      child: Text(
                                        "lbl_fri".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            CustomTextStyles.bodySmallGray60005,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 20,
                                      ),
                                      child: Text(
                                        "lbl_sat".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            CustomTextStyles.bodySmallGray60005,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 2,
                          bottom: 17,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "lbl_100".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.bodySmallGray6000510,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 1,
                                top: 12,
                              ),
                              child: Text(
                                "lbl_80".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.bodySmallGray6000510,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 10,
                              ),
                              child: Text(
                                "lbl_60".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style:
                                    CustomTextStyles.labelMediumErrorContainer,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 1,
                                top: 12,
                              ),
                              child: Text(
                                "lbl_40".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.bodySmallGray6000510,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 2,
                                top: 10,
                              ),
                              child: Text(
                                "lbl_20".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.bodySmallGray6000510,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 2,
                                top: 12,
                              ),
                              child: Text(
                                "lbl_0".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.bodySmallGray6000510,
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
    );
  }
}
