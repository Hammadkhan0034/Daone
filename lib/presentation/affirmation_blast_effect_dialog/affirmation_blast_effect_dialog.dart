import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/presentation/love_affirmation/controller/love_affirmation_controller.dart';
import 'package:google_fonts/google_fonts.dart';

import '../edit_affirmation_dialog/controller/edit_affirmation_controller.dart';
import '../edit_affirmation_dialog/edit_affirmation_dialog.dart';
import 'controller/affirmation_blast_effect_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';



class AffirmationBlastEffectDialog extends StatelessWidget {
  DecorationImage decorationImage;
      var loveaffirmationText,documentId;

  AffirmationBlastEffectDialog(
      this.controller, {required this.decorationImage,required this.loveaffirmationText,required this.documentId,
        Key? key,
      }) : super(
    key: key,
  );

  LoveAffirmationController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return  Container(
      width: getHorizontalSize(
        318,
      ),
      padding: getPadding(
        left: 21,
        top: 24,
        right: 21,
        bottom: 24,
      ),
      decoration: AppDecoration.fill.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder22,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: getVerticalSize(
              238,
            ),
            width: getHorizontalSize(
              269,
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: decorationImage,
                  ),
                  alignment: Alignment.center,
                  height: getVerticalSize(238),
                  width: getHorizontalSize(269),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: getHorizontalSize(
                      219,
                    ),
                    margin: getMargin(
                      top: 45,
                    ),
                    child: Text(
                      loveaffirmationText,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 23,
                        color:Color(0xff5E4646),fontWeight:FontWeight.w300,),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              left: 3,
              top: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    onTap: () {
                      Get.toNamed(AppRoutes.selectAffirmationScreen);
                    },

                    text: "lbl_select".tr,
                    margin: getMargin(
                      right: 4,
                    ),
                    buttonStyle: CustomButtonStyles.fillGreen300.copyWith(
                        fixedSize: MaterialStateProperty.all<Size>(Size(
                          double.maxFinite,
                          getVerticalSize(
                            40,
                          ),
                        ))),
                    buttonTextStyle: CustomTextStyles.bodyMediumWhiteA700,
                  ),
                ),
                Expanded(
                  child: CustomElevatedButton(
                    onTap: (){
                      Get.dialog(AlertDialog(backgroundColor: Colors.transparent,
                        contentPadding: EdgeInsets.zero,
                        insetPadding: const EdgeInsets.only(left: 0),
                        content:EditAffirmationDialog(Get.put(EditAffirmationController(),),),));
                    },
                    text: "lbl_add_new".tr,
                    margin: getMargin(
                      left: 4,
                    ),
                    buttonStyle: CustomButtonStyles.fillGray90003.copyWith(
                        fixedSize: MaterialStateProperty.all<Size>(Size(
                          double.maxFinite,
                          getVerticalSize(
                            40,
                          ),
                        ))),
                    buttonTextStyle: CustomTextStyles.bodyMediumWhiteA700,
                  ),
                ),
              ],
            ),
          ),
          Obx(()=>CustomElevatedButton(
              onTap: (){
                print("hello");
                // Increment the affirmationCount
                int currentCount = controller.affirmationCount.value;
                int newCount = currentCount + 1;

                controller.updateAffirmationCount(newCount);
                // Update the Firestore document
                FirebaseFirestore.instance
                    .collection('loveAffirmations')
                    .doc(documentId) // Use the document ID to reference the specific document
                    .update({'affirmationCount': newCount})
                    .then((_) {
                  // Document updated successfully
                  print('AffirmationCount updated successfully');
                }).catchError((error) {
                  // Handle errors if the update fails
                  print('Error updating AffirmationCount: $error');
                });
              },
              text: controller.affirmationCount.string,
              margin: getMargin(
                top: 19,
                right: 6,
              ),
              buttonStyle: CustomButtonStyles.radiusTL28.copyWith(
                  fixedSize: MaterialStateProperty.all<Size>(Size(
                    double.maxFinite,
                    getVerticalSize(
                      57,
                    ),
                  ))),
              buttonTextStyle: CustomTextStyles.titleMediumWhiteA700Medium_2,
            ),
          ),
        ],
      ),
    );
  }
}
// Container(
// width: getHorizontalSize(
// 318,
// ),
// padding: getPadding(
// left: 21,
// top: 1,
// right: 21,
// bottom: 1,
// ),
// decoration: AppDecoration.fill.copyWith(
// borderRadius: BorderRadiusStyle.roundedBorder22,
// ),
// child: Column(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// SizedBox(
// height: getVerticalSize(
// 261,
// ),
// width: getHorizontalSize(
// 269,
// ),
// child: Stack(
// alignment: Alignment.topLeft,
// children: [
// Align(
// alignment: Alignment.bottomCenter,
// child: SizedBox(
// height: getVerticalSize(
// 238,
// ),
// width: getHorizontalSize(
// 269,
// ),
// child: Stack(
// alignment: Alignment.bottomCenter,
// children: [
// CustomImageView(
// imagePath: ImageConstant.imgRectangle11,
// height: getVerticalSize(
// 238,
// ),
// width: getHorizontalSize(
// 269,
// ),
// radius: BorderRadius.circular(
// getHorizontalSize(
// 15,
// ),
// ),
// alignment: Alignment.center,
// ),
// Align(
// alignment: Alignment.bottomCenter,
// child: Container(
// height: getVerticalSize(
// 173,
// ),
// width: getHorizontalSize(
// 256,
// ),
// margin: getMargin(
// bottom: 19,
// ),
// child: Stack(
// alignment: Alignment.bottomRight,
// children: [
// Align(
// alignment: Alignment.topCenter,
// child: SizedBox(
// width: getHorizontalSize(
// 219,
// ),
// child: Text(
// "msg_i_deserve_to_experience".tr,
// maxLines: 4,
// overflow: TextOverflow.ellipsis,
// textAlign: TextAlign.center,
// style: theme.textTheme.headlineMedium,
// ),
// ),
// ),
// CustomImageView(
// svgPath: ImageConstant.imgLayer1,
// height: getVerticalSize(
// 110,
// ),
// width: getHorizontalSize(
// 116,
// ),
// alignment: Alignment.bottomRight,
// margin: getMargin(
// bottom: 1,
// ),
// ),
// CustomImageView(
// svgPath: ImageConstant.imgLayer1LightGreen700,
// height: getVerticalSize(
// 126,
// ),
// width: getHorizontalSize(
// 128,
// ),
// alignment: Alignment.bottomLeft,
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// CustomImageView(
// svgPath: ImageConstant.imgLayer1DeepOrange600,
// height: getVerticalSize(
// 110,
// ),
// width: getHorizontalSize(
// 119,
// ),
// alignment: Alignment.topLeft,
// margin: getMargin(
// left: 52,
// ),
// ),
// ],
// ),
// ),
// Padding(
// padding: getPadding(
// left: 3,
// top: 20,
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Expanded(
// child: CustomElevatedButton(
// onTap: () {
// Get.toNamed(AppRoutes.selectAffirmationScreen);
// },
// text: "lbl_select".tr,
// margin: getMargin(
// right: 4,
// ),
// buttonStyle: CustomButtonStyles.fillGreen300.copyWith(
// fixedSize: MaterialStateProperty.all<Size>(Size(
// double.maxFinite,
// getVerticalSize(
// 40,
// ),
// ))),
// buttonTextStyle: CustomTextStyles.bodyMediumWhiteA700,
// ),
// ),
// Expanded(
// child: CustomElevatedButton(
// onTap: (){
// Get.dialog(AlertDialog(backgroundColor: Colors.transparent,
// contentPadding: EdgeInsets.zero,
// insetPadding: const EdgeInsets.only(left: 0),
// content:EditAffirmationDialog(Get.put(EditAffirmationController(),),),));
// },
// text: "lbl_add_new".tr,
// margin: getMargin(
// left: 4,
// ),
// buttonStyle: CustomButtonStyles.fillGray90003.copyWith(
// fixedSize: MaterialStateProperty.all<Size>(Size(
// double.maxFinite,
// getVerticalSize(
// 40,
// ),
// ))),
// buttonTextStyle: CustomTextStyles.bodyMediumWhiteA700,
// ),
// ),
// ],
// ),
// ),
// CustomElevatedButton(
// text: "msg_blast_affirmation".tr,
// margin: getMargin(
// top: 19,
// right: 6,
// bottom: 23,
// ),
// buttonStyle: CustomButtonStyles.radiusTL28.copyWith(
// fixedSize: MaterialStateProperty.all<Size>(Size(
// double.maxFinite,
// getVerticalSize(
// 57,
// ),
// ))),
// buttonTextStyle: CustomTextStyles.titleMediumWhiteA700Medium_2,
// ),
// ],
// ),
// );