import 'package:daone/widgets/text_widget.dart';

import 'controller/stats_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_bottom_bar.dart';
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
    final statsController =Get.find<StatsController>();
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
                  onTap: (){
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
                SizedBox(height: Get.height*0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(text: "lbl_daily_affirmations_progress".tr, color: Colors.black, fsize:16,font: FontWeight.w600,),
                    Container(
                      width: Get.width*0.17,
                      height: Get.height*0.044,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                              begin: Alignment.centerRight, end: Alignment.centerLeft,
                              colors: [Color(0xfff36430), Color(0xffff7e67)], )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(text: "Daily", color: Colors.white, fsize:12),
                          Image.asset(ImageConstant.arrowDown2,scale: 1.4,),
                        ],
                      ),
                    ),
                  ],
                ),
          Container(
            color: Colors.deepOrange,
            height: 300,
            width: 300,
            child: ListView.builder(
              itemCount: 4, // Total 4 items, 2 in each row
              itemBuilder: (context, index) {
                if (index % 2 == 0) {
                  // Create a row for even-indexed items
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Item 1 in the row
                      Container(
                          width: 136.51783752441406,
                          height: 136.51783752441406,
                          decoration:     BoxDecoration(
                              borderRadius: BorderRadius.circular(25.921112060546875),
                              color: Colors.white),
                        child:Column(
                          children: [
                            TextWidget(text: "20", color:Colors.black, fsize: 17),
                          ],
                        ) ,
                      ),
                      // Item 2 in the row
                      Container(
                        width: 150,
                        height: 150,
                        color: Colors.green,
                        child: Center(
                          child: Text('Item ${index + 2}'),
                        ),
                      ),
                    ],
                  );
                } else {
                  // For odd-indexed items, return an empty SizedBox
                  return SizedBox.shrink();
                }
              },
            ),
          ),
                Padding(
                  padding: getPadding(
                    top: 45,
                  ),
                  child: Text(
                    "lbl_weekly_improvements_graph".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.titleMedium,
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
                                  137,
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
                                      style: CustomTextStyles.bodySmallGray60005,
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
                                style: CustomTextStyles.labelMediumErrorContainer,
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
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {},
        ),
      ),
    );
  }
}
