import 'package:daone/widgets/text_widget.dart';
import 'package:intl/intl.dart';

import 'controller/add_task_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:daone/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

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
                      "Select Task Type",
                      // "lbl_task_description".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleSmallHindSiliguriBluegray300,
                    ),
                  ),
                  Obx(() =>  DropdownButton<String>(
                    padding: EdgeInsets.all(5),
                    hint: TextWidget(text: "Select", color:Colors.black, fsize: 12),
                    dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down_outlined,size: 28),
                    //  icon: Image.asset("assets/images/addtask.png",scale: 22,),
                    style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.w400,fontSize: 15),
                    borderRadius: BorderRadius.circular(12),
                    elevation: 2,
                    value: controller.selectedValue.value,
                    items: controller.items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Update the selected item using GetX.
                      controller.selectedValue.value = newValue!;
                    },

                  ), ),
                  Padding(
                    padding: getPadding(
                      left: 6,
                    ),
                    child: Text(
                      "Task Title",
                      // "lbl_task_description".tr,
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
                    hintText: "Title",
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
                            DateFormat('dd-MM-yyyy').format(DateTime.now()),
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
                  CustomTextFormField(
                    controller: controller.descriptionController,
                    margin: getMargin(
                      left: 6,
                      top: 9,
                      right: 6,
                    ),
                    textStyle:
                    CustomTextStyles.titleMediumHindSiliguriIndigo90001,
                    hintText:"Write Description here",
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
                   SizedBox(height: Get.height*0.03,),
                  CustomElevatedButton(
                    onTap: (){
                      controller.saveTaskToFirestore(context,controller.group216Controller.text.trim(),controller.descriptionController.text.trim());

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
