import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../widgets/text_widget.dart';
import '../personal_data_update_one_screen/widgets/listn_item_widget.dart';
import 'controller/personal_data_update_one_controller.dart';
import 'models/listn_item_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/appbar_image.dart';
import 'package:daone/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_bottom_bar.dart';
import 'package:daone/widgets/custom_drop_down.dart';
import 'package:daone/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class PersonalDataUpdateOneScreen
    extends GetWidget<PersonalDataUpdateOneController> {
  const PersonalDataUpdateOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final user = FirebaseAuth.instance.currentUser;

    return SafeArea(
      child: Scaffold(
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
            text: "lbl_highlights".tr,
          ),

        ),
        body: Container(
          height: Get.height*0.85,
          width: double.infinity,
          child:StreamBuilder(
            stream: FirebaseFirestore.instance
              .collection('users')
              .doc(user?.uid) // Replace with the user's UID
              .collection('highlightList')
              .snapshots(),
            builder: (context,AsyncSnapshot snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Loading indicator while data is being fetched
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepOrange,
                  ),
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
                  decoration: BoxDecoration(
                    //  color: Colors.teal
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: Get.height * 0.08),
                      Center(
                          child: Image.asset(
                            ImageConstant.vector21,
                            scale: 4,
                          )),
                      SizedBox(height: Get.height * 0.04),
                      TextWidget(
                        text:
                        "You don't have any Higlights",
                        color: Colors.black38,
                        fsize: 14,
                        font: FontWeight.w500,
                      )
                    ],
                  ),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context,index){
                    var higlightData= snapshot.data.docs[index].data();
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.green,
image: DecorationImage(image: NetworkImage(higlightData['imageUrl']),fit: BoxFit.cover),
                        ),
                        width: Get.width*0.6,
                        // height: Get.height*0.2,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Stack(
                                      children: [
                                        CircularProgressIndicator(
                                        color: Colors.black,
                                        value: 100,
                                          strokeWidth: 1,
                                      ),
                                      ]
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(text: "You Higlighted", color: Colors.black, fsize: 13,font: FontWeight.w600),
                                      TextWidget(text: higlightData['date'], color: Colors.black, fsize: 13,font: FontWeight.w600),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Center(child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: TextWidget(text: higlightData['selectedText'], color: Colors.black, fsize: 10),
                            )),
                          ],
                        ),
                      ),
                    );
                  });
            },
          ),

        ),
      ),
    );
  }
}
