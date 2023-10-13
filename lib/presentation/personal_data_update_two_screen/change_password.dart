





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_subtitle_2.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/personal_data_update_two_controller.dart';

class PasswordUpdateScreen
    extends GetWidget<PersonalDataUpdateTwoController> {
  PasswordUpdateScreen({Key? key})
      : super(
    key: key,
  );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            81,
          ),
          leadingWidth: 77,
          leading: AppbarIconbutton(
            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              left: 29,
              top: 4,
              bottom: 4,
            ),
          ),
          centerTitle: true,
          title: AppbarSubtitle2(
            text: "Update Password",
          ),

        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 16,
            ),
            child: Padding(
              padding: getPadding(
                left: 30,
                right: 29,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height*0.03,
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgUntit11,
                    height: getSize(
                      78,
                    ),
                    width: getSize(
                      78,
                    ),
                  ),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('users').doc(controller.user?.uid).snapshots(),
                    builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // While the data is being fetched, you can return a loading indicator or an empty widget.
                        return CircularProgressIndicator(); // Replace with your loading indicator widget
                      }

                      if (snapshot.hasError) {
                        // Handle errors here
                        return Text('Error: ${snapshot.error}');
                      }

                      if (!snapshot.hasData || !snapshot.data!.exists) {
                        // Handle the case where the document doesn't exist
                        return Text('Document not found');
                      }

                      // Access the 'fullName' field from the document data
                      String fullName = snapshot.data!['fullName'];

                      return Padding(
                        padding: getPadding(
                          top: 1,
                        ),
                        child: Text(
                          fullName,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: CustomTextStyles.titleSmallPoppinsGray90002_1,
                        ),
                      );
                    },
                  ),
                SizedBox(
                  height: Get.height*0.03,
                ),
                  // CustomTextFormField(
                  //   controller: controller.emailController,
                  //   margin: getMargin(
                  //     top: 17,
                  //   ),
                  //   contentPadding: getPadding(
                  //     top: 15,
                  //     right: 30,
                  //     bottom: 15,
                  //   ),
                  //   textStyle: CustomTextStyles.bodySmallGray50005,
                  //   hintText: "msg_stefaniyes_gmail_com".tr,
                  //   hintStyle: CustomTextStyles.bodySmallGray50005,
                  //   textInputAction: TextInputAction.next,
                  //   textInputType: TextInputType.emailAddress,
                  //   prefix: Container(
                  //     margin: getMargin(
                  //       left: 15,
                  //       top: 15,
                  //       right: 10,
                  //       bottom: 15,
                  //     ),
                  //     child: CustomImageView(
                  //       svgPath: ImageConstant.imgIconlyLightMessage,
                  //     ),
                  //   ),
                  //   prefixConstraints: BoxConstraints(
                  //     maxHeight: getVerticalSize(
                  //       48,
                  //     ),
                  //   ),
                  //   validator: (value) {
                  //     if (value == null ||
                  //         (!isValidEmail(value, isRequired: true))) {
                  //       return "Please enter valid email";
                  //     }
                  //     return null;
                  //   },
                  //   filled: true,
                  //   fillColor: appTheme.gray50,
                  // ),
                  Obx(
                        () => CustomTextFormField(
                      controller: controller.passwordController,
                      margin: getMargin(
                        top: 17,
                      ),
                      contentPadding: getPadding(
                        top: 15,
                        bottom: 15,
                      ),
                      textStyle: CustomTextStyles.bodySmallGray50005,
                      hintText: "msg_enter_your_current".tr,
                      hintStyle: CustomTextStyles.bodySmallGray50005,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.visiblePassword,
                      prefix: Container(
                        margin: getMargin(
                          left: 15,
                          top: 15,
                          right: 10,
                          bottom: 15,
                        ),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgLock,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(
                        maxHeight: getVerticalSize(
                          48,
                        ),
                      ),
                      suffix: InkWell(
                        onTap: () {
                          controller.isShowPassword.value =
                          !controller.isShowPassword.value;
                        },
                        child: Container(
                          margin: getMargin(
                            left: 12,
                            top: 15,
                            right: 15,
                            bottom: 15,
                          ),
                          child: CustomImageView(
                            svgPath: controller.isShowPassword.value
                                ? ImageConstant.imgArrowleft
                                : ImageConstant.imgArrowleft,
                          ),
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: getVerticalSize(
                          48,
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            (!isValidPassword(value, isRequired: true))) {
                          return "Please enter valid password";
                        }
                        return null;
                      },
                      obscureText: controller.isShowPassword.value,
                      filled: true,
                      fillColor: appTheme.gray50,
                    ),
                  ),
                  Obx(
                        () => CustomTextFormField(
                      controller: controller.newpasswordController,
                      margin: getMargin(
                        top: 17,
                      ),
                      contentPadding: getPadding(
                        top: 15,
                        bottom: 15,
                      ),
                      textStyle: CustomTextStyles.bodySmallGray50005,
                      hintText: "msg_enter_your_new_password".tr,
                      hintStyle: CustomTextStyles.bodySmallGray50005,
                      textInputType: TextInputType.visiblePassword,
                      prefix: Container(
                        margin: getMargin(
                          left: 15,
                          top: 15,
                          right: 10,
                          bottom: 15,
                        ),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgLock,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(
                        maxHeight: getVerticalSize(
                          48,
                        ),
                      ),
                      suffix: InkWell(
                        onTap: () {
                          controller.isShowPassword1.value =
                          !controller.isShowPassword1.value;
                        },
                        child: Container(
                          margin: getMargin(
                            left: 12,
                            top: 15,
                            right: 15,
                            bottom: 15,
                          ),
                          child: CustomImageView(
                            svgPath: controller.isShowPassword1.value
                                ? ImageConstant.imgArrowleft
                                : ImageConstant.imgArrowleft,
                          ),
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: getVerticalSize(
                          48,
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            (!isValidPassword(value, isRequired: true))) {
                          return "Please enter valid password";
                        }
                        return null;
                      },
                      obscureText: controller.isShowPassword1.value,
                      filled: true,
                      fillColor: appTheme.gray50,
                    ),
                  ),
                  CustomElevatedButton(
                    onTap: (){
                      controller.updatePassword(controller.passwordController.text, controller.newpasswordController.text);
                    },
                    width: getHorizontalSize(
                      315,
                    ),
                    height: getVerticalSize(
                      60,
                    ),
                    text: "lbl_update".tr,
                    margin: getMargin(
                      top: 62,
                    ),
                    buttonStyle: CustomButtonStyles
                        .gradientnamedeeporangeA20006nameprimary
                        .copyWith(
                        fixedSize: MaterialStateProperty.all<Size>(Size(
                          double.maxFinite,
                          getVerticalSize(
                            60,
                          ),
                        ))),
                    decoration: CustomButtonStyles
                        .gradientnamedeeporangeA20006nameprimaryDecoration,
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