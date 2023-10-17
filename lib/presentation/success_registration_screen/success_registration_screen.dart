import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'controller/success_registration_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SuccessRegistrationScreen
    extends GetWidget<SuccessRegistrationController> {
  const SuccessRegistrationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 48,
            top: 102,
            right: 48,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgGroupDeepOrangeA20006,
                height: getVerticalSize(
                  304,
                ),
                width: getHorizontalSize(
                  277,
                ),
              ),
              SizedBox(height: Get.height*0.02),
              Padding(
                padding: getPadding(
                  top: 12,
                  bottom: 21,
                ),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).snapshots(),
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
                      child:TextWidget(text:"Welcome, $fullName", color:Colors.black, fsize:20,font: FontWeight.w600,),
                    );
                  },
                ),
              ),
              Container(
                width: getHorizontalSize(
                  210,
                ),
                margin: getMargin(
                  left: 33,
                  top: 5,
                  right: 34,
                  bottom: 5,
                ),
                child: Text(
                  "msg_you_are_all_set".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodySmallGray60005,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomElevatedButton(
          onTap: (){
            Get.offAndToNamed(AppRoutes.dashboardRoute);
          },
          width: getHorizontalSize(
            315,
          ),
          height: getVerticalSize(
            57,
          ),
          text: "lbl_go_to_home".tr,
          margin: getMargin(
            left: 30,
            right: 30,
            bottom: 43,
          ),
          buttonStyle: CustomButtonStyles.outlineIndigoA1004c.copyWith(
              fixedSize: MaterialStateProperty.all<Size>(Size(
            double.maxFinite,
            getVerticalSize(
              57,
            ),
          ))),
          decoration: CustomButtonStyles.outlineIndigoA1004cDecoration,
          buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
        ),
      ),
    );
  }
}
