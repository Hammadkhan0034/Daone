import 'controller/comment_section_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_drop_down.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:daone/widgets/custom_icon_button.dart';
import 'package:daone/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class CommentSectionScreen extends GetWidget<CommentSectionController> {
  const CommentSectionScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.whiteA700,
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 45,
            ),
            child: Padding(
              padding: getPadding(
                left: 26,
                right: 27,
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
                      top: 17,
                      right: 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: getVerticalSize(
                            44,
                          ),
                          width: getHorizontalSize(
                            131,
                          ),
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "lbl_community".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.titleLarge21,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: getPadding(
                                    left: 1,
                                  ),
                                  child: Text(
                                    "lbl_good_morning".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.bodySmallGray900019,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: getMargin(
                            top: 1,
                            bottom: 2,
                          ),
                          padding: getPadding(
                            left: 3,
                            top: 2,
                            right: 3,
                            bottom: 2,
                          ),
                          decoration: AppDecoration.fill11.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder22,
                          ),
                          child: Row(
                            children: [
                              CustomElevatedButton(
                                text: "lbl_trending".tr,
                                buttonStyle: CustomButtonStyles
                                    .fillDeeporangeA20005TL18
                                    .copyWith(
                                        fixedSize:
                                            MaterialStateProperty.all<Size>(
                                                Size(
                                  getHorizontalSize(
                                    85,
                                  ),
                                  getVerticalSize(
                                    36,
                                  ),
                                ))),
                                buttonTextStyle:
                                    CustomTextStyles.bodySmallWhiteA7009,
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 13,
                                  top: 12,
                                  bottom: 8,
                                ),
                                child: Text(
                                  "lbl_following".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.bodySmallGray900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: getVerticalSize(
                      649,
                    ),
                    width: getHorizontalSize(
                      322,
                    ),
                    margin: getMargin(
                      top: 15,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: getPadding(
                              left: 3,
                              right: 2,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "lbl_james_holand".tr,
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
                                CustomImageView(
                                  imagePath: ImageConstant.imgRectangle59151,
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
                                    top: 13,
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
                                      right: 19,
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
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: getPadding(
                                      top: 20,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgAvatar27x27,
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
                                                    bottom: 1,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: getPadding(
                                                    left: 8,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "lbl_kaira".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: CustomTextStyles
                                                            .bodySmallBlack90011,
                                                      ),
                                                      Text(
                                                        "msg_02_august_2023_at"
                                                            .tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
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
                                                  top: 25,
                                                  right: 4,
                                                ),
                                                child: Text(
                                                  "msg_self_affirmations".tr,
                                                  maxLines: 5,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: CustomTextStyles
                                                      .bodySmallBlack9008,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(
                                                left: 16,
                                                top: 29,
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
                                                          IconButtonStyleHelper
                                                              .fillDeeporangeA20006,
                                                      child: CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgMusic,
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                                      decoration:
                                                          IconButtonStyleHelper
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                            bottom: 23,
                                          ),
                                          padding: getPadding(
                                            left: 133,
                                            top: 12,
                                            right: 133,
                                            bottom: 12,
                                          ),
                                          decoration:
                                              AppDecoration.outline9.copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder37,
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
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: getVerticalSize(
                              544,
                            ),
                            width: getHorizontalSize(
                              322,
                            ),
                            margin: getMargin(
                              bottom: 22,
                            ),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    margin: getMargin(
                                      left: 1,
                                    ),
                                    padding: getPadding(
                                      left: 16,
                                      top: 20,
                                      right: 16,
                                      bottom: 20,
                                    ),
                                    decoration:
                                        AppDecoration.outline11.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder14,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                            width: getHorizontalSize(
                                              139,
                                            ),
                                            child: Divider(
                                              height: getVerticalSize(
                                                4,
                                              ),
                                              thickness: getVerticalSize(
                                                4,
                                              ),
                                              color: appTheme.deepOrangeA20005,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 3,
                                            top: 23,
                                          ),
                                          child: Text(
                                            "lbl_comments".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .labelLargeBlack900,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            top: 16,
                                          ),
                                          child: Divider(
                                            height: getVerticalSize(
                                              1,
                                            ),
                                            thickness: getVerticalSize(
                                              1,
                                            ),
                                            color: appTheme.gray10003,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 1,
                                            top: 23,
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgEllipse259,
                                                height: getSize(
                                                  41,
                                                ),
                                                width: getSize(
                                                  41,
                                                ),
                                                radius: BorderRadius.circular(
                                                  getHorizontalSize(
                                                    20,
                                                  ),
                                                ),
                                                margin: getMargin(
                                                  bottom: 51,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: getPadding(
                                                    left: 11,
                                                    top: 2,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding: getPadding(
                                                              bottom: 1,
                                                            ),
                                                            child: Text(
                                                              "lbl_donald_rice"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: CustomTextStyles
                                                                  .labelMediumBlack900,
                                                            ),
                                                          ),
                                                          Container(
                                                            height: getSize(
                                                              3,
                                                            ),
                                                            width: getSize(
                                                              3,
                                                            ),
                                                            margin: getMargin(
                                                              left: 6,
                                                              top: 6,
                                                              bottom: 7,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: theme
                                                                  .colorScheme
                                                                  .onErrorContainer,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                getHorizontalSize(
                                                                  1,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: getPadding(
                                                              left: 6,
                                                              top: 1,
                                                            ),
                                                            child: Text(
                                                              "lbl_5_min_ago"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: CustomTextStyles
                                                                  .bodySmallBlack90010,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        width:
                                                            getHorizontalSize(
                                                          181,
                                                        ),
                                                        margin: getMargin(
                                                          left: 1,
                                                          top: 5,
                                                        ),
                                                        child: Text(
                                                          "msg_you_reinforce_a"
                                                              .tr,
                                                          maxLines: 3,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: CustomTextStyles
                                                              .bodySmallBlack9009,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: getPadding(
                                                          top: 9,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  getPadding(
                                                                top: 1,
                                                              ),
                                                              child: Text(
                                                                "lbl_reply".tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .bodySmallBluegray400,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  getPadding(
                                                                left: 19,
                                                                bottom: 1,
                                                              ),
                                                              child: Text(
                                                                "lbl_liked".tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .bodySmallRed500,
                                                              ),
                                                            ),
                                                            CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgFavorite,
                                                              height:
                                                                  getVerticalSize(
                                                                13,
                                                              ),
                                                              width:
                                                                  getHorizontalSize(
                                                                14,
                                                              ),
                                                              margin: getMargin(
                                                                top: 1,
                                                                bottom: 2,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  getPadding(
                                                                left: 2,
                                                                bottom: 1,
                                                              ),
                                                              child: Text(
                                                                "lbl_24".tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .bodySmallBlack90010,
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
                                        Padding(
                                          padding: getPadding(
                                            left: 1,
                                            top: 33,
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgEllipse25941x41,
                                                height: getSize(
                                                  41,
                                                ),
                                                width: getSize(
                                                  41,
                                                ),
                                                radius: BorderRadius.circular(
                                                  getHorizontalSize(
                                                    20,
                                                  ),
                                                ),
                                                margin: getMargin(
                                                  bottom: 51,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: getPadding(
                                                    left: 11,
                                                    top: 2,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding: getPadding(
                                                              bottom: 1,
                                                            ),
                                                            child: Text(
                                                              "lbl_donald_rice"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: CustomTextStyles
                                                                  .labelMediumBlack900,
                                                            ),
                                                          ),
                                                          Container(
                                                            height: getSize(
                                                              3,
                                                            ),
                                                            width: getSize(
                                                              3,
                                                            ),
                                                            margin: getMargin(
                                                              left: 6,
                                                              top: 6,
                                                              bottom: 7,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: theme
                                                                  .colorScheme
                                                                  .onErrorContainer,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                getHorizontalSize(
                                                                  1,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: getPadding(
                                                              left: 6,
                                                              top: 1,
                                                            ),
                                                            child: Text(
                                                              "lbl_5_min_ago"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: CustomTextStyles
                                                                  .bodySmallBlack90010,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        width:
                                                            getHorizontalSize(
                                                          181,
                                                        ),
                                                        margin: getMargin(
                                                          left: 1,
                                                          top: 5,
                                                        ),
                                                        child: Text(
                                                          "msg_you_reinforce_a"
                                                              .tr,
                                                          maxLines: 3,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: CustomTextStyles
                                                              .bodySmallBlack9009,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: getPadding(
                                                          top: 9,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  getPadding(
                                                                top: 1,
                                                              ),
                                                              child: Text(
                                                                "lbl_reply".tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .bodySmallBluegray400,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  getPadding(
                                                                left: 22,
                                                                bottom: 1,
                                                              ),
                                                              child: Text(
                                                                "lbl_like".tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .bodySmallBluegray40010,
                                                              ),
                                                            ),
                                                            CustomImageView(
                                                              svgPath: ImageConstant
                                                                  .imgFavoriteGray80006,
                                                              height:
                                                                  getVerticalSize(
                                                                13,
                                                              ),
                                                              width:
                                                                  getHorizontalSize(
                                                                14,
                                                              ),
                                                              margin: getMargin(
                                                                top: 1,
                                                                bottom: 2,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  getPadding(
                                                                left: 2,
                                                                bottom: 1,
                                                              ),
                                                              child: Text(
                                                                "lbl_24".tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .bodySmallBlack90010,
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
                                        Padding(
                                          padding: getPadding(
                                            left: 1,
                                            top: 32,
                                            bottom: 65,
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgEllipse2591,
                                                height: getSize(
                                                  41,
                                                ),
                                                width: getSize(
                                                  41,
                                                ),
                                                radius: BorderRadius.circular(
                                                  getHorizontalSize(
                                                    20,
                                                  ),
                                                ),
                                                margin: getMargin(
                                                  bottom: 51,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: getPadding(
                                                    left: 11,
                                                    top: 2,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding: getPadding(
                                                              bottom: 1,
                                                            ),
                                                            child: Text(
                                                              "lbl_donald_rice"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: CustomTextStyles
                                                                  .labelMediumBlack900,
                                                            ),
                                                          ),
                                                          Container(
                                                            height: getSize(
                                                              3,
                                                            ),
                                                            width: getSize(
                                                              3,
                                                            ),
                                                            margin: getMargin(
                                                              left: 6,
                                                              top: 6,
                                                              bottom: 7,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: theme
                                                                  .colorScheme
                                                                  .onErrorContainer,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                getHorizontalSize(
                                                                  1,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: getPadding(
                                                              left: 6,
                                                              top: 1,
                                                            ),
                                                            child: Text(
                                                              "lbl_5_min_ago"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: CustomTextStyles
                                                                  .bodySmallBlack90010,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        width:
                                                            getHorizontalSize(
                                                          181,
                                                        ),
                                                        margin: getMargin(
                                                          left: 1,
                                                          top: 5,
                                                        ),
                                                        child: Text(
                                                          "msg_you_reinforce_a"
                                                              .tr,
                                                          maxLines: 3,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: CustomTextStyles
                                                              .bodySmallBlack9009,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: getPadding(
                                                          top: 9,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  getPadding(
                                                                top: 1,
                                                              ),
                                                              child: Text(
                                                                "lbl_reply".tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .bodySmallBluegray400,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  getPadding(
                                                                left: 22,
                                                                bottom: 1,
                                                              ),
                                                              child: Text(
                                                                "lbl_like".tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .bodySmallBluegray40010,
                                                              ),
                                                            ),
                                                            CustomImageView(
                                                              svgPath: ImageConstant
                                                                  .imgFavoriteGray80006,
                                                              height:
                                                                  getVerticalSize(
                                                                13,
                                                              ),
                                                              width:
                                                                  getHorizontalSize(
                                                                14,
                                                              ),
                                                              margin: getMargin(
                                                                top: 1,
                                                                bottom: 2,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  getPadding(
                                                                left: 2,
                                                                bottom: 1,
                                                              ),
                                                              child: Text(
                                                                "lbl_24".tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .bodySmallBlack90010,
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
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    padding: getPadding(
                                      all: 6,
                                    ),
                                    decoration: AppDecoration.fill12.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.customBorderBL15,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomTextFormField(
                                          controller: controller
                                              .typesomethingController,
                                          contentPadding: getPadding(
                                            top: 10,
                                            bottom: 10,
                                          ),
                                          textStyle: CustomTextStyles
                                              .bodySmallGray500dd,
                                          hintText:
                                              "msg_type_something_here".tr,
                                          hintStyle: CustomTextStyles
                                              .bodySmallGray500dd,
                                          prefix: Container(
                                            margin: getMargin(
                                              left: 8,
                                              top: 6,
                                              right: 8,
                                              bottom: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                getHorizontalSize(
                                                  11,
                                                ),
                                              ),
                                            ),
                                            child: CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgEllipse25923x23,
                                              height: getSize(
                                                23,
                                              ),
                                              width: getSize(
                                                23,
                                              ),
                                            ),
                                          ),
                                          prefixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(
                                              34,
                                            ),
                                          ),
                                          suffix: Container(
                                            margin: getMargin(
                                              left: 12,
                                              top: 8,
                                              right: 11,
                                              bottom: 8,
                                            ),
                                            child: CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgLightbulb,
                                            ),
                                          ),
                                          suffixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(
                                              34,
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: appTheme.whiteA700,
                                          defaultBorderDecoration:
                                              TextFormFieldStyleHelper
                                                  .fillWhiteA700,
                                          enabledBorderDecoration:
                                              TextFormFieldStyleHelper
                                                  .fillWhiteA700,
                                          focusedBorderDecoration:
                                              TextFormFieldStyleHelper
                                                  .fillWhiteA700,
                                          disabledBorderDecoration:
                                              TextFormFieldStyleHelper
                                                  .fillWhiteA700,
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 10,
                                            top: 11,
                                            right: 8,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "lbl_1".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    theme.textTheme.bodyLarge,
                                              ),
                                              Text(
                                                "lbl_2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    theme.textTheme.bodyLarge,
                                              ),
                                              Text(
                                                "lbl_3".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    theme.textTheme.bodyLarge,
                                              ),
                                              Text(
                                                "lbl_4".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    theme.textTheme.bodyLarge,
                                              ),
                                              Text(
                                                "lbl_5".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    theme.textTheme.bodyLarge,
                                              ),
                                              Text(
                                                "lbl_6".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    theme.textTheme.bodyLarge,
                                              ),
                                              Text(
                                                "lbl_7".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    theme.textTheme.bodyLarge,
                                              ),
                                              Text(
                                                "lbl_8".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    theme.textTheme.bodyLarge,
                                              ),
                                              Text(
                                                "lbl_9".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    theme.textTheme.bodyLarge,
                                              ),
                                              Text(
                                                "lbl_02".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    theme.textTheme.bodyLarge,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 9,
                                            top: 17,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: getPadding(
                                                  top: 3,
                                                ),
                                                child: Text(
                                                  "lbl_q".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 19,
                                                  top: 1,
                                                  bottom: 1,
                                                ),
                                                child: Text(
                                                  "lbl_w".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 19,
                                                  top: 1,
                                                  bottom: 1,
                                                ),
                                                child: Text(
                                                  "lbl_e".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 23,
                                                  top: 1,
                                                  bottom: 1,
                                                ),
                                                child: Text(
                                                  "lbl_r".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 23,
                                                  bottom: 2,
                                                ),
                                                child: Text(
                                                  "lbl_t".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 23,
                                                  top: 3,
                                                ),
                                                child: Text(
                                                  "lbl_y".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 21,
                                                  top: 1,
                                                  bottom: 1,
                                                ),
                                                child: Text(
                                                  "lbl_u".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 24,
                                                  bottom: 3,
                                                ),
                                                child: Text(
                                                  "lbl_i".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 24,
                                                  top: 1,
                                                  bottom: 1,
                                                ),
                                                child: Text(
                                                  "lbl_o".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 21,
                                                  top: 3,
                                                ),
                                                child: Text(
                                                  "lbl_p".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 25,
                                            top: 14,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: getPadding(
                                                  top: 1,
                                                  bottom: 1,
                                                ),
                                                child: Text(
                                                  "lbl_a".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 21,
                                                  top: 1,
                                                  bottom: 1,
                                                ),
                                                child: Text(
                                                  "lbl_s".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 21,
                                                  bottom: 3,
                                                ),
                                                child: Text(
                                                  "lbl_d".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 23,
                                                  bottom: 3,
                                                ),
                                                child: Text(
                                                  "lbl_f".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 22,
                                                  top: 3,
                                                ),
                                                child: Text(
                                                  "lbl_g".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 21,
                                                  bottom: 3,
                                                ),
                                                child: Text(
                                                  "lbl_h".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 22,
                                                  top: 2,
                                                  bottom: 1,
                                                ),
                                                child: Text(
                                                  "lbl_j".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 25,
                                                  bottom: 3,
                                                ),
                                                child: Text(
                                                  "lbl_k".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 24,
                                                  bottom: 3,
                                                ),
                                                child: Text(
                                                  "lbl_l".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 16,
                                            top: 14,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgUploadBlueGray40001,
                                                height: getVerticalSize(
                                                  19,
                                                ),
                                                width: getHorizontalSize(
                                                  15,
                                                ),
                                                margin: getMargin(
                                                  top: 4,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 25,
                                                  top: 1,
                                                  bottom: 1,
                                                ),
                                                child: Text(
                                                  "lbl_z".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 21,
                                                  top: 1,
                                                  bottom: 1,
                                                ),
                                                child: Text(
                                                  "lbl_x".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 21,
                                                  top: 1,
                                                  bottom: 1,
                                                ),
                                                child: Text(
                                                  "lbl_c".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 21,
                                                  top: 1,
                                                  bottom: 1,
                                                ),
                                                child: Text(
                                                  "lbl_v".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 21,
                                                  bottom: 3,
                                                ),
                                                child: Text(
                                                  "lbl_b".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 21,
                                                  top: 1,
                                                  bottom: 1,
                                                ),
                                                child: Text(
                                                  "lbl_n".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 19,
                                                  top: 1,
                                                  bottom: 1,
                                                ),
                                                child: Text(
                                                  "lbl_m".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              CustomImageView(
                                                svgPath: ImageConstant.imgClose,
                                                height: getVerticalSize(
                                                  13,
                                                ),
                                                width: getHorizontalSize(
                                                  17,
                                                ),
                                                margin: getMargin(
                                                  left: 18,
                                                  top: 3,
                                                  bottom: 6,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 10,
                                            top: 10,
                                            bottom: 17,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: getPadding(
                                                  top: 7,
                                                  bottom: 13,
                                                ),
                                                child: Text(
                                                  "lbl_123".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: CustomTextStyles
                                                      .labelMediumRobotoBluegray40001,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 18,
                                                  top: 14,
                                                ),
                                                child: Text(
                                                  "lbl".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgUserBlueGray40001,
                                                height: getSize(
                                                  13,
                                                ),
                                                width: getSize(
                                                  13,
                                                ),
                                                margin: getMargin(
                                                  left: 23,
                                                  top: 8,
                                                  bottom: 13,
                                                ),
                                              ),
                                              Container(
                                                height: getVerticalSize(
                                                  30,
                                                ),
                                                width: getHorizontalSize(
                                                  115,
                                                ),
                                                margin: getMargin(
                                                  left: 14,
                                                  bottom: 4,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: appTheme.blueGray10001,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    getHorizontalSize(
                                                      2,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 19,
                                                  top: 13,
                                                  bottom: 1,
                                                ),
                                                child: Text(
                                                  "lbl2".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                              CustomIconButton(
                                                height: 22,
                                                width: 22,
                                                margin: getMargin(
                                                  left: 25,
                                                  top: 6,
                                                  bottom: 5,
                                                ),
                                                padding: getPadding(
                                                  all: 5,
                                                ),
                                                decoration:
                                                    IconButtonStyleHelper
                                                        .fillTeal300,
                                                child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgArrowleftBlueGray5001,
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 4,
                      top: 117,
                      right: 3,
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
                          items: controller.commentSectionModelObj.value
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
                      left: 4,
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
                                          top: 11,
                                          bottom: 11,
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
                                              imagePath:
                                                  ImageConstant.imgLinegraph,
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "lbl_sun".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.bodySmall,
                                            ),
                                            Text(
                                              "lbl_mon".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.bodySmall,
                                            ),
                                            Text(
                                              "lbl_tue".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.bodySmall,
                                            ),
                                            Text(
                                              "lbl_wed".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.bodySmall,
                                            ),
                                            Text(
                                              "lbl_thu".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.bodySmall,
                                            ),
                                            Text(
                                              "lbl_fri".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.labelLarge,
                                            ),
                                            Text(
                                              "lbl_sat".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgActivegraph,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                              borderRadius: BorderRadiusStyle.roundedBorder8,
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
                                      style:
                                          CustomTextStyles.bodySmallGray500058,
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 33,
                                      ),
                                      child: Text(
                                        "lbl_90".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            CustomTextStyles.bodySmallGreen5008,
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
          ),
        ),
      ),
    );
  }
}
