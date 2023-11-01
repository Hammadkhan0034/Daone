import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/text_widget.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_2.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/personal_data_update_two_controller.dart';

class PersonalDataUpdateTwoScreen extends GetWidget<PersonalDataUpdateTwoController> {
  PersonalDataUpdateTwoScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(81),
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
            text: "lbl_personal_data".tr,
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: getPadding(top: 16),
            child: Padding(
              padding: getPadding(left: 30, right: 29),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(() => Column(
                    children: [
                      InkWell(
                        onTap: (){
                          controller.getImage();
                        },
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.black54,
                            image: (controller.imagePath.isEmpty && controller.imageUrl.isEmpty)
                                ? DecorationImage(
                              image: AssetImage('assets/images/profile (2).png'),
                              fit: BoxFit.cover,
                            )
                                : (controller.imagePath.isEmpty)
                                ? DecorationImage(
                              image: NetworkImage(controller.imageUrl.value),
                              fit: BoxFit.cover,
                            )
                                : DecorationImage(
                              image: FileImage(File(controller.imagePath.value)),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
                                padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                              ),
                              onPressed: () {
                                controller.getImage();
                              },
                              child: TextWidget(text: "Pick Image", color: Colors.white, fsize: 12),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
                                padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                              ),
                              onPressed: () {
                                controller.uploadImageToFirestore(File(controller.imagePath.value), FirebaseAuth.instance.currentUser!.uid);
                              },
                              child: TextWidget(text: "Save Image", color: Colors.white, fsize: 12),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
                  CustomTextFormField(
                    controller: controller.lastnameController,
                    margin: getMargin(top: 40),
                    contentPadding: getPadding(top: 15, right: 30, bottom: 15),
                    textStyle: CustomTextStyles.bodySmallGray50005,
                    hintText: "lbl_stefani".tr,
                    hintStyle: CustomTextStyles.bodySmallGray50005,
                    textInputAction: TextInputAction.next,
                    prefix: Container(
                      margin: getMargin(left: 15, top: 15, right: 10, bottom: 15),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgIconlyLightoutlineProfileGray60005,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(48),
                    ),
                    filled: true,
                    fillColor: appTheme.gray50,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Last name is required"; // Add other validation logic as needed
                      }
                      return null; // Return null if validation is successful
                    },
                  ),
                  CustomTextFormField(
                    controller: controller.phonenumberController,
                    margin: getMargin(top: 17),
                    contentPadding: getPadding(top: 15, right: 30, bottom: 15),
                    textStyle: CustomTextStyles.bodySmallGray50005,
                    hintText: "lbl_92_687_4874".tr,
                    hintStyle: CustomTextStyles.bodySmallGray50005,
                    textInputAction: TextInputAction.next,
                    prefix: Container(
                      margin: getMargin(left: 16, top: 16, right: 11, bottom: 16),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgCall,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(48),
                    ),
                    filled: true,
                    fillColor: appTheme.gray50,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Phone number is required"; // Add other validation logic as needed
                      }
                      // You can add more specific validation for phone numbers here
                      return null; // Return null if validation is successful
                    },
                  ),
                  CustomElevatedButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        controller.updateDocumentFields(controller.phonenumberController.text, controller.lastnameController.text);
                      }
                    },
                    width: getHorizontalSize(315),
                    height: getVerticalSize(60),
                    text: "lbl_update".tr,
                    margin: getMargin(top: 62),
                    buttonStyle: CustomButtonStyles.gradientnamedeeporangeA20006nameprimary
                        .copyWith(fixedSize: MaterialStateProperty.all<Size>(Size(double.maxFinite, getVerticalSize(60)))),
                    decoration: CustomButtonStyles.gradientnamedeeporangeA20006nameprimaryDecoration,
                    buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
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
