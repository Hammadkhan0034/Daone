import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'badgeslist.dart';
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
        appBar: AppBar(
          centerTitle: true,
          title: Text('Achievements',
              style:
              TextStyle(
                  fontFamily: 'Gotham Light',
                  fontWeight: FontWeight.w800,
                  fontSize: 25, color: Colors.black)),
          leadingWidth: 68,
          leading: AppbarIconbutton(
            onTap: () {
              Get.back();
            },
            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              left: 10,
              top: 10,
              bottom: 5,
            ),
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
                  StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('users').doc(user).collection('OwnAffirmationList').snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      final data = snapshot.data?.docs.length == 0 ? 1 : snapshot.data?.docs.length;

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
}
