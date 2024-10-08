import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/gratitude_affirmation/controller/gartitude_affirmation_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/size_utils.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../edit_affirmation_dialog/controller/edit_affirmation_controller.dart';
import '../../edit_affirmation_dialog/edit_affirmation_dialog.dart';
import '../../own_affirmation_screen/controller/own_affirmation_controller.dart';

class GratitudeAffirmationBlastEffectDialog extends StatelessWidget {
  DecorationImage decorationImage;
  var graditudeAffirmationText, documentId,currentAffirmationCount;

  GratitudeAffirmationBlastEffectDialog(
    this.controller, {
    required this.decorationImage,
    required this.graditudeAffirmationText,
    required this.documentId,
        required this.currentAffirmationCount,
    Key? key,
  }) : super(
          key: key,
        );
  GratitudeAffirmationController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    OwnAffirmationController controller2 = Get.put(OwnAffirmationController());
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: getHorizontalSize(
            Get.width,
          ),
          height: getVerticalSize(Get.height*0.85),
          padding: getPadding(
            left: 21,
            top: 24,
            right: 21,
            bottom: 24,
          ),
          decoration: AppDecoration.outline16.copyWith(
            borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)),

            // borderRadius: BorderRadiusStyle.roundedBorder22,
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
                          graditudeAffirmationText ?? "",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 23,
                            color: Color(0xff5E4646),
                            fontWeight: FontWeight.w300,
                          ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: Get.width*0.3,
                      height: 52,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black)
                        ,
                        borderRadius: BorderRadius.circular(10)
                        ,),
                      child: TextButton(
                            onPressed: (){
                        Get.toNamed(AppRoutes.selectAffirmationScreen);
                      },
                        child: Text("lbl_select".tr, style: TextStyle(color: Colors.black,fontSize: 20,),),),
                    ),
                    Container(
                      width: Get.width*0.3,
                      height: 52,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black)
                        ,
                        borderRadius: BorderRadius.circular(10)
                        ,),
                      child: TextButton(
                            onPressed: (){
                              Get.to(()=>EditAffirmationScreen(
                                // Get.put(
                                //   EditAffirmationController(),
                                // ),
                              ));
                      },
                        child: Text("lbl_add_new".tr, style: TextStyle(color: Colors.black,fontSize: 20,),),),
                    ),
                    // CustomElevatedButton(
                    //   onTap: () {
                    //     Get.to(()=>EditAffirmationScreen(
                    //       // Get.put(
                    //       //   EditAffirmationController(),
                    //       // ),
                    //     ));
                    //   },
                    //   text: "lbl_add_new".tr,
                    //   margin: getMargin(
                    //     left: 4,
                    //   ),
                    //   buttonStyle: CustomButtonStyles.fillGray90003.copyWith(
                    //       fixedSize: MaterialStateProperty.all<Size>(Size(
                    //     double.maxFinite,
                    //     getVerticalSize(
                    //       40,
                    //     ),
                    //   ))),
                    //   buttonTextStyle: CustomTextStyles.bodyMediumWhiteA700,
                    // ),
                  ],
                ),
              ),
              CustomElevatedButton(
                  onTap: () {
                    OwnAffirmationController controller2 = Get.put(OwnAffirmationController());
                    controller2.playAudioFromAsset('1.mp3');
                    controller2.playConfetti();
                    print("hello");
                    // Increment the affirmationCount
                    int currentCount = currentAffirmationCount;
                    int newCount = currentCount + 1;

                    controller.updateAffirmationCount(newCount);
                    // Update the Firestore document
                    FirebaseFirestore.instance
                        .collection('GraditudeAffirmations')
                        .doc(
                            documentId) // Use the document ID to reference the specific document
                        .update({'AffirmationCount': newCount}).then((_) {
                      // Document updated successfully
                      print('AffirmationCount updated successfully');
                    }).catchError((error) {
                      // Handle errors if the update fails
                      print('Error updating AffirmationCount: $error');
                    });
                  },
                  text: 'Blast Affirmation',
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
                  buttonTextStyle:
                      CustomTextStyles.titleMediumWhiteA700Medium_2,
                ),

            ],
          ),
        ),
        ConfettiWidget(
          confettiController: controller2.confettiController,
          blastDirection: -pi / 2,
          emissionFrequency: 0.05,
          numberOfParticles: 20,
          gravity: 0.2,
          shouldLoop: false,
          colors: [Colors.red, Colors.green, Colors.blue],
        ),
      ],
    );
  }
}


