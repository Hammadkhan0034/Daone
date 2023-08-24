import 'controller/community_controller.dart';
import 'models/community_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_drop_down.dart';
import 'package:daone/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

class CommunityPage extends StatelessWidget {
  CommunityPage({Key? key})
      : super(
          key: key,
        );

  CommunityController controller =
      Get.put(CommunityController(CommunityModel().obs));

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
                    top: 17,
                    right: 29,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgAvatar,
                            height: getSize(
                              27,
                            ),
                            width: getSize(
                              27,
                            ),
                            radius: BorderRadius.circular(
                              getHorizontalSize(
                                13,
                              ),
                            ),
                            margin: getMargin(
                              top: 1,
                              bottom: 1,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "lbl_james_holand".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.bodySmallBlack90011,
                                ),
                                Text(
                                  "msg_02_august_2023_at".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.bodySmallOnError,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle5915167x317,
                        height: getVerticalSize(
                          167,
                        ),
                        width: getHorizontalSize(
                          317,
                        ),
                        radius: BorderRadius.circular(
                          getHorizontalSize(
                            15,
                          ),
                        ),
                        margin: getMargin(
                          top: 14,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 16,
                          top: 17,
                        ),
                        child: Row(
                          children: [
                            Opacity(
                              opacity: 0.1,
                              child: CustomIconButton(
                                height: 40,
                                width: 40,
                                padding: getPadding(
                                  all: 11,
                                ),
                                decoration:
                                    IconButtonStyleHelper.fillDeeporangeA20006,
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgMusic,
                                ),
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 8,
                                top: 10,
                                bottom: 11,
                              ),
                              child: Text(
                                "lbl_124".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style:
                                    CustomTextStyles.bodySmallDeeporangeA20006,
                              ),
                            ),
                            Opacity(
                              opacity: 0.1,
                              child: CustomIconButton(
                                height: 40,
                                width: 40,
                                margin: getMargin(
                                  left: 31,
                                ),
                                padding: getPadding(
                                  all: 12,
                                ),
                                decoration: IconButtonStyleHelper.fillGray50001,
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgSearchGray50001,
                                ),
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 8,
                                top: 10,
                                bottom: 11,
                              ),
                              child: Text(
                                "lbl_9".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.bodySmallOnError_1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 18,
                          top: 21,
                        ),
                        child: Text(
                          "msg_did_procreate_change".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: CustomTextStyles.bodyMediumBlack900,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: getHorizontalSize(
                            278,
                          ),
                          margin: getMargin(
                            left: 19,
                            top: 3,
                            right: 20,
                          ),
                          child: Text(
                            "msg_self_affirmations".tr,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.bodySmallBlack9008,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: getPadding(
                            top: 21,
                          ),
                          child: Divider(
                            height: getVerticalSize(
                              1,
                            ),
                            thickness: getVerticalSize(
                              1,
                            ),
                            color: appTheme.gray10003,
                            indent: getHorizontalSize(
                              14,
                            ),
                            endIndent: getHorizontalSize(
                              15,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: getVerticalSize(
                          227,
                        ),
                        width: getHorizontalSize(
                          317,
                        ),
                        margin: getMargin(
                          top: 19,
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.imgAvatar27x27,
                                        height: getSize(
                                          27,
                                        ),
                                        width: getSize(
                                          27,
                                        ),
                                        radius: BorderRadius.circular(
                                          getHorizontalSize(
                                            13,
                                          ),
                                        ),
                                        margin: getMargin(
                                          top: 2,
                                        ),
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          left: 8,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "lbl_kaira".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .bodySmallBlack90011,
                                            ),
                                            Text(
                                              "msg_02_august_2023_at".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .bodySmallOnError,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: getHorizontalSize(
                                        278,
                                      ),
                                      margin: getMargin(
                                        left: 19,
                                        top: 26,
                                        right: 5,
                                      ),
                                      child: Text(
                                        "msg_self_affirmations".tr,
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            CustomTextStyles.bodySmallBlack9008,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 16,
                                      top: 30,
                                    ),
                                    child: Row(
                                      children: [
                                        Opacity(
                                          opacity: 0.1,
                                          child: CustomIconButton(
                                            height: 40,
                                            width: 40,
                                            padding: getPadding(
                                              all: 11,
                                            ),
                                            decoration: IconButtonStyleHelper
                                                .fillDeeporangeA20006,
                                            child: CustomImageView(
                                              svgPath: ImageConstant.imgMusic,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 8,
                                            top: 10,
                                            bottom: 11,
                                          ),
                                          child: Text(
                                            "lbl_124".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .bodySmallDeeporangeA20006,
                                          ),
                                        ),
                                        Opacity(
                                          opacity: 0.1,
                                          child: CustomIconButton(
                                            height: 40,
                                            width: 40,
                                            margin: getMargin(
                                              left: 31,
                                            ),
                                            padding: getPadding(
                                              all: 12,
                                            ),
                                            decoration: IconButtonStyleHelper
                                                .fillGray50001,
                                            child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgSearchGray50001,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 8,
                                            top: 10,
                                            bottom: 11,
                                          ),
                                          child: Text(
                                            "lbl_9".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .bodySmallOnError_1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 30,
                                    ),
                                    child: Divider(
                                      height: getVerticalSize(
                                        1,
                                      ),
                                      thickness: getVerticalSize(
                                        1,
                                      ),
                                      color: appTheme.gray10003,
                                      indent: getHorizontalSize(
                                        14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: getMargin(
                                  left: 1,
                                  bottom: 22,
                                ),
                                padding: getPadding(
                                  left: 133,
                                  top: 12,
                                  right: 133,
                                  bottom: 12,
                                ),
                                decoration: AppDecoration.outline9.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder37,
                                ),
                                child: CustomIconButton(
                                  height: 50,
                                  width: 50,
                                  padding: getPadding(
                                    all: 11,
                                  ),
                                  decoration: IconButtonStyleHelper
                                      .fillDeeporangeA20001,
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgBiplus,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 1,
                          top: 117,
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
                              items: controller.communityModelObj.value
                                  .dropdownItemList.value,
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
                          left: 1,
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
