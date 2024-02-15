import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/text_widget.dart';
import 'controller/personal_data_update_one_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

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
        appBar: AppBar(
          centerTitle: true,
          title: Text('Highlights',
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
        body: Container(
          height: Get.height*0.85,
          width: double.infinity,
          child:StreamBuilder(
            stream: FirebaseFirestore.instance
              .collection('users')
              .doc(user?.email) // Replace with the user's UID
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
                        fontWeight: FontWeight.w500,
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
                          border: Border.all(
                            color: Colors.black,
                            width: 1, // Adjust the width as needed
                          ),

  //                        color: Colors.green,
// image: DecorationImage(image: NetworkImage(higlightData['imageUrl']),fit: BoxFit.cover),
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
                                      Container(
                                        width: Get.width*0.1,
                                        height: Get.height*0.05,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1, // Adjust the width as needed
                                          ),
                                        ),
                                        child: Center(
                                          child: TextWidget(text: "N",color: Colors.black,fsize: 10),
                                        ),

                                      ),
                                      ]
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          TextWidget(text: "You Higlighted", color: Colors.black, fsize: 10),
                                          TextWidget(text:' ${higlightData['title']}', color: Colors.black, fsize: 11,fontWeight: FontWeight.w600),
                                        ],
                                      ),
                                      TextWidget(text: higlightData['date'], color: Colors.black, fsize: 11,fontWeight: FontWeight.w600),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(width:Get.width*0.05,),
                                  Container(
                                    width: 1, // Adjust the width of the line
                                    height: 100, // Adjust the height of the line
                                    color: Colors.black, // Adjust the color of the line
                                  ),
                                  Container(
                                    //color: Colors.black26,
                                    width: Get.width*0.73,
                                   // height: 100,
                                    child:  Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                        child:Container(
                                          width: Get.width*0.9,
                                         // height: Get.height*0.3,
                                         // color: Colors.orange,
                                          child: Text(
                                            higlightData['selectedText'],
                                            // overflow: TextOverflow.ellipsis,
                                            // textAlign: TextAlign.left,
                                          //  maxLines: 5,
                                            style: GoogleFonts.getFont(
                                              'Roboto',
                                              fontSize: higlightData['fontSize'],
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                            // Center(child: Padding(
                            //   padding: const EdgeInsets.all(12.0),
                            //   child: TextWidget(text: higlightData['selectedText'], color: Colors.black, fsize: 10),
                            // )),
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
