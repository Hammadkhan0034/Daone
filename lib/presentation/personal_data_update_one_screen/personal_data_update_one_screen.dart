import '../personal_data_update_one_screen/widgets/listn_item_widget.dart';
import 'controller/personal_data_update_one_controller.dart';
import 'models/listn_item_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/appbar_image.dart';
import 'package:daone/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_bottom_bar.dart';
import 'package:daone/widgets/custom_drop_down.dart';
import 'package:daone/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class PersonalDataUpdateOneScreen
    extends GetWidget<PersonalDataUpdateOneController> {
  const PersonalDataUpdateOneScreen({Key? key})
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
            81,
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
            text: "lbl_highlights".tr,
          ),
          actions: [
            AppbarImage(
              height: getSize(
                40,
              ),
              width: getSize(
                40,
              ),
              svgPath: ImageConstant.imgFolder,
              margin: getMargin(
                left: 30,
                top: 4,
                right: 30,
                bottom: 12,
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 44,
            ),
            child: Padding(
              padding: getPadding(
                left: 29,
                right: 29,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: getVerticalSize(
                          189,
                        ),
                        child: VerticalDivider(
                          width: getHorizontalSize(
                            2,
                          ),
                          thickness: getVerticalSize(
                            2,
                          ),
                          color: appTheme.gray80003,
                          indent: getHorizontalSize(
                            55,
                          ),
                          endIndent: getHorizontalSize(
                            39,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Obx(
                          () => ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (
                              context,
                              index,
                            ) {
                              return SizedBox(
                                height: getVerticalSize(
                                  18,
                                ),
                              );
                            },
                            itemCount: controller.personalDataUpdateOneModelObj
                                .value.listnItemList.value.length,
                            itemBuilder: (context, index) {
                              ListnItemModel model = controller
                                  .personalDataUpdateOneModelObj
                                  .value
                                  .listnItemList
                                  .value[index];
                              return ListnItemWidget(
                                model,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: getPadding(
                      top: 18,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: getVerticalSize(
                            189,
                          ),
                          child: VerticalDivider(
                            width: getHorizontalSize(
                              2,
                            ),
                            thickness: getVerticalSize(
                              2,
                            ),
                            color: appTheme.gray80003,
                            indent: getHorizontalSize(
                              55,
                            ),
                            endIndent: getHorizontalSize(
                              39,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: getMargin(
                              left: 12,
                            ),
                            padding: getPadding(
                              left: 20,
                              top: 17,
                              right: 20,
                              bottom: 17,
                            ),
                            decoration: AppDecoration.outline16.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder18,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    left: 2,
                                  ),
                                  child: Row(
                                    children: [
                                      CustomOutlinedButton(
                                        text: "lbl_n2".tr,
                                        buttonStyle: CustomButtonStyles
                                            .outlineBlack900
                                            .copyWith(
                                                fixedSize: MaterialStateProperty
                                                    .all<Size>(Size(
                                          getHorizontalSize(
                                            44,
                                          ),
                                          getVerticalSize(
                                            44,
                                          ),
                                        ))),
                                        buttonTextStyle: CustomTextStyles
                                            .bodyLargePoppinsGray90003,
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          left: 15,
                                          top: 7,
                                          bottom: 6,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "lbl_you_highlighted".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .labelMediumGray90003Medium,
                                            ),
                                            Text(
                                              "msg_02_august_2023_at".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .poppinsOnError,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: getHorizontalSize(
                                    250,
                                  ),
                                  margin: getMargin(
                                    left: 10,
                                    top: 17,
                                  ),
                                  child: Text(
                                    "msg_repeating_affirmations".tr,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        CustomTextStyles.bodyMediumBlack900_1,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 12,
                                    top: 9,
                                    bottom: 9,
                                  ),
                                  child: Text(
                                    "msg_posted_on_02_august".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.poppinsOnError,
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
                      top: 18,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: getVerticalSize(
                            174,
                          ),
                          child: VerticalDivider(
                            width: getHorizontalSize(
                              2,
                            ),
                            thickness: getVerticalSize(
                              2,
                            ),
                            color: appTheme.gray80003,
                            indent: getHorizontalSize(
                              55,
                            ),
                            endIndent: getHorizontalSize(
                              24,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: getMargin(
                              left: 12,
                            ),
                            padding: getPadding(
                              left: 20,
                              top: 17,
                              right: 20,
                              bottom: 17,
                            ),
                            decoration: AppDecoration.outline16.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder18,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    left: 2,
                                  ),
                                  child: Row(
                                    children: [
                                      CustomOutlinedButton(
                                        text: "lbl_n2".tr,
                                        buttonStyle: CustomButtonStyles
                                            .outlineBlack900
                                            .copyWith(
                                                fixedSize: MaterialStateProperty
                                                    .all<Size>(Size(
                                          getHorizontalSize(
                                            44,
                                          ),
                                          getVerticalSize(
                                            44,
                                          ),
                                        ))),
                                        buttonTextStyle: CustomTextStyles
                                            .bodyLargePoppinsGray90003,
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          left: 15,
                                          top: 7,
                                          bottom: 6,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "lbl_you_highlighted".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .labelMediumGray90003Medium,
                                            ),
                                            Text(
                                              "msg_02_august_2023_at".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .poppinsOnError,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: getHorizontalSize(
                                    250,
                                  ),
                                  margin: getMargin(
                                    left: 10,
                                    top: 17,
                                  ),
                                  child: Text(
                                    "msg_repeating_affirmations".tr,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        CustomTextStyles.bodyMediumBlack900_1,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 12,
                                    top: 9,
                                    bottom: 9,
                                  ),
                                  child: Text(
                                    "msg_posted_on_02_august".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.poppinsOnError,
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
                      top: 201,
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
                          items: controller.personalDataUpdateOneModelObj.value
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
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {},
        ),
      ),
    );
  }
}
