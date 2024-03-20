import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart'; // Import the CachedNetworkImage package
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:daone/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:daone/widgets/custom_elevated_button.dart';

import '../../../widgets/text_widget.dart';
import '../../edit_affirmation_dialog/controller/edit_affirmation_controller.dart';
import '../../edit_affirmation_dialog/edit_affirmation_dialog.dart';
import '../controller/own_affirmation_controller.dart';
import '../own_affirmation_model.dart';

class OwnAffirmationBlastEffectDialog extends StatelessWidget {
  final OwnAffirmationModel ownAffirmationModel;


  OwnAffirmationBlastEffectDialog(this.controller, {
    required this.ownAffirmationModel,
    Key? key,
  }) : super(
    key: key,
  );
  final OwnAffirmationController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    OwnAffirmationController controller2 = Get.put(OwnAffirmationController());
    EditAffirmationController editingcontroller = Get.put(
        EditAffirmationController());

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
                          child: Obx(() {
                            return Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: getHorizontalSize(8)),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: editingcontroller.selectedBackground.value==''?
                                      NetworkImage(

                                       ownAffirmationModel.imageUrl
                                      ):NetworkImage(

                                          editingcontroller.selectedBackground.value
                                      ),
                                      fit: BoxFit.fill)),
                              child: Text(
                                // affirmation,
                                editingcontroller.displayText.value,
                                maxLines: 6,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Color(0xff5E4646),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            );
                          }),
                        ),
                        Positioned(
                          right: getHorizontalSize(10),
                          top: getVerticalSize(10),
                          child: InkWell(
                            onTap: () {
                              // showDialog(
                              //   barrierColor: Colors.transparent,
                              //   context: context,
                              //   builder: (BuildContext context) {
                              //     return MyDialog(ownAffirmationModel: ownAffirmationModel);
                              //   },
                              // );
                              Get.dialog(
                                  barrierColor: Colors.transparent,
                                  EditAffirmationDialougue(ownAffirmationModel: ownAffirmationModel));
                              // Get.to(() =>
                              //     EditAffirmationScreen(
                              //       ownAffirmationModel: ownAffirmationModel,));
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                // color: Colors.blue,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.deepOrange)),
                              child: Icon(
                                Icons.mode_edit_outline_outlined,
                                color: Colors.deepOrange,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getVerticalSize(20),
              ),


              InkWell(
                onTap: () {
                  Get.bottomSheet(
                    Obx(
                          () =>
                          Container(
                            height: Get.height,
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)

                            ),
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(width: 60, height: 5,
                                    margin: const EdgeInsets.only(top: 20),

                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                  Container(

                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 10, left: 10),
                                    child: TextWidget(
                                      text: "Choose Your  Background Image",
                                      fsize: 18,),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  Expanded(
                                    child: GridView.builder(
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3, // Number of columns
                                      ),
                                      itemCount:
                                      editingcontroller.availableBackgrounds
                                          .length,
                                      itemBuilder: (context, index) {
                                        final background =
                                        editingcontroller
                                            .availableBackgrounds[index];
                                        print(
                                            "here is the background i age url: ");
                                        print(background)
                                        ;
                                        return InkWell(
                                          onTap: () async{
                                            editingcontroller
                                                .setSelectedBackground(
                                                background);

                                            editingcontroller.OwnAffirmationBackgroundList(context,editingcontroller.selectedBackground.value,
                                                ownAffirmationModel!.date
                                                 );
                                            Get.back();

                                          },
                                          child: CachedNetworkImage(
                                            imageUrl:
                                            background,
                                            // Replace newBackgroundURL with the new image URL
                                            imageBuilder: (context,
                                                imageProvider) =>
                                                Container(
                                                  // height: Get.width * 0.3,
                                                  // width: Get.width * 0.3,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                            placeholder: (context, url) =>
                                                Center(
                                                    child: CircularProgressIndicator(
                                                      color: Colors.deepOrange,
                                                    )),
                                            // You can customize the placeholder
                                            errorWidget: (context, url,
                                                error) =>
                                                Icon(Icons.error),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    ),
                  );

                  // controller.blastAffirmation(ownAffirmationModel);
                  // Handle button press
                },
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,),

                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: getHorizontalSize(8),
                        vertical: getVerticalSize(5)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(getHorizontalSize(50))),
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: Colors.black.withOpacity(0.3))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Icon(FontAwesomeIcons.pencil, size: 25,
                          color: Colors.deepOrange,),

                        SizedBox(width: 10,),
                        Text("Add Image", style: TextStyle(fontSize: 14)),


                        // Icon(
                        //   FontAwesomeIcons.bomb,
                        //   size: 20,
                        //   color: Colors.deepOrange,
                        // ),
                        // SizedBox(width: getHorizontalSize(5)),
                        // Text("Blast", style: TextStyle(fontSize: 14)),
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

class EditAffirmationDialougue extends StatelessWidget {

   OwnAffirmationModel? ownAffirmationModel;
   final _formKey = GlobalKey<FormState>();
  EditAffirmationDialougue({
    this.ownAffirmationModel,
    Key? key,

  }) : super(
    key: key,
  ) {
    controller = Get.put(EditAffirmationController());
    Future.delayed(Duration.zero, (){
      if (ownAffirmationModel != null) {
        controller.selectedBackground.value = ownAffirmationModel!.imageUrl;
        controller.displayText.value = ownAffirmationModel!.affirmation;
        controller.messageController.text = ownAffirmationModel!.affirmation;
        controller.selectedTime1.value = ownAffirmationModel!.dateStart;
        controller.selectedTime2.value = ownAffirmationModel!.dateEnd;
      }
    });

  }

  late EditAffirmationController controller;


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: Colors.transparent,

      elevation: 10.0,
      backgroundColor: Colors.white,
      child: Container(
        width: Get.width * 0.90,
        height: Get.height * 0.35,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 12.0, horizontal: 17),
              child: Text(
                'Edit Affirmation',
                style: TextStyle(


                  fontSize: 38.0,
                  color: Color(0xff151352),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key:_formKey ,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your affirmation';
                        }
                        // Add any additional validation logic here if needed
                        return null; // Return null if the input is valid
                      },
                      controller: controller.messageController,
                      maxLines: 2,


                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 3.0),
                          borderRadius: BorderRadius.circular(12.0),
                        ),

                        hintText: 'Edit Affirmation...',
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[

                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('CANCEL',
                            style: TextStyle(


                              fontSize: 25.0,
                              color: Color(0xff151352),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(width: 5.0),

                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              controller.OwnAffirmationTextList(
                                  context,
                                  controller.displayText.value,

                                  ownAffirmationModel!.date


                              );
                            }



                          },
                          child: Text('SAVE',
                            style: TextStyle(


                              fontSize: 25.0,
                              color: Color(0xff151352),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
