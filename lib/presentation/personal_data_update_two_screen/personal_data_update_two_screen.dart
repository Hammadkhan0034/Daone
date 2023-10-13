import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'controller/personal_data_update_two_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/core/utils/validation_functions.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/appbar_image.dart';
import 'package:daone/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_bottom_bar.dart';
import 'package:daone/widgets/custom_drop_down.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:daone/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class PersonalDataUpdateTwoScreen
    extends GetWidget<PersonalDataUpdateTwoController> {
  PersonalDataUpdateTwoScreen({Key? key})
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
            text: "lbl_personal_data".tr,
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
                  Obx(() =>
                  Column(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.deepOrange,
                          image: controller.imagePath != null && controller.imagePath.isNotEmpty
                              ? DecorationImage(
                            image: FileImage(File(controller.imagePath.value)),
                            fit: BoxFit.cover,
                          )
                              : DecorationImage(image: AssetImage('assets/images/profile (2).png'),fit: BoxFit.cover),
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
                                backgroundColor: MaterialStateProperty.all(Colors.deepOrange), // Background color
                                textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)), // Text color
                                padding: MaterialStateProperty.all(EdgeInsets.all(12)), // Padding
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20), // Rounded corners
                                )),
                              ),
                              onPressed: () {
                                controller.getImage();
                              },
                              child: TextWidget(text: "Pick Image",color: Colors.white, fsize: 12),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.deepOrange), // Background color
                                textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)), // Text color
                                padding: MaterialStateProperty.all(EdgeInsets.all(12)), // Padding
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20), // Rounded corners
                                )),
                              ),
                              onPressed: () {
                               controller.uploadImageToFirestore(File(controller.imagePath.value), FirebaseAuth.instance.currentUser!.uid);
                              },
                              child: TextWidget(text: "Save Image",color: Colors.white, fsize: 12),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  ),
                  //
                  // StreamBuilder(
                  //   stream: FirebaseFirestore.instance.collection('users').doc(controller.user?.uid).snapshots(),
                  //   builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       // While the data is being fetched, you can return a loading indicator or an empty widget.
                  //       return CircularProgressIndicator(); // Replace with your loading indicator widget
                  //     }
                  //
                  //     if (snapshot.hasError) {
                  //       // Handle errors here
                  //       return Text('Error: ${snapshot.error}');
                  //     }
                  //
                  //     if (!snapshot.hasData || !snapshot.data!.exists) {
                  //       // Handle the case where the document doesn't exist
                  //       return Text('Document not found');
                  //     }
                  //
                  //     // Access the 'fullName' field from the document data
                  //     String fullName = snapshot.data!['fullName'];
                  //
                  //     return Padding(
                  //       padding: getPadding(
                  //         top: 1,
                  //       ),
                  //       child: Text(
                  //         fullName,
                  //         overflow: TextOverflow.ellipsis,
                  //         textAlign: TextAlign.left,
                  //         style: CustomTextStyles.titleSmallPoppinsGray90002_1,
                  //       ),
                  //     );
                  //   },
                  // ),
                   CustomTextFormField(
                    controller: controller.lastnameController,
                    margin: getMargin(
                      top: 40,
                    ),
                    contentPadding: getPadding(
                      top: 15,
                      right: 30,
                      bottom: 15,
                    ),
                    textStyle: CustomTextStyles.bodySmallGray50005,
                    hintText: "lbl_stefani".tr,
                    hintStyle: CustomTextStyles.bodySmallGray50005,
                    textInputAction: TextInputAction.next,
                    prefix: Container(
                      margin: getMargin(
                        left: 15,
                        top: 15,
                        right: 10,
                        bottom: 15,
                      ),
                      child: CustomImageView(
                        svgPath:
                            ImageConstant.imgIconlyLightoutlineProfileGray60005,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(
                        48,
                      ),
                    ),
                    filled: true,
                    fillColor: appTheme.gray50,
                  ),
                  CustomTextFormField(
                    controller: controller.phonenumberController,
                    margin: getMargin(
                      top: 17,
                    ),
                    contentPadding: getPadding(
                      top: 15,
                      right: 30,
                      bottom: 15,
                    ),
                    textStyle: CustomTextStyles.bodySmallGray50005,
                    hintText: "lbl_92_687_4874".tr,
                    hintStyle: CustomTextStyles.bodySmallGray50005,
                    textInputAction: TextInputAction.next,
                    prefix: Container(
                      margin: getMargin(
                        left: 16,
                        top: 16,
                        right: 11,
                        bottom: 16,
                      ),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgCall,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(
                        48,
                      ),
                    ),
                    filled: true,
                    fillColor: appTheme.gray50,
                  ),


                  CustomElevatedButton(
                    onTap: (){
                      controller.updateDocumentFields(controller.phonenumberController.text,controller.lastnameController.text);
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
