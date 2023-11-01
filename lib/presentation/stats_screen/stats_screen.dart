import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';

import 'controller/stats_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class StatsScreen extends GetWidget<StatsController> {
   StatsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final user =FirebaseAuth.instance.currentUser!.email;
    CollectionReference weeklyProgressCollection = FirebaseFirestore.instance.collection('users').doc(user).collection('OwnAffirmationList');

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: double.maxFinite,
            padding: getPadding(
              left: 28,
              top: 43,
              right: 28,
              bottom: 43,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CustomIconButton(
                //   onTap: () {
                //     Get.offAndToNamed(AppRoutes.dashboardRoute);
                //   },
                //   height: 45,
                //   width: 48,
                //   margin: getMargin(
                //     left: 1,
                //   ),
                //   padding: getPadding(
                //     all: 11,
                //   ),
                //   child: CustomImageView(
                //     svgPath: ImageConstant.imgInfo,
                //   ),
                // ),
                // SizedBox(height: Get.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "lbl_daily_affirmations_progress".tr,
                      color: Colors.black,
                      fsize: 16,
                      font: FontWeight.w600,
                    ),
                    Container(
                      width: Get.width * 0.17,
                      height: Get.height * 0.044,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [Color(0xfff36430), Color(0xffff7e67)],
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                              text: "Daily", color: Colors.white, fsize: 12),
                          Image.asset(
                            ImageConstant.arrowDown2,
                            scale: 1.4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height*0.05),
                Row(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(25.921112060546875),
                      elevation: 5,
                      child: Container(
                        width: Get.width * 0.35,
                        height: Get.height * 0.16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.921112060546875),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: Get.width * 0.4,
                              height: Get.height * 0.08,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.04,
                                  ),
                                  TextWidget(
                                    text: "20",
                                    color: Colors.black,
                                    fsize: 50,
                                    font: FontWeight.w600,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:3.0),
                                    child: Image.asset(
                                      ImageConstant.group10110,
                                      scale: 3.8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.02,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Center(
                                child: TextWidget(
                              text: "lbl_affirmation_completed".tr,
                              color: Colors.black54,
                              fsize: 12,
                              font: FontWeight.w500,
                            )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: Get.width*0.13),
                    Material(
                      borderRadius: BorderRadius.circular(25.921112060546875),
                      elevation: 5,
                      child: Container(
                        width: Get.width * 0.35,
                        height: Get.height * 0.16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.921112060546875),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width * 0.4,
                              height: Get.height * 0.08,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.03,
                                  ),
                                  TextWidget(
                                    text: "13",
                                    color: Colors.black,
                                    fsize: 50,
                                    font: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.01,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Image.asset(
                                      ImageConstant.camIcon,
                                      scale: 3.8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.03,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Center(
                                child: TextWidget(
                                  text: "lbl_intentions_completed".tr,
                                  color: Colors.black54,
                                  fsize: 12,
                                  font: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height*0.05),
                Row(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(25.921112060546875),
                      elevation: 5,
                      child: Container(
                        width: Get.width * 0.35,
                        height: Get.height * 0.16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.921112060546875),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width * 0.4,
                              height: Get.height * 0.08,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.04,
                                  ),
                                  TextWidget(
                                    text: "29",
                                    color: Colors.black,
                                    fsize: 50,
                                    font: FontWeight.w600,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:3,top:8.0),
                                    child: Image.asset(
                                      ImageConstant.group10111,
                                      scale: 3.8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.02,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Center(
                                child: TextWidget(
                                  text: "lbl_tasks_completed".tr,
                                  color: Colors.black54,
                                  fsize: 12,
                                  font: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: Get.width*0.13),
                    Material(
                      borderRadius: BorderRadius.circular(25.921112060546875),
                      elevation: 5,
                      child: Container(
                        width: Get.width * 0.35,
                        height: Get.height * 0.16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.921112060546875),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width * 0.4,
                              height: Get.height * 0.08,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.03,
                                  ),
                                  TextWidget(
                                    text: "10",
                                    color: Colors.black,
                                    fsize: 50,
                                    font: FontWeight.w600,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8,left: 5,right: 5),
                                    child: Image.asset(
                                      ImageConstant.msgIcon,
                                      scale: 3.8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Center(
                                child: TextWidget(
                                  text: "lbl_blog_read".tr,
                                  color: Colors.black54,
                                  fsize: 12,
                                  font: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: TextWidget(
                    text: "lbl_week_badges".tr,
                    color: Colors.black,
                    fsize: 16,
                    font: FontWeight.w600,
                  ),
                ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('users').doc(user).collection('OwnAffirmationList').snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    final data = snapshot.data?.docs.length ?? 0;

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Container(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                      );
                    } else {
                      int itemCount = (data / 100).ceil(); // Calculate the number of items to display

                      return Material(
                        color: Colors.white,
                        elevation: 2,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: double.infinity,
                          height: Get.height*0.13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
//                            color: Colors.teal,

                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal, // Set the scroll direction to horizontal
                            itemCount: itemCount,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: Get.width * 0.23,
                                  height: Get.height * 0.2,

                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage(badges[index % badges.length])),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  List<String> badges=[
    'assets/badges/1.png',
    'assets/badges/2.png',
    'assets/badges/3.png',
    'assets/badges/4.png',
    'assets/badges/5.png',
    'assets/badges/6.png',
    'assets/badges/7.png',
    'assets/badges/8.png',
    'assets/badges/9.png',
    'assets/badges/10.png',
    'assets/badges/11.png',
    'assets/badges/12.png',
    'assets/badges/13.png',
    'assets/badges/14.png',
    'assets/badges/15.png',
    'assets/badges/16.png',
    'assets/badges/17.png',
    'assets/badges/17.png',
    'assets/badges/18.png',
    'assets/badges/19.png',
    'assets/badges/20.png',
    'assets/badges/21.png',
    'assets/badges/22.png',
    'assets/badges/23.png',
    'assets/badges/24.png',
    'assets/badges/25.png',
    'assets/badges/26.png',
    'assets/badges/27.png',
    'assets/badges/28.png',
    'assets/badges/29.png',
  ];

}
