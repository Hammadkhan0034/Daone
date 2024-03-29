


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_2.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/text_widget.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final user = FirebaseAuth.instance.currentUser;

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Notes',

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
          // actions: [
          //   // Padding(
          //   //   padding: EdgeInsets.only(right: 10),
          //   //   child: Icon(Icons.edit_outlined),
          //   // ),
          //   Padding(
          //     padding: EdgeInsets.only(right: 10),
          //     child: Icon(Icons.menu),
          //   )
          // ],
        ),
        body: Container(
          height: Get.height*0.85,
          width: double.infinity,
          child:StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(user?.email) // Replace with the user's UID
                .collection('NoteList')
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
                        "You don't have any Notes",
                        fontFamily: 'Gotham Light',
                        fontWeight: FontWeight.w400,
                        color: Colors.black38,
                        fsize: 14,
                      )
                    ],
                  ),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context,index){
                    var notesData= snapshot.data.docs[index].data();
                    var dateString = notesData['date'];
                   var  formattedDate = formatDate(dateString);
                   print(formattedDate);

                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      margin: const EdgeInsets.all(12.0),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.withOpacity(0.1),
                     //   color: Colors.green,
                     //    border: Border.all(
                     //      color: Colors.black,
                     //      width: 1, // Adjust the width as needed
                     //    ),
                      ),
                      width: Get.width,
                      // height: Get.height*0.2,
                      child: Column(
                        children: [
                          Container(
                            width: Get.width,
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      //borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2, // Adjust the width as needed
                                      ),
                                    shape: BoxShape.circle
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: Get.width-104,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(text: "You added a note ",
                                              fontFamily: 'Gotham Light',
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black, fsize: 10),
                                          Padding(
                                            padding: EdgeInsets.only(right: Get.width*0.035),
                                            child: TextWidget(text: formattedDate, color: Colors.black,
                                                fontFamily: 'Gotham Light',
                                                fontWeight: FontWeight.w800,
                                                fsize: 9),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 3),
                                        child: TextWidget(text:' ${notesData['title']}',
                                      fontFamily: 'Gotham Light',
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black, fsize: 10, softWrap: true,)),
                                    // TextWidget(text: formattedDate, color: Colors.black,
                                    //     fontFamily: 'Gotham Light',
                                    //     font: FontWeight.w800,
                                    //     fsize: 9),
                                  ],
                                ),


                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                // SizedBox(width:Get.width*0.05,),
                                // Container(
                                //   width: 1, // Adjust the width of the line
                                //   height: 100, // Adjust the height of the line
                                //   color: Colors.black, // Adjust the color of the line
                                // ),
                                Container(
                                  //color: Colors.black26,
                                  width: Get.width*0.73,
                                  margin: EdgeInsets.symmetric(horizontal: Get.width*0.05),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        left: BorderSide(
                                        color: Colors.black, // Adjust the color of the border
                                        width: 2.0, // Adjust the width of the border
                                      ),
                                    ),
                                  ),
                                  //height: 100,
                                  child:  Center(
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: Get.width*0.1,vertical: Get.height*0.01),
                                      child:Text(
                                        notesData['selectedText'],
                                        style: GoogleFonts.getFont(
                                          'Roboto',
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                )

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.black12,
                              // height: Get.height*0.1,
                              width: Get.width*0.8,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(child: TextWidget(text: notesData['noteComment'], color: Colors.black, fsize: 12)),
                            ),
                            ),
                          ),

                        ],
                      ),
                    );
                  });
            },
          ),

        ),
      ),
    );
  }
  String formatDate(String inputDate) {
    try {
      List<String> dateComponents = inputDate.split('-');
      int day = int.parse(dateComponents[0]);
      int month = int.parse(dateComponents[1]);
      int year = int.parse(dateComponents[2]);

      DateTime date = DateTime(year, month, day);
      Duration difference = DateTime.now().difference(date);

      if (difference.inDays == 0) {
        return 'Today';
      } else if (difference.inDays == 1) {
        return '1 day ago';
      } else if (difference.inDays > 1 && difference.inDays < 7) {
        return '${difference.inDays} days ago';
      } else if (difference.inDays >= 7 && difference.inDays < 14) {
        return '1w ago';
      } else if (difference.inDays >= 14 && difference.inDays < 21) {
        return '2w ago';
      } else if (difference.inDays >= 21) {
        final int weeks = (difference.inDays / 7).floor();
        return '${weeks}w ago';
      } else if (difference.inDays >= 30) {
        final int months = (difference.inDays / 30).floor();
        return '${months}m ago';
      } else {
        return 'Today';
      }
    } catch (e) {
      print('Error parsing date: $e');
      return 'Invalid date';
    }
  }
}

