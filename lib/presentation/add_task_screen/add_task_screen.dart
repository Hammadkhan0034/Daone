import 'package:daone/widgets/custom_bottom_bar.dart';

import '../add_task_screen/widgets/chipviewgroupfo_item_widget.dart';
import 'controller/add_task_controller.dart';
import 'models/chipviewgroupfo_item_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_drop_down.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:daone/widgets/custom_radio_button.dart';
import 'package:daone/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class AddTaskScreen extends GetWidget<AddTaskController> {
  const AddTaskScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomBar(),
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            97,
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
          centerTitle: true,
          title: Text(
            "lbl_add_task".tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: CustomTextStyles.titleMediumHindSiliguriIndigo9000118,
          ),
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 25,
            ),
            child: Padding(
              padding: getPadding(
                left: 24,
                right: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(
                      left: 6,
                    ),
                    child: Text(
                      "lbl_tittle".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleSmallHindSiliguriBluegray300,
                    ),
                  ),
                  CustomTextFormField(
                    controller: controller.group216Controller,
                    margin: getMargin(
                      left: 6,
                      top: 9,
                      right: 6,
                    ),
                    textStyle:
                        CustomTextStyles.titleMediumHindSiliguriIndigo90001,
                    hintText: "msg_plan_for_a_month".tr,
                    hintStyle:
                        CustomTextStyles.titleMediumHindSiliguriIndigo90001,
                    defaultBorderDecoration:
                        TextFormFieldStyleHelper.underLineIndigo50,
                    enabledBorderDecoration:
                        TextFormFieldStyleHelper.underLineIndigo50,
                    focusedBorderDecoration:
                        TextFormFieldStyleHelper.underLineIndigo50,
                    disabledBorderDecoration:
                        TextFormFieldStyleHelper.underLineIndigo50,
                  ),
                  Padding(
                    padding: getPadding(
                      left: 6,
                      top: 18,
                    ),
                    child: Text(
                      "lbl_date".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleSmallHindSiliguriBluegray300,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 6,
                      top: 7,
                      right: 6,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 3,
                          ),
                          child: Text(
                            "lbl_4_july_2023".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles
                                .titleMediumHindSiliguriIndigo90001,
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgCalendarIndigo200,
                          height: getSize(
                            20,
                          ),
                          width: getSize(
                            20,
                          ),
                          margin: getMargin(
                            bottom: 9,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 10,
                    ),
                    child: Divider(
                      height: getVerticalSize(
                        1,
                      ),
                      thickness: getVerticalSize(
                        1,
                      ),
                      color: appTheme.indigo50,
                      indent: getHorizontalSize(
                        6,
                      ),
                      endIndent: getHorizontalSize(
                        6,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 6,
                      top: 22,
                    ),
                    child: Text(
                      "lbl_time".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleSmallHindSiliguriBluegray300,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        left: 38,
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "lbl_07_00".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles
                                .titleMediumHindSiliguriIndigo90001,
                          ),
                          Padding(
                            padding: getPadding(
                              left: 20,
                            ),
                            child: Text(
                              "lbl_am".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles
                                  .titleMediumHindSiliguriIndigo90001,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "lbl_07_30".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles
                                .titleMediumHindSiliguriIndigo90001,
                          ),
                          Padding(
                            padding: getPadding(
                              left: 21,
                            ),
                            child: Text(
                              "lbl_am".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles
                                  .titleMediumHindSiliguriIndigo90001,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 6,
                      top: 11,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            height: getVerticalSize(
                              1,
                            ),
                            thickness: getVerticalSize(
                              1,
                            ),
                            color: appTheme.indigo50,
                            endIndent: getHorizontalSize(
                              7,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            height: getVerticalSize(
                              1,
                            ),
                            thickness: getVerticalSize(
                              1,
                            ),
                            color: appTheme.indigo50,
                            indent: getHorizontalSize(
                              7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 6,
                      top: 23,
                    ),
                    child: Text(
                      "lbl_description".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleSmallHindSiliguriBluegray300,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 6,
                      top: 9,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "msg_creating_this_month_s".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: CustomTextStyles
                              .titleMediumHindSiliguriIndigo90001,
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgFluentmorever,
                          height: getSize(
                            14,
                          ),
                          width: getSize(
                            14,
                          ),
                          margin: getMargin(
                            left: 77,
                            bottom: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 10,
                    ),
                    child: Divider(
                      height: getVerticalSize(
                        1,
                      ),
                      thickness: getVerticalSize(
                        1,
                      ),
                      color: appTheme.indigo50,
                      indent: getHorizontalSize(
                        6,
                      ),
                      endIndent: getHorizontalSize(
                        6,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 6,
                      top: 20,
                    ),
                    child: Text(
                      "lbl_type".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleSmallHindSiliguriBluegray300,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 4,
                      top: 8,
                    ),
                    child: Row(
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgCheckmarkIndigo400,
                          height: getSize(
                            16,
                          ),
                          width: getSize(
                            16,
                          ),
                          margin: getMargin(
                            top: 5,
                            bottom: 4,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 8,
                          ),
                          child: Text(
                            "lbl_personal".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles
                                .bodyLargeHindSiliguriIndigo90001,
                          ),
                        ),
                        Container(
                          height: getSize(
                            12,
                          ),
                          width: getSize(
                            12,
                          ),
                          margin: getMargin(
                            left: 31,
                            top: 7,
                            bottom: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                4,
                              ),
                            ),
                            border: Border.all(
                              color: appTheme.blue5001,
                              width: getHorizontalSize(
                                1,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 10,
                          ),
                          child: Text(
                            "lbl_private".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                CustomTextStyles.bodyLargeHindSiliguriIndigo900,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 30,
                          ),
                          child: Obx(
                            () => CustomRadioButton(
                              text: "lbl_secret".tr,
                              iconSize: getHorizontalSize(
                                12,
                              ),
                              value: "lbl_secret".tr,
                              groupValue: controller.radioGroup.value,
                              margin: getMargin(
                                left: 30,
                              ),
                              textStyle: CustomTextStyles
                                  .bodyLargeHindSiliguriIndigo900,
                              onChange: (value) {
                                controller.radioGroup.value = value;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 3,
                      top: 21,
                    ),
                    child: Text(
                      "lbl_tags".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleSmallHindSiliguriBluegray300,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 14,
                    ),
                    child: Obx(
                      () => Wrap(
                        runSpacing: getVerticalSize(
                          5,
                        ),
                        spacing: getHorizontalSize(
                          5,
                        ),
                        children: List<Widget>.generate(
                          controller.addTaskModelObj.value
                              .chipviewgroupfoItemList.value.length,
                          (index) {
                            ChipviewgroupfoItemModel model = controller
                                .addTaskModelObj
                                .value
                                .chipviewgroupfoItemList
                                .value[index];

                            return ChipviewgroupfoItemWidget(
                              model,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        top: 15,
                      ),
                      child: Text(
                        "lbl_add_new_tag".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.labelLargeHindSiliguriIndigo200,
                      ),
                    ),
                  ),
                  CustomElevatedButton(
                    onTap: (){
                      Get.toNamed(AppRoutes.viewAllTaskTabContainerScreen);
                    },
                    text: "lbl_create".tr,
                    margin: getMargin(
                      top: 37,
                    ),
                    buttonStyle: CustomButtonStyles.outlineGray10001.copyWith(
                        fixedSize: MaterialStateProperty.all<Size>(Size(
                      double.maxFinite,
                      getVerticalSize(
                        56,
                      ),
                    ))),
                    buttonTextStyle:
                        CustomTextStyles.titleMediumHindSiliguriWhiteA70001,
                  ),
                  Padding(
                    padding: getPadding(
                      left: 6,
                      top: 164,
                      right: 6,
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
                          items: controller
                              .addTaskModelObj.value.dropdownItemList.value,
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
                      left: 6,
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
