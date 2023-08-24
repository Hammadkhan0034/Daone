import 'controller/view_friend_full_profile_controller.dart';
import 'models/view_friend_full_profile_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_drop_down.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

class ViewFriendFullProfilePage extends StatelessWidget {
  ViewFriendFullProfilePage({Key? key})
      : super(
          key: key,
        );

  ViewFriendFullProfileController controller = Get.put(
      ViewFriendFullProfileController(ViewFriendFullProfileModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    left: 29,
                    top: 35,
                    right: 29,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getVerticalSize(
                          458,
                        ),
                        width: getHorizontalSize(
                          317,
                        ),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 0,
                                margin: EdgeInsets.all(0),
                                color: appTheme.whiteA700,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: appTheme.indigo100,
                                    width: getHorizontalSize(
                                      1,
                                    ),
                                  ),
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder14,
                                ),
                                child: Container(
                                  height: getVerticalSize(
                                    420,
                                  ),
                                  width: getHorizontalSize(
                                    317,
                                  ),
                                  padding: getPadding(
                                    left: 17,
                                    top: 47,
                                    right: 17,
                                    bottom: 47,
                                  ),
                                  decoration: AppDecoration.outline13.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder14,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          height: getVerticalSize(
                                            132,
                                          ),
                                          width: getHorizontalSize(
                                            127,
                                          ),
                                          margin: getMargin(
                                            top: 45,
                                          ),
                                          decoration: BoxDecoration(
                                            color: appTheme.whiteA700,
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(
                                                14,
                                              ),
                                            ),
                                            border: Border.all(
                                              color: appTheme.deepOrangeA20006,
                                              width: getHorizontalSize(
                                                1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                          height: getVerticalSize(
                                            132,
                                          ),
                                          width: getHorizontalSize(
                                            127,
                                          ),
                                          decoration: BoxDecoration(
                                            color: appTheme.whiteA700,
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(
                                                14,
                                              ),
                                            ),
                                            border: Border.all(
                                              color: appTheme.deepOrangeA20006,
                                              width: getHorizontalSize(
                                                1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          height: getVerticalSize(
                                            132,
                                          ),
                                          width: getHorizontalSize(
                                            127,
                                          ),
                                          margin: getMargin(
                                            top: 45,
                                            right: 1,
                                          ),
                                          decoration: BoxDecoration(
                                            color: appTheme.whiteA700,
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(
                                                14,
                                              ),
                                            ),
                                            border: Border.all(
                                              color: appTheme.deepOrangeA20006,
                                              width: getHorizontalSize(
                                                1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          height: getVerticalSize(
                                            132,
                                          ),
                                          width: getHorizontalSize(
                                            127,
                                          ),
                                          margin: getMargin(
                                            right: 1,
                                          ),
                                          decoration: BoxDecoration(
                                            color: appTheme.whiteA700,
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(
                                                14,
                                              ),
                                            ),
                                            border: Border.all(
                                              color: appTheme.deepOrangeA20006,
                                              width: getHorizontalSize(
                                                1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Card(
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 0,
                                          margin: getMargin(
                                            bottom: 87,
                                          ),
                                          color: appTheme.whiteA700,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: appTheme.deepOrangeA20006,
                                              width: getHorizontalSize(
                                                1,
                                              ),
                                            ),
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder60,
                                          ),
                                          child: Container(
                                            height: getSize(
                                              120,
                                            ),
                                            width: getSize(
                                              120,
                                            ),
                                            padding: getPadding(
                                              left: 21,
                                              top: 24,
                                              right: 21,
                                              bottom: 24,
                                            ),
                                            decoration: AppDecoration.outline14
                                                .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder60,
                                            ),
                                            child: Stack(
                                              alignment: Alignment.topCenter,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Text(
                                                    "lbl_90".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: theme
                                                        .textTheme.displaySmall,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Padding(
                                                    padding: getPadding(
                                                      top: 9,
                                                    ),
                                                    child: Text(
                                                      "lbl_average".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: CustomTextStyles
                                                          .titleSmallPoppinsGray80002,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          height: getSize(
                                            69,
                                          ),
                                          width: getSize(
                                            69,
                                          ),
                                          margin: getMargin(
                                            left: 29,
                                            top: 76,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(
                                                34,
                                              ),
                                            ),
                                            gradient: LinearGradient(
                                              begin: Alignment(
                                                1,
                                                1,
                                              ),
                                              end: Alignment(
                                                -0.24,
                                                -0.31,
                                              ),
                                              colors: [
                                                appTheme.deepOrangeA20006,
                                                theme.colorScheme.primary,
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          margin: getMargin(
                                            left: 76,
                                            top: 73,
                                          ),
                                          padding: getPadding(
                                            left: 6,
                                            top: 3,
                                            right: 6,
                                            bottom: 3,
                                          ),
                                          decoration:
                                              AppDecoration.outline13.copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder11,
                                          ),
                                          child: Text(
                                            "lbl_10".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .labelMediumSemiBold,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                          height: getSize(
                                            69,
                                          ),
                                          width: getSize(
                                            69,
                                          ),
                                          margin: getMargin(
                                            left: 29,
                                            bottom: 30,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(
                                                34,
                                              ),
                                            ),
                                            gradient: LinearGradient(
                                              begin: Alignment(
                                                1,
                                                1,
                                              ),
                                              end: Alignment(
                                                -0.24,
                                                -0.31,
                                              ),
                                              colors: [
                                                appTheme.deepOrangeA20006,
                                                theme.colorScheme.primary,
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          height: getSize(
                                            69,
                                          ),
                                          width: getSize(
                                            69,
                                          ),
                                          margin: getMargin(
                                            right: 29,
                                            bottom: 30,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(
                                                34,
                                              ),
                                            ),
                                            gradient: LinearGradient(
                                              begin: Alignment(
                                                1,
                                                1,
                                              ),
                                              end: Alignment(
                                                -0.24,
                                                -0.31,
                                              ),
                                              colors: [
                                                appTheme.deepOrangeA20006,
                                                theme.colorScheme.primary,
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          height: getSize(
                                            69,
                                          ),
                                          width: getSize(
                                            69,
                                          ),
                                          margin: getMargin(
                                            top: 77,
                                            right: 30,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(
                                                34,
                                              ),
                                            ),
                                            gradient: LinearGradient(
                                              begin: Alignment(
                                                1,
                                                1,
                                              ),
                                              end: Alignment(
                                                -0.24,
                                                -0.31,
                                              ),
                                              colors: [
                                                appTheme.deepOrangeA20006,
                                                theme.colorScheme.primary,
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          margin: getMargin(
                                            top: 73,
                                            right: 27,
                                          ),
                                          padding: getPadding(
                                            left: 8,
                                            top: 3,
                                            right: 8,
                                            bottom: 3,
                                          ),
                                          decoration:
                                              AppDecoration.outline13.copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder11,
                                          ),
                                          child: Text(
                                            "lbl_8".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .labelMediumSemiBold,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          margin: getMargin(
                                            right: 26,
                                            bottom: 76,
                                          ),
                                          padding: getPadding(
                                            left: 6,
                                            top: 3,
                                            right: 6,
                                            bottom: 3,
                                          ),
                                          decoration:
                                              AppDecoration.outline13.copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder11,
                                          ),
                                          child: Text(
                                            "lbl_10".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .labelMediumSemiBold,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                          margin: getMargin(
                                            left: 79,
                                            bottom: 76,
                                          ),
                                          padding: getPadding(
                                            left: 6,
                                            top: 3,
                                            right: 6,
                                            bottom: 3,
                                          ),
                                          decoration:
                                              AppDecoration.outline13.copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder11,
                                          ),
                                          child: Text(
                                            "lbl_12".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .labelMediumSemiBold,
                                          ),
                                        ),
                                      ),
                                      CustomImageView(
                                        imagePath: ImageConstant.imgVideolesson,
                                        height: getSize(
                                          37,
                                        ),
                                        width: getSize(
                                          37,
                                        ),
                                        alignment: Alignment.bottomRight,
                                        margin: getMargin(
                                          right: 45,
                                          bottom: 45,
                                        ),
                                      ),
                                      CustomImageView(
                                        imagePath: ImageConstant.imgIdea,
                                        height: getSize(
                                          42,
                                        ),
                                        width: getSize(
                                          42,
                                        ),
                                        alignment: Alignment.bottomLeft,
                                        margin: getMargin(
                                          left: 42,
                                          bottom: 43,
                                        ),
                                      ),
                                      CustomImageView(
                                        imagePath: ImageConstant.imgFire,
                                        height: getSize(
                                          42,
                                        ),
                                        width: getSize(
                                          42,
                                        ),
                                        alignment: Alignment.topRight,
                                        margin: getMargin(
                                          top: 90,
                                          right: 43,
                                        ),
                                      ),
                                      CustomImageView(
                                        imagePath: ImageConstant.imgYes,
                                        height: getSize(
                                          43,
                                        ),
                                        width: getSize(
                                          43,
                                        ),
                                        alignment: Alignment.topLeft,
                                        margin: getMargin(
                                          left: 42,
                                          top: 89,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgEllipse26281x81,
                              height: getSize(
                                81,
                              ),
                              width: getSize(
                                81,
                              ),
                              radius: BorderRadius.circular(
                                getHorizontalSize(
                                  40,
                                ),
                              ),
                              alignment: Alignment.topCenter,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgUntit11,
                              height: getSize(
                                47,
                              ),
                              width: getSize(
                                47,
                              ),
                              alignment: Alignment.topRight,
                              margin: getMargin(
                                top: 42,
                                right: 94,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: getPadding(
                                  top: 88,
                                ),
                                child: Text(
                                  "lbl_smith2".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.titleLargeBluegray700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomElevatedButton(
                        width: getHorizontalSize(
                          307,
                        ),
                        height: getVerticalSize(
                          60,
                        ),
                        text: "lbl_add_friends".tr,
                        margin: getMargin(
                          left: 5,
                          top: 34,
                          right: 5,
                        ),
                        buttonStyle:
                            CustomButtonStyles.outlineIndigoA1004c.copyWith(
                                fixedSize: MaterialStateProperty.all<Size>(Size(
                          double.maxFinite,
                          getVerticalSize(
                            60,
                          ),
                        ))),
                        decoration:
                            CustomButtonStyles.outlineIndigoA1004cDecoration,
                        buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                      ),
                      Padding(
                        padding: getPadding(
                          left: 1,
                          top: 170,
                          right: 1,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: getPadding(
                                top: 3,
                                bottom: 3,
                              ),
                              child: Text(
                                "msg_workout_progress".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                            CustomDropDown(
                              width: getHorizontalSize(
                                76,
                              ),
                              icon: Container(
                                margin: getMargin(
                                  left: 5,
                                  right: 10,
                                ),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdown,
                                ),
                              ),
                              hintText: "lbl_weekly".tr,
                              textStyle: CustomTextStyles.bodySmallWhiteA70010,
                              items: controller.viewFriendFullProfileModelObj
                                  .value.dropdownItemList.value,
                              contentPadding: getPadding(
                                left: 10,
                                top: 7,
                                bottom: 7,
                              ),
                              onChanged: (value) {
                                controller.onSelected(value);
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: getVerticalSize(
                          182,
                        ),
                        width: getHorizontalSize(
                          315,
                        ),
                        margin: getMargin(
                          top: 5,
                        ),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: getVerticalSize(
                                      164,
                                    ),
                                    width: getHorizontalSize(
                                      283,
                                    ),
                                    margin: getMargin(
                                      top: 8,
                                    ),
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                            height: getVerticalSize(
                                              137,
                                            ),
                                            width: getHorizontalSize(
                                              283,
                                            ),
                                            padding: getPadding(
                                              top: 12,
                                              bottom: 12,
                                            ),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: fs.Svg(
                                                  ImageConstant.imgGroup116,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgLinegraph,
                                                  height: getVerticalSize(
                                                    110,
                                                  ),
                                                  width: getHorizontalSize(
                                                    282,
                                                  ),
                                                  alignment: Alignment.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            width: getHorizontalSize(
                                              275,
                                            ),
                                            margin: getMargin(
                                              left: 4,
                                              top: 146,
                                              right: 4,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "lbl_sun".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                                Text(
                                                  "lbl_mon".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                                Text(
                                                  "lbl_tue".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                                Text(
                                                  "lbl_wed".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                                Text(
                                                  "lbl_thu".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                                Text(
                                                  "lbl_fri".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: theme
                                                      .textTheme.labelLarge,
                                                ),
                                                Text(
                                                  "lbl_sat".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        CustomImageView(
                                          imagePath:
                                              ImageConstant.imgActivegraph,
                                          height: getVerticalSize(
                                            121,
                                          ),
                                          width: getHorizontalSize(
                                            25,
                                          ),
                                          alignment: Alignment.bottomRight,
                                          margin: getMargin(
                                            right: 39,
                                            bottom: 5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 3,
                                      bottom: 18,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "lbl_100".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: CustomTextStyles.bodySmall10,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 2,
                                            top: 12,
                                          ),
                                          child: Text(
                                            "lbl_80".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: CustomTextStyles.bodySmall10,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 2,
                                            top: 11,
                                          ),
                                          child: Text(
                                            "lbl_60".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: CustomTextStyles.bodySmall10,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            top: 12,
                                          ),
                                          child: Text(
                                            "lbl_40".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: theme.textTheme.labelMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 3,
                                            top: 11,
                                          ),
                                          child: Text(
                                            "lbl_20".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: CustomTextStyles.bodySmall10,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 3,
                                            top: 12,
                                          ),
                                          child: Text(
                                            "lbl_0".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: CustomTextStyles.bodySmall10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: getMargin(
                                  left: 94,
                                  right: 91,
                                ),
                                padding: getPadding(
                                  all: 10,
                                ),
                                decoration: AppDecoration.outline2.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "lbl_fri_28_may".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles
                                              .bodySmallGray500058,
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 33,
                                          ),
                                          child: Text(
                                            "lbl_90".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .bodySmallGreen5008,
                                          ),
                                        ),
                                        CustomImageView(
                                          svgPath: ImageConstant.imgUpload,
                                          height: getSize(
                                            8,
                                          ),
                                          width: getSize(
                                            8,
                                          ),
                                          margin: getMargin(
                                            top: 2,
                                            bottom: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        top: 3,
                                      ),
                                      child: Text(
                                        "msg_upperbody_workout".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: CustomTextStyles.bodySmall10_1,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        top: 3,
                                      ),
                                      child: Container(
                                        height: getVerticalSize(
                                          5,
                                        ),
                                        width: getHorizontalSize(
                                          110,
                                        ),
                                        decoration: BoxDecoration(
                                          color: appTheme.gray50,
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              2,
                                            ),
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              2,
                                            ),
                                          ),
                                          child: LinearProgressIndicator(
                                            value: 0.79,
                                            backgroundColor: appTheme.gray50,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
