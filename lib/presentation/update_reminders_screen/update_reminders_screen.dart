import 'controller/update_reminders_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_drop_down.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:daone/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class UpdateRemindersScreen extends GetWidget<UpdateRemindersController> {
  const UpdateRemindersScreen({Key? key})
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(
                  left: 24,
                  top: 45,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppbarIconbutton(
                      onTap: (){
                        Get.back();
                      },
                      svgPath: ImageConstant.imgInfo,
                    ),
                    Center(
                      child: Container(


                        child: Stack(
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgGroup141,

                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,

                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgFrameDeepOrangeA20006,
                              height: getVerticalSize(
                                146,
                              ),
                              width: getHorizontalSize(
                                127,
                              ),
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: getPadding(
                    top: 19,
                  ),
                  child: Padding(
                    padding: getPadding(
                      left: 26,
                      right: 26,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "msg_set_the_reminder".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: CustomTextStyles.titleLargeGray90002,
                        ),
                        Container(
                          width: getHorizontalSize(
                            249,
                          ),
                          margin: getMargin(
                            left: 38,
                            top: 8,
                            right: 35,
                          ),
                          child: Text(
                            "msg_just_let_us_know".tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.bodySmallGray60005,
                          ),
                        ),
                        CustomTextFormField(
                          controller: controller.affirmationvideController,
                          margin: getMargin(
                            top: 27,
                          ),
                          contentPadding: getPadding(
                            all: 17,
                          ),
                          textStyle: CustomTextStyles.bodySmallGray90003,
                          hintText: "msg_my_first_affirmation".tr,
                          hintStyle: CustomTextStyles.bodySmallGray90003,
                          filled: true,
                          fillColor: appTheme.whiteA700,
                          defaultBorderDecoration:
                              TextFormFieldStyleHelper.outlineGray40001,
                          enabledBorderDecoration:
                              TextFormFieldStyleHelper.outlineGray40001,
                          focusedBorderDecoration:
                              TextFormFieldStyleHelper.outlineGray40001,
                          disabledBorderDecoration:
                              TextFormFieldStyleHelper.outlineGray40001,
                        ),
                        Padding(
                          padding: getPadding(
                            left: 1,
                            top: 34,
                            right: 4,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: getVerticalSize(
                                  88,
                                ),
                                width: getHorizontalSize(
                                  143,
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "lbl_09_00_am".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: theme.textTheme.headlineSmall,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: getVerticalSize(
                                          88,
                                        ),
                                        width: getHorizontalSize(
                                          143,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              16,
                                            ),
                                          ),
                                          border: Border.all(
                                            color: appTheme.gray40001,
                                            width: getHorizontalSize(
                                              2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 38,
                                  bottom: 29,
                                ),
                                child: Text(
                                  "lbl_to".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.bodyMediumGray90003,
                                ),
                              ),
                              Container(
                                width: getHorizontalSize(
                                  143,
                                ),
                                padding: getPadding(
                                  left: 15,
                                  top: 23,
                                  right: 15,
                                  bottom: 23,
                                ),
                                decoration: AppDecoration.txtOutline.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.txtRoundedBorder16,
                                ),
                                child: Text(
                                  "lbl_05_00_pm".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.headlineSmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: getVerticalSize(
                            60,
                          ),
                          width: getHorizontalSize(
                            319,
                          ),
                          margin: getMargin(
                            top: 33,
                          ),
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "lbl_10x".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.labelLargeGray90003,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: getPadding(
                                    top: 1,
                                  ),
                                  child: Text(
                                    "lbl_how_many".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.labelLargeGray90003,
                                  ),
                                ),
                              ),
                              SliderTheme(
                                data: SliderThemeData(
                                  trackShape: RoundedRectSliderTrackShape(),
                                  activeTrackColor: appTheme.deepOrangeA20006,
                                  inactiveTrackColor: appTheme.blueGray100,
                                  thumbColor: appTheme.whiteA700,
                                  thumbShape: RoundSliderThumbShape(),
                                ),
                                child: Slider(
                                  value: 55.05,
                                  min: 0.0,
                                  max: 100.0,
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 2,
                            right: 4,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "lbl_02".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.labelLargeBluegray400dd,
                              ),
                              Text(
                                "lbl_202".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.labelLargeBluegray400dd,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: getVerticalSize(
                            68,
                          ),
                          width: getHorizontalSize(
                            315,
                          ),
                          margin: getMargin(
                            top: 26,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: getPadding(
                                    left: 108,
                                  ),
                                  child: Text(
                                    "lbl_let_s_start".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles
                                        .titleMediumWhiteA700Medium,
                                  ),
                                ),
                              ),
                              CustomElevatedButton(
                                onTap: (){
                                  Get.toNamed(AppRoutes.completeScreen);
                                },
                                width: getHorizontalSize(
                                  315,
                                ),
                                height: getVerticalSize(
                                  57,
                                ),
                                text: "lbl_update".tr,
                                buttonStyle: CustomButtonStyles
                                    .outlineIndigoA1004cTL28
                                    .copyWith(
                                        fixedSize:
                                            MaterialStateProperty.all<Size>(
                                                Size(
                                  getHorizontalSize(
                                    315,
                                  ),
                                  getVerticalSize(
                                    57,
                                  ),
                                ))),
                                decoration: CustomButtonStyles
                                    .outlineIndigoA1004cTL28Decoration,
                                buttonTextStyle:
                                    CustomTextStyles.titleMediumWhiteA700,
                                alignment: Alignment.bottomCenter,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 4,
                            top: 208,
                            right: 4,
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
                                textStyle:
                                    CustomTextStyles.bodySmallWhiteA70010,
                                items: controller.updateRemindersModelObj.value
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
                                                    style: theme
                                                        .textTheme.bodySmall,
                                                  ),
                                                  Text(
                                                    "lbl_mon".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: theme
                                                        .textTheme.bodySmall,
                                                  ),
                                                  Text(
                                                    "lbl_tue".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: theme
                                                        .textTheme.bodySmall,
                                                  ),
                                                  Text(
                                                    "lbl_wed".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: theme
                                                        .textTheme.bodySmall,
                                                  ),
                                                  Text(
                                                    "lbl_thu".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: theme
                                                        .textTheme.bodySmall,
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
                                                    style: theme
                                                        .textTheme.bodySmall,
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
                                              style:
                                                  CustomTextStyles.bodySmall10,
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
                                              style:
                                                  CustomTextStyles.bodySmall10,
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
                                              style:
                                                  CustomTextStyles.bodySmall10,
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
                                              style:
                                                  theme.textTheme.labelMedium,
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
                                              style:
                                                  CustomTextStyles.bodySmall10,
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
                                              style:
                                                  CustomTextStyles.bodySmall10,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
