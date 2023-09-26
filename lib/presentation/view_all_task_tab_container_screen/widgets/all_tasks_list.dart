import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text_widget.dart';

Widget allTaskList() {
  final user = FirebaseAuth.instance.currentUser;
  return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid) // Replace with the user's UID
          .collection('tasks')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading indicator while data is being fetched
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          // Handle errors here
          return Text('Error: ${snapshot.error}');
        }

        // Check if there are no tasks
        if (snapshot.data.docs.isEmpty) {
          return  Container(
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
                  "You don't have any schedule today.\n Tap the plus button to create new task",
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
            itemBuilder: (context, index) {
              // Get task data from Firestore document
              var taskData = snapshot.data.docs[index].data();
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: Get.height * 0.12,
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white24,
                    border: Border.all(
                      color: Colors.black12,
                      // color:Color(0xffF46837),// Border color
                      width: 2.0, // Border width
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white, // Shadow color
                        offset: Offset(0, 2), // Specify the offset of the shadow
                        blurRadius: 6.0, // Specify the blur radius
                        spreadRadius: 2.0, // Specify the spread radius
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(text:taskData['taskTitle'], color:Color(0xff4F5753) , fsize: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: Get.width*0.67,
                                child: TextWidget(text:taskData['description'], color:Color(0xffF46837) , fsize: 12)),
                            Container(
                              width: Get.width*0.15,
                              height:Get.height*0.03,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(31.000001907348633),
                                  color: Color(0xff048c44)),
                              child: Center(
                                child: TextWidget(text: "Done",color: Colors.white,fsize: 14,font: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        TextWidget(text:taskData['date'], color:Color(0xff4F5753) , fsize: 10),
                      ],
                    ),
                  ),
                ),
              );
              // Create a ListTile for each task
              // return ListTile(
              //   title: Text(taskData['taskTitle']),
              //   subtitle: Text(taskData['description']),
              //   // Add other task details here
              // );
            });
      });
}
