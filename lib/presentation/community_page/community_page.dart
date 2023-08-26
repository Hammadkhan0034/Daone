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
