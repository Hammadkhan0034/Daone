
import '../edit_affirmation_dialog/controller/edit_affirmation_controller.dart';
import '../edit_affirmation_dialog/edit_affirmation_dialog.dart';
import 'controller/select_affirmation_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';


class SelectAffirmationScreen extends GetWidget<SelectAffirmationController> {
  const SelectAffirmationScreen({Key? key})
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
            79,
          ),
          leadingWidth: 72,
          leading: AppbarIconbutton(
            onTap: (){
              Get.back();
            },
            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              left: 24,
              top: 4,
              bottom: 4,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Get.dialog(AlertDialog(backgroundColor: Colors.transparent,
                      contentPadding: EdgeInsets.zero,
                      insetPadding: const EdgeInsets.only(left: 0),
                      content:EditAffirmationDialog(Get.put(EditAffirmationController(),),),));
                    // Get.dialog(AlertDialog(backgroundColor: Colors.transparent,
                    //   contentPadding: EdgeInsets.zero,
                    //   insetPadding: const EdgeInsets.only(left: 0),
                    //   content:AffirmationBlastDialog(
                    //     Get.put(AffirmationBlastController()
                    //       ,),
                    //   ),),
                    // );
     },
                  child: Container(
                    margin: getMargin(
                      top: 20,
                      bottom: 20
                    ),
                    padding: getPadding(
                      left: 109,
                      top: 19,
                      right: 109,
                      bottom: 19,
                    ),
                    decoration: AppDecoration.fill3.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder14,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgPlus,
                          height: getSize(
                            22,
                          ),
                          width: getSize(
                            22,
                          ),
                          margin: getMargin(
                            top: 3,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 6,
                          ),
                          child: Text(
                            "Add Affirmation",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.titleSmallPoppinsWhiteA700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Get.toNamed(AppRoutes.ownAffirmationRoute);
                    },
                    child: Container(
                    padding: getPadding(
                    all: 12,
                    ),
                    decoration: AppDecoration.outline4.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder14,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgRectangle5912,
                          height: getSize(
                            123,
                          ),
                          width: getSize(
                            123,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              8,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 12,
                            bottom: 2,
                          ),
                          child: Text(
                            "My Own Affirmation",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.labelLargeGray80001,
                          ),
                        ),
                      ],
                    ),
      ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.toNamed(AppRoutes.gratitudeAffirmationRoute);
                    },
                    child: Container(
                      padding: getPadding(
                        all: 12,
                      ),
                      decoration: AppDecoration.outline4.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder14,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: "assets/images/gradirude.png",
                            height: getSize(
                              123,
                            ),
                            width: getSize(
                              123,
                            ),
                            radius: BorderRadius.circular(
                              getHorizontalSize(
                                8,
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 12,
                              bottom: 2,
                            ),
                            child: Text(
                              "Gratitude",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.labelLargeGray80001,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
                InkWell(
                  onTap: (){
                    Get.toNamed(AppRoutes.prosperityAffirmationRoute);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                    Container(
                    padding: getPadding(
                    all: 12,
                    ),
                    decoration: AppDecoration.outline4.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder14,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath:'assets/images/money.png',
                          height: getSize(
                            123,
                          ),
                          width: getSize(
                            123,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              8,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 12,
                            bottom: 2,
                          ),
                          child: Text(
                            "Prosperity and Money",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.labelLargeGray80001,
                          ),
                        ),
                      ],
                    ),
      ),
                    InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.loveAffirmationRoute);
                      },
                      child: Container(
                      padding: getPadding(
                      all: 12,
                      ),
                      decoration: AppDecoration.outline4.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder14,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath:'assets/images/love.png',
                            height: getSize(
                              123,
                            ),
                            width: getSize(
                              123,
                            ),
                            radius: BorderRadius.circular(
                              getHorizontalSize(
                                8,
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 12,
                              bottom: 2,
                            ),
                            child: Text(
                              "Love is relationship",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.labelLargeGray80001,
                            ),
                          ),
                        ],
                      ),
      ),
                    ),
              ],
            ),
                  ),
                ),
            InkWell(
              onTap: (){
                Get.toNamed(AppRoutes.selfAffirmationRoute);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                    padding: getPadding(
                    all: 12,
                    ),
                    decoration: AppDecoration.outline4.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder14,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath:'assets/images/win.png',
                          height: getSize(
                            123,
                          ),
                          width: getSize(
                            123,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              8,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 12,
                            bottom: 2,
                          ),
                          child: Text(
                            "Self Confidence",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.labelLargeGray80001,
                          ),
                        ),
                      ],
                    ),
      ),
                  ],
                ),
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
