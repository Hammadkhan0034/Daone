import '../save_or_edit_blog_dialog/controller/save_or_edit_blog_controller.dart';
import '../save_or_edit_blog_dialog/save_or_edit_blog_dialog.dart';
import 'controller/latest_blog_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class LatestBlogScreen extends GetWidget<LatestBlogController> {
  const LatestBlogScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          height: Get.height*0.11,
          width: Get.width*0.8,
          child: Row(
            children: [
              SizedBox(width: Get.width*0.1),
              Material(
                borderRadius: BorderRadius.circular(50),
                elevation: 3,
                child: Container(
                  height: Get.height*0.09,
                  width: Get.width*0.8,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      InkWell(

                          onTap: (){
                            Get.dialog(AlertDialog(backgroundColor: Colors.transparent,
                              contentPadding: EdgeInsets.zero, insetPadding: const EdgeInsets.only(left: 0),
                              content:SaveOrEditBlogDialog(Get.put(SaveOrEditBlogController(),),),));
                          },
                          child: Image.asset(ImageConstant.imageBlog1,scale: 3.1)),
                      Spacer(),
                      InkWell(
                          onTap: (){
                            Get.dialog(AlertDialog(backgroundColor: Colors.transparent,
                              contentPadding: EdgeInsets.zero, insetPadding: const EdgeInsets.only(left: 0),
                              content:SaveOrEditBlogDialog(Get.put(SaveOrEditBlogController(),),),));
                          },

                          child: Image.asset(ImageConstant.imageBlog2,scale: 3.1)),
                      Spacer(),
                      InkWell(
                          onTap: (){
                            Get.dialog(AlertDialog(backgroundColor: Colors.transparent,
                              contentPadding: EdgeInsets.zero, insetPadding: const EdgeInsets.only(left: 0),
                              content:SaveOrEditBlogDialog(Get.put(SaveOrEditBlogController(),),),));
                          },
                          child: Image.asset(ImageConstant.imageBlog3,scale: 3.1)),
                      Spacer(),

                    ],
                  ),
                ),
              ),
              SizedBox(width: Get.width*0.02),
            ],
          ),
        ),
        backgroundColor: appTheme.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            97,
          ),
          leadingWidth: 77,
          leading: AppbarIconbutton(
            onTap: (){
              Get.back();
            },
            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              left: 29,
              top: 4,
              bottom: 4,
            ),
          ),
          centerTitle: true,
          title: AppbarSubtitle2(
            text: "lbl_today_s_blog".tr,
          ),
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 18,
            ),
            child: Padding(
              padding: getPadding(
                left: 29,
                right: 29,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle5915,
                    height: getVerticalSize(
                      211,
                    ),
                    width: getHorizontalSize(
                      317,
                    ),
                    radius: BorderRadius.circular(
                      getHorizontalSize(
                        35,
                      ),
                    ),
                  ),
                  Container(
                    width: getHorizontalSize(
                      299,
                    ),
                    margin: getMargin(
                      top: 22,
                      right: 18,
                    ),
                    child: Text(
                      "msg_the_power_of_se".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleMediumBlack900,
                    ),
                  ),
                  Container(
                    height: getVerticalSize(
                      360,
                    ),
                    width: getHorizontalSize(
                      311,
                    ),
                    margin: getMargin(
                      top: 12,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: getHorizontalSize(
                              311,
                            ),
                            child: Text(
                              "msg_life_can_be_a_rollercoaster".tr,
                              maxLines: 17,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.bodySmallBlack900,
                            ),
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
        floatingActionButton: Container(
          height: Get.height*0.09,
          width: Get.width*0.18,
          decoration: AppDecoration.outline9.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder33,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgFile,
                height: getVerticalSize(
                  26,
                ),
                width: getHorizontalSize(
                  23,
                ),
                margin: getMargin(
                  top: 14,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 2,
                ),
                child: Text(
                  "lbl_10_2k".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.poppinsBlack900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
