import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'controller/personal_data_update_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class PersonalDataUpdateScreen extends GetWidget<PersonalDataUpdateController> {
  PersonalDataUpdateScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final user =FirebaseAuth.instance.currentUser!.email;

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            81,
          ),
          leadingWidth: 77,
          leading: AppbarIconbutton(
            onTap: (){
              Get.back();
            },
            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              left: 29,
              top: 4,
              bottom: 4,
            ),
          ),
          centerTitle: true,
          title: AppbarSubtitle2(
            text: "lbl_achievements".tr,
          ),
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 72,
            ),
            child: Padding(
              padding: getPadding(
                left: 29,
                right: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // StreamBuilder(
                  //   stream: FirebaseFirestore.instance.collection('users').doc(user).collection('OwnAffirmationList').snapshots(),
                  //   builder: (context, AsyncSnapshot snapshot) {
                  //   //  final data = snapshot.data?.docs.length ?? 0; // Use the null-safe operator
                  //     final data = 100;
                  //
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       // Loading indicator while data is being fetched
                  //       return Center(
                  //         child: Container(
                  //           height: 50,
                  //           width: 50,
                  //           child: CircularProgressIndicator(
                  //             color: Colors.deepOrangeAccent,
                  //           ),
                  //         ),
                  //       );
                  //     }
                  //     else if (data > 1 && data <= 100) {
                  //       return Container(
                  //         width:Get.width*0.5,
                  //         height: Get.height*0.2,
                  //         decoration: BoxDecoration(
                  //          // color: Colors.green,
                  //           image: DecorationImage(image: AssetImage(badges[1])),
                  //         ),
                  //       );
                  //     }
                  //     else if (data > 100 && data <= 200) {
                  //       return  GridView.builder(
                  //         shrinkWrap: true,
                  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //           mainAxisExtent: getVerticalSize(
                  //             143,
                  //           ),
                  //           crossAxisCount: 2,
                  //           mainAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //           crossAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //         ),
                  //         physics: NeverScrollableScrollPhysics(),
                  //         itemCount:2,
                  //         itemBuilder: (context, index) {
                  //
                  //           return Container(
                  //             width:double.infinity ,
                  //             height: Get.height*0.2,
                  //             decoration: BoxDecoration(
                  //               image: DecorationImage(image: AssetImage(badges[index])),
                  //             ),
                  //           );
                  //         },
                  //       );
                  //     }
                  //     else if (data > 200 && data <= 300) {
                  //       return  GridView.builder(
                  //         shrinkWrap: true,
                  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //           mainAxisExtent: getVerticalSize(
                  //             143,
                  //           ),
                  //           crossAxisCount: 2,
                  //           mainAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //           crossAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //         ),
                  //         physics: NeverScrollableScrollPhysics(),
                  //         itemCount:3,
                  //         itemBuilder: (context, index) {
                  //
                  //           return Container(
                  //             width:double.infinity ,
                  //             height: Get.height*0.2,
                  //             decoration: BoxDecoration(
                  //               image: DecorationImage(image: AssetImage(badges[index])),
                  //             ),
                  //           );
                  //         },
                  //       );
                  //     }
                  //     else if (data > 300 && data <= 400) {
                  //       return  GridView.builder(
                  //         shrinkWrap: true,
                  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //           mainAxisExtent: getVerticalSize(
                  //             143,
                  //           ),
                  //           crossAxisCount: 2,
                  //           mainAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //           crossAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //         ),
                  //         physics: NeverScrollableScrollPhysics(),
                  //         itemCount:4,
                  //         itemBuilder: (context, index) {
                  //
                  //           return Container(
                  //             width:double.infinity ,
                  //             height: Get.height*0.2,
                  //             decoration: BoxDecoration(
                  //               image: DecorationImage(image: AssetImage(badges[index])),
                  //             ),
                  //           );
                  //         },
                  //       );
                  //     }
                  //     else if (data > 400 && data <= 500) {
                  //       return  GridView.builder(
                  //         shrinkWrap: true,
                  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //           mainAxisExtent: getVerticalSize(
                  //             143,
                  //           ),
                  //           crossAxisCount: 2,
                  //           mainAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //           crossAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //         ),
                  //         physics: NeverScrollableScrollPhysics(),
                  //         itemCount:5,
                  //         itemBuilder: (context, index) {
                  //
                  //           return Container(
                  //             width:double.infinity ,
                  //             height: Get.height*0.2,
                  //             decoration: BoxDecoration(
                  //               image: DecorationImage(image: AssetImage(badges[index])),
                  //             ),
                  //           );
                  //         },
                  //       );
                  //     }
                  //     else if (data > 500 && data <= 600) {
                  //       return  GridView.builder(
                  //         shrinkWrap: true,
                  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //           mainAxisExtent: getVerticalSize(
                  //             143,
                  //           ),
                  //           crossAxisCount: 2,
                  //           mainAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //           crossAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //         ),
                  //         physics: NeverScrollableScrollPhysics(),
                  //         itemCount:6,
                  //         itemBuilder: (context, index) {
                  //
                  //           return Container(
                  //             width:double.infinity ,
                  //             height: Get.height*0.2,
                  //             decoration: BoxDecoration(
                  //               image: DecorationImage(image: AssetImage(badges[index])),
                  //             ),
                  //           );
                  //         },
                  //       );
                  //     }
                  //     else if (data > 600 && data <= 700) {
                  //       return  GridView.builder(
                  //         shrinkWrap: true,
                  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //           mainAxisExtent: getVerticalSize(
                  //             143,
                  //           ),
                  //           crossAxisCount: 2,
                  //           mainAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //           crossAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //         ),
                  //         physics: NeverScrollableScrollPhysics(),
                  //         itemCount:7,
                  //         itemBuilder: (context, index) {
                  //
                  //           return Container(
                  //             width:double.infinity ,
                  //             height: Get.height*0.2,
                  //             decoration: BoxDecoration(
                  //               image: DecorationImage(image: AssetImage(badges[index])),
                  //             ),
                  //           );
                  //         },
                  //       );
                  //     }
                  //     else if (data > 700 && data <= 800) {
                  //       return  GridView.builder(
                  //         shrinkWrap: true,
                  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //           mainAxisExtent: getVerticalSize(
                  //             143,
                  //           ),
                  //           crossAxisCount: 2,
                  //           mainAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //           crossAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //         ),
                  //         physics: NeverScrollableScrollPhysics(),
                  //         itemCount:8,
                  //         itemBuilder: (context, index) {
                  //
                  //           return Container(
                  //             width:double.infinity ,
                  //             height: Get.height*0.2,
                  //             decoration: BoxDecoration(
                  //               image: DecorationImage(image: AssetImage(badges[index])),
                  //             ),
                  //           );
                  //         },
                  //       );
                  //     }
                  //     else if (data > 800 && data <= 900) {
                  //       return  GridView.builder(
                  //         shrinkWrap: true,
                  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //           mainAxisExtent: getVerticalSize(
                  //             143,
                  //           ),
                  //           crossAxisCount: 2,
                  //           mainAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //           crossAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //         ),
                  //         physics: NeverScrollableScrollPhysics(),
                  //         itemCount:9,
                  //         itemBuilder: (context, index) {
                  //
                  //           return Container(
                  //             width:double.infinity ,
                  //             height: Get.height*0.2,
                  //             decoration: BoxDecoration(
                  //               image: DecorationImage(image: AssetImage(badges[index])),
                  //             ),
                  //           );
                  //         },
                  //       );
                  //     }
                  //     else if (data > 900 && data <= 1000) {
                  //       return  GridView.builder(
                  //         shrinkWrap: true,
                  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //           mainAxisExtent: getVerticalSize(
                  //             143,
                  //           ),
                  //           crossAxisCount: 2,
                  //           mainAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //           crossAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //         ),
                  //         physics: NeverScrollableScrollPhysics(),
                  //         itemCount:10,
                  //         itemBuilder: (context, index) {
                  //
                  //           return Container(
                  //             width:double.infinity ,
                  //             height: Get.height*0.2,
                  //             decoration: BoxDecoration(
                  //               image: DecorationImage(image: AssetImage(badges[index])),
                  //             ),
                  //           );
                  //         },
                  //       );
                  //     }
                  //     else if (data > 1000 && data <= 1100) {
                  //       return  GridView.builder(
                  //         shrinkWrap: true,
                  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //           mainAxisExtent: getVerticalSize(
                  //             143,
                  //           ),
                  //           crossAxisCount: 2,
                  //           mainAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //           crossAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //         ),
                  //         physics: NeverScrollableScrollPhysics(),
                  //         itemCount:11,
                  //         itemBuilder: (context, index) {
                  //
                  //           return Container(
                  //             width:double.infinity ,
                  //             height: Get.height*0.2,
                  //             decoration: BoxDecoration(
                  //               image: DecorationImage(image: AssetImage(badges[index])),
                  //             ),
                  //           );
                  //         },
                  //       );
                  //     }
                  //     else if (data > 1100 && data <= 1200) {
                  //       return  GridView.builder(
                  //         shrinkWrap: true,
                  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //           mainAxisExtent: getVerticalSize(
                  //             143,
                  //           ),
                  //           crossAxisCount: 2,
                  //           mainAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //           crossAxisSpacing: getHorizontalSize(
                  //             24,
                  //           ),
                  //         ),
                  //         physics: NeverScrollableScrollPhysics(),
                  //         itemCount:12,
                  //         itemBuilder: (context, index) {
                  //
                  //           return Container(
                  //             width:double.infinity ,
                  //             height: Get.height*0.2,
                  //             decoration: BoxDecoration(
                  //               image: DecorationImage(image: AssetImage(badges[index])),
                  //             ),
                  //           );
                  //         },
                  //       );
                  //     }
                  //
                  //
                  //     else {
                  //       return Container(
                  //         height: 100,
                  //         width: 100,
                  //         color: Colors.purple,
                  //       );
                  //     }
                  //   },
                  // ),
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
                        int itemCount = (data / 100).ceil(); // Calculate the number of grid items

                        return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: getVerticalSize(143),
                            crossAxisCount: 2,
                            mainAxisSpacing: getHorizontalSize(24),
                            crossAxisSpacing: getHorizontalSize(24),
                          ),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: itemCount,
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.infinity,
                              height: Get.height * 0.2,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(badges[index % badges.length])),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),

                ],
              ),
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
