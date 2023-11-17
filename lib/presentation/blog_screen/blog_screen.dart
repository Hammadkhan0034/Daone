import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../latest_blog_screen/latest_blog_screen.dart';
import 'controller/blog_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class BlogScreen extends GetWidget<BlogController> {
  const BlogScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 29,
            ),
            child: Padding(
              padding: getPadding(
                left: 26,
                right: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomIconButton(
                    onTap: (){
                      Get.offAndToNamed(AppRoutes.dashboardRoute);
                    },
                    height: 48,
                    width: 48,
                    margin: getMargin(
                      left: 3,
                    ),
                    padding: getPadding(
                      all: 11,
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgInfo,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 3,
                      top: 32,
                      right: 4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_latest_blog".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: CustomTextStyles.titleMediumGray90003Medium,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 6,
                            bottom: 4,
                          ),
                          child: Text(
                            DateFormat('MMMM dd, yyyy').format(DateTime.now()).toString(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.labelMediumGray60001,
                          ),
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('blogs').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      // Determine the total number of items
                      int totalItems = snapshot.data?.docs.length ?? 0;

                      // Generate a random number between 1 and totalItems
                      Random random = Random();
                      int itemCount = random.nextInt(totalItems);


                      return Container(
                        height:Get.height*0.26,width: double.infinity,
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) {
                            var document = snapshot.data?.docs[itemCount];
                            var image = document?['imageUrl'];
                            var blogData = snapshot.data?.docs[itemCount].data() as Map<String,dynamic>;
                          return InkWell(
                            onTap: (){
                              Get.to(LatestBlogScreen(blogData: blogData,blogId:""));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: Get.height*0.18,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(image: NetworkImage(image),fit: BoxFit.cover),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                                  child: Text(
                                    document?['title'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.titleMediumGray90003Medium,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                                  child: Text(
                                    document?['description'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.bodySmallBlack900,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },

                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: getPadding(
                      left: 3,
                      top: 13,
                    ),
                    child: Text(
                      "lbl_recent_blogs".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleSmallPoppinsBlack900SemiBold,
                    ),
                  ),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('blogs').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      return Container(
                        height: Get.height * 0.5,
                        width: double.infinity,
                      // color: Colors.deepOrange,
                        child: ListView.builder(
                            itemCount: snapshot.data?.docs.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            var document = snapshot.data?.docs[index].data() as Map<String, dynamic>;
                            var image = document['imageUrl'];
                            var title = document['title'] ?? 'Default Title';
                            var description = document['description'] ?? 'Default description';
                            var writerName = document['writerName'] ?? 'Default writer';
                            var date = document['date'] ?? 'Default Date'; // Change 'Default Title' to 'Default Date'

                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Get.to(LatestBlogScreen(
                                      blogData: document,
                                      blogId: FirebaseAuth.instance.currentUser!.uid,
                                    ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: Get.height * 0.1,
                                          width: Get.width * 0.2,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            image: DecorationImage(
                                              image: NetworkImage(image),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 7.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 2.0),
                                                child: Container(
                                                  child: Text(
                                                    title,
                                                    overflow: TextOverflow.fade,
                                                    maxLines: 2,
                                                    textAlign: TextAlign.left,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              Container(
                                                height: 40,
                                                width: 200,
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                                                  child: Text(
                                                    description,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: CustomTextStyles.bodySmallBlack900,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  TextWidget(text: "by ", color: Colors.black, fsize: 8),
                                                  TextWidget(text: writerName, color: Colors.deepOrange, fsize: 8),
                                                  SizedBox(width: 10),
                                                  TextWidget(text: date, color: Colors.black, fsize: 8),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
