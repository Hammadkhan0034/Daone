



import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:daone/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../edit_affirmation_dialog/controller/edit_affirmation_controller.dart';
import '../../edit_affirmation_dialog/edit_affirmation_dialog.dart';
import '../controller/own_affirmation_controller.dart';

class OwnAffirmationBlastEffectDialog extends StatelessWidget {
  String decorationImage;
  var graditudeAffirmationText, documentId;
  var snapshotIndex;
  var affirmation;
  var affirmationCountPresent,currentAffirmationCount;


  OwnAffirmationBlastEffectDialog(
      this.controller, {

        required this.affirmationCountPresent,
        required this.affirmation,
        required this.snapshotIndex,
        required this.decorationImage,
        required this.graditudeAffirmationText,
        required this.documentId,
        required this.currentAffirmationCount,
        Key? key,
      }) : super(
    key: key,
  );
  OwnAffirmationController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    OwnAffirmationController controller2 = Get.put(OwnAffirmationController());

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
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
            borderRadius:
            BorderRadiusStyle.roundedBorder22,
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
                        borderRadius:
                        BorderRadius.circular(12),
                        image: DecorationImage(
                            image: NetworkImage(decorationImage )
                        ,fit: BoxFit.cover
                        ),
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
                          affirmation,
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
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        onTap: () {
                          Get.toNamed(AppRoutes
                              .selectAffirmationScreen);
                        },
                        text: "lbl_select".tr,
                        margin: getMargin(
                          right: 4,
                        ),
                        buttonStyle: CustomButtonStyles
                            .fillGreen300
                            .copyWith(
                            fixedSize:
                            MaterialStateProperty
                                .all<Size>(Size(
                              double.maxFinite,
                              getVerticalSize(
                                40,
                              ),
                            ))),
                        buttonTextStyle: CustomTextStyles
                            .bodyMediumWhiteA700,
                      ),
                    ),
                    Expanded(
                      child: CustomElevatedButton(
                        onTap: () {
                          Get.dialog(AlertDialog(
                            backgroundColor:
                            Colors.transparent,
                            contentPadding:
                            EdgeInsets.zero,
                            insetPadding:
                            const EdgeInsets.only(
                                left: 0),
                            content:
                            EditAffirmationDialog(
                              Get.put(
                                EditAffirmationController(),
                              ),
                            ),
                          ));
                        },
                        text: "lbl_add_new".tr,
                        margin: getMargin(
                          left: 4,
                        ),
                        buttonStyle: CustomButtonStyles
                            .fillGray90003
                            .copyWith(
                            fixedSize:
                            MaterialStateProperty
                                .all<Size>(Size(
                              double.maxFinite,
                              getVerticalSize(
                                40,
                              ),
                            ))),
                        buttonTextStyle: CustomTextStyles
                            .bodyMediumWhiteA700,
                      ),
                    ),
                  ],
                ),
              ),
              CustomElevatedButton(
                onTap: () {
                  controller.deleteAffirmation(snapshotIndex);
                  Get.back();
                },
                text: "Delete Affirmation".tr,
                margin: getMargin(
                  top: 19,
                  right: 6,
                ),
                buttonStyle: CustomButtonStyles.radiusTL28
                    .copyWith(
                    fixedSize: MaterialStateProperty
                        .all<Size>(Size(
                      double.maxFinite,
                      getVerticalSize(
                        57,
                      ),
                    ))),
                buttonTextStyle: CustomTextStyles
                    .titleMediumWhiteA700Medium_2,
              ),
           CustomElevatedButton(
                onTap:() async {
                  final user= FirebaseAuth.instance.currentUser;
                  controller.playAudioFromAsset('1.mp3');
                  controller.playConfetti();
                  int currentCount = currentAffirmationCount;
                  int newCount = currentCount + 1;

                  FirebaseFirestore.instance
                      .collection("users")
                      .doc(user?.email)
                      .collection('OwnAffirmationList')
                      .doc(documentId) // Use the document ID to reference the specific document
                      .update({
                    'affirmationCount': newCount
                  }).then((_) {
                    // Document updated successfully
                    print(
                        'AffirmationCount updated successfully');
                  }).catchError((error) {
                    // Handle errors if the update fails
                    print(
                        'Error updating AffirmationCount: $error');
                  });
                },
                text:  'Blast Affirmation',
                margin: getMargin(
                  top: 19,
                  right: 6,
                ),
                buttonStyle: CustomButtonStyles.radiusTL28
                    .copyWith(
                    fixedSize: MaterialStateProperty
                        .all<Size>(Size(
                      double.maxFinite,
                      getVerticalSize(
                        57,
                      ),
                    ))),
                buttonTextStyle: CustomTextStyles
                    .titleMediumWhiteA700Medium_2,
              ),
            ],
          ),
        ),
        ConfettiWidget(
          confettiController:
          controller.confettiController,
          blastDirection: -pi / 2,
          emissionFrequency: 0.05,
          numberOfParticles: 10,
          gravity: 0.2,
          shouldLoop: false,
          colors: [Colors.red, Colors.green, Colors.blue],
        ),
      ],
    );
  }
}
