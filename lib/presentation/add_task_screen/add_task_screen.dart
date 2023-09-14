import 'package:daone/presentation/add_task_pop_up_calender_dialog/add_task_pop_up_calender_dialog.dart';
import 'package:daone/presentation/add_task_pop_up_calender_dialog/controller/add_task_pop_up_calender_controller.dart';

import '../../widgets/text_widget.dart';
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
                      "lbl_task_description".tr,
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
                  SizedBox(height: Get.height*0.03,),
                  Container(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Align(
                            child:Image.asset(ImageConstant.doubleQuotation,scale: 4.8,) ,
                            alignment: Alignment.topLeft,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Align(
                            child:Image.asset(ImageConstant.doubleQuotation2,scale: 4.8,) ,
                            alignment: Alignment.bottomRight,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Align(
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextWidget(text:"Every day is a new opportunity for growth and success.",
                                  color:Color(0xff121355),fsize: 12, ),
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                      ],
                    ),
                      width:Get.width*0.85,
                      height: Get.height*0.23,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0x3fffe4e4)),
                  ),
                  CustomElevatedButton(
                    onTap: (){
                      Get.dialog(AlertDialog(backgroundColor: Colors.transparent,
                        contentPadding: EdgeInsets.zero,
                        insetPadding: const EdgeInsets.only(left: 0),
                        content:AddTaskPopUpCalenderDialog(Get.put(AddTaskPopUpCalenderController(),),),));
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
                  SizedBox(height: Get.height*0.03,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
