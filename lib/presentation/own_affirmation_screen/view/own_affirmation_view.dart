import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/own_affirmation_screen/controller/own_affirmation_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../widgets/app_bar/appbar_iconbutton.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/text_widget.dart';
import '../../edit_affirmation_dialog/controller/edit_affirmation_controller.dart';
import '../../edit_affirmation_dialog/edit_affirmation_dialog.dart';

class OwnAffirmationView extends StatelessWidget {
  const OwnAffirmationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    OwnAffirmationController controller = Get.put(OwnAffirmationController());

    return Scaffold(
      appBar: CustomAppBar(
        height: getVerticalSize(79),
        leadingWidth: 72,
        leading: AppbarIconbutton(
          onTap: () {
            Get.back();
          },
          svgPath: ImageConstant.imgInfo,
          margin: getMargin(left: 24, top: 4, bottom: 4),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          height: Get.height * 0.82,
          width: double.infinity,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(user?.uid)
                .collection('OwnAffirmationList')
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Loading indicator while data is being fetched
                return Center(
                  child: Container(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(
                        color: Colors.deepOrangeAccent,
                      )),
                );
              }

              if (snapshot.hasError) {
                // Handle errors here
                return Text('Error: ${snapshot.error}');
              }

              // Check if there are no tasks
              if (snapshot.data.docs.isEmpty) {
                return Container(
                  height: Get.height * 0.3,
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      SizedBox(height: Get.height * 0.08),
                      Center(
                        child: Image.asset(
                          ImageConstant.vector21,
                          scale: 4,
                        ),
                      ),
                      SizedBox(height: Get.height * 0.04),
                      TextWidget(
                        text: "You don't have any affirmation",
                        color: Colors.black38,
                        fsize: 14,
                        font: FontWeight.w500,
                      ),
                    ],
                  ),
                );
              }


              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Set the number of columns here
                  crossAxisSpacing: 8.0, // Adjust spacing as needed
                  mainAxisSpacing: 8.0, // Adjust spacing as needed
                ),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  final affirmationData = snapshot.data.docs[index].data();
                  final affirmationText = affirmationData['affirmation'];
                  final imageUrl = affirmationData['imageUrl'];

                  return InkWell(
                    onTap: (){
                      Get.dialog(AlertDialog(backgroundColor: Colors.transparent,
                        contentPadding: EdgeInsets.zero,
                        insetPadding: const EdgeInsets.only(left: 0),
                        content:Stack(
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
                                            image: DecorationImage(
                                                image: affirmationData['imageUrl'] == null
                                                    ? NetworkImage(
                                                    "https://images.unsplash.com/photo-1483197452165-7abc4b248905?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60")
                                                    : NetworkImage(affirmationData['imageUrl']),fit: BoxFit.cover
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
                                              affirmationData['affirmation'],
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
                                  CustomElevatedButton(
                                    onTap: (){
                                      controller.deleteAffirmation(snapshot.data.docs[index].id);
                                      Get.back();
                                    },
                                    text: "Delete Affirmation".tr,
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

                                  CustomElevatedButton(
                                    onTap: ()async{
                                      controller.playConfetti();
                                    },
                                    text: "msg_blast_affirmation".tr,
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
                        ),

                      ),
                      );
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  height: Get.height*0.12,
                                  child:  Text(
                                    affirmationData['affirmation'],
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(fontSize: 12,
                                      color:Color(0xff5E4646),fontWeight:FontWeight.w500,),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0),
                                child: Image.asset("assets/images/affir.png",scale: 4),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}