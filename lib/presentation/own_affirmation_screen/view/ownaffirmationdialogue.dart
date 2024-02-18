import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';  // Import the CachedNetworkImage package
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:daone/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:daone/widgets/custom_elevated_button.dart';

import '../../../widgets/text_widget.dart';
import '../../edit_affirmation_dialog/controller/edit_affirmation_controller.dart';
import '../../edit_affirmation_dialog/edit_affirmation_dialog.dart';
import '../controller/own_affirmation_controller.dart';
import '../own_affirmation_model.dart';

class OwnAffirmationBlastEffectDialog extends StatelessWidget {
OwnAffirmationModel ownAffirmationModel;

  OwnAffirmationBlastEffectDialog(
      this.controller, {
       required this.ownAffirmationModel,
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
            borderRadius: BorderRadiusStyle.roundedBorder22,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: getVerticalSize(
                    238,
                  ),
                  width: getHorizontalSize(
                    269,
                  ),
                  child: Card(
                    color: Colors.white,

                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            alignment: Alignment.center,
                          
                            padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(8)),
                            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(ownAffirmationModel.imageUrl,),fit: BoxFit.fill)),
                            child: Text(
                              // affirmation,
                               ownAffirmationModel.affirmation,
                              maxLines: 6,
                               overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Color(0xff5E4646),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right:getHorizontalSize(10),
                          top: getVerticalSize(10),
                          child: InkWell(
                            onTap: (){
                             Get.to(()=> EditAffirmationScreen(ownAffirmationModel: ownAffirmationModel,));
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                // color: Colors.blue,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.blue)
                              ),
                              child: Icon(Icons.mode_edit_outline_outlined,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                ),
              ),
              SizedBox(height: getVerticalSize(20),),
              InkWell(
                onTap: () {
                  // Handle button press
                },
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey), // Border color for the button
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(8),vertical: getVerticalSize(5)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(getHorizontalSize(50))),
                        border: Border.all(
                        style: BorderStyle.solid,color: Colors.black.withOpacity(0.3)
                      )
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.edit_outlined, size: 16),
                        SizedBox(width: getHorizontalSize(5)),
                        Text("Add Image", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
        ConfettiWidget(
          confettiController: controller.confettiController,
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
