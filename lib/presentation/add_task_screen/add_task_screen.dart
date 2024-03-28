import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:daone/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'controller/add_task_controller.dart';

class AddTaskScreen extends GetWidget<AddTaskController> {
  String taskType;

  AddTaskScreen({Key? key, required this.taskType})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    controller.selectedValue.value = taskType;
    GlobalKey<FormState> _key = GlobalKey<FormState>();
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.whiteA700,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Add Tasks',
              style: TextStyle(
                  fontFamily: 'Gotham Light',
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                  color: Colors.black)),
          leadingWidth: 68,
          leading: AppbarIconbutton(
            onTap: () {
              controller.group216Controller.clear();
              controller.descriptionController.clear();
              Get.back();
            },
            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              left: 10,
              top: 10,
              bottom: 5,
            ),
          ),
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: Padding(
            padding: getPadding(left: 24, right: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.03),
                  Padding(
                    padding: getPadding(left: 6),
                    child: Text(
                      "Task Type",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Gotham Light',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(left: 6, top: 10, bottom: 20),
                    child: Text(
                      taskType ?? '',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Gotham Light',
                          fontWeight: FontWeight.w800,
                          color: Colors.deepOrange,
                          fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: getPadding(left: 6),
                    child: Text(
                      "Task Title",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Gotham Light',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  CustomTextFormField(
                    // focusNode: controller.titleFocusNode,
                    textInputType: TextInputType.text,
                    controller: controller.group216Controller,
                    margin: getMargin(left: 6, top: 9, right: 6),
                    textStyle:
                        CustomTextStyles.titleMediumHindSiliguriIndigo90001,
                    hintText: "Title",
                    hintStyle: TextStyle(
                        fontFamily: 'Gotham Light',
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
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
                    padding: getPadding(left: 6, top: 18),
                    child: Text(
                      "lbl_date".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Gotham Light',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding: getPadding(left: 6, top: 7, right: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: getPadding(top: 3),
                            child: Text(
                                controller.selectedDate.value != null
                                    ? DateFormat('dd-MMM-yyyy')
                                        .format(controller.selectedDate.value!)
                                    : 'No date selected',
                                //DateFormat('dd-MM-yyyy').format(DateTime.now()),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'Gotham Light',
                                    fontWeight: FontWeight.w800)),
                          ),
                          CustomImageView(
                            svgPath: ImageConstant.imgCalendarIndigo200,
                            height: getSize(20),
                            width: getSize(20),
                            margin: getMargin(bottom: 9),
                            onTap: () {
                              controller.selectDate(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 10),
                    child: Divider(
                      height: getVerticalSize(1),
                      thickness: getVerticalSize(1),
                      color: appTheme.indigo50,
                      indent: getHorizontalSize(6),
                      endIndent: getHorizontalSize(6),
                    ),
                  ),
                  Padding(
                    padding: getPadding(left: 6, top: 23),
                    child: Text(
                      "lbl_description".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Gotham Light',
                          fontWeight: FontWeight.w800,
                          color: Colors.black45),
                    ),
                  ),
                  CustomTextFormField(
                    textInputType: TextInputType.multiline,
                    // focusNode: controller.descriptionFocusNode,
                    maxLines: 3,
                    controller: controller.descriptionController,
                    margin: getMargin(left: 6, top: 9, right: 6),
                    textStyle:
                        CustomTextStyles.titleMediumHindSiliguriIndigo90001,
                    hintText: "Write Description here",
                    hintStyle: TextStyle(
                        fontFamily: 'Gotham Light',
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                    defaultBorderDecoration:
                        TextFormFieldStyleHelper.underLineIndigo50,
                    enabledBorderDecoration:
                        TextFormFieldStyleHelper.underLineIndigo50,
                    focusedBorderDecoration:
                        TextFormFieldStyleHelper.underLineIndigo50,
                    disabledBorderDecoration:
                        TextFormFieldStyleHelper.underLineIndigo50,
                  ),
                  SizedBox(height: Get.height * 0.03),
                  CustomElevatedButton(
                    key: const Key('create_button'),
                    onTap: () {
                      if (controller.group216Controller.text
                              .trim()
                              .isNotEmpty &&
                          controller.descriptionController.text
                              .trim()
                              .isNotEmpty) {
                        controller.saveTaskToFirestore(
                            context,
                            controller.group216Controller.text.trim(),
                            controller.descriptionController.text.trim());
                        controller.group216Controller.clear();
                        controller.descriptionController.clear();
                      } else {
                        Get.snackbar("Error", "Please Fill All Fields");
                      }
                    },
                    text: "lbl_create".tr,
                    margin: getMargin(top: 37),
                    buttonStyle: CustomButtonStyles.outlineGray10001.copyWith(
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(
                          double.maxFinite,
                          getVerticalSize(56),
                        ),
                      ),
                    ),
                    buttonTextStyle:
                        CustomTextStyles.titleMediumHindSiliguriWhiteA70001,
                  ),
                  SizedBox(height: Get.height * 0.03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
