import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/add_task_screen/controller/add_task_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../widgets/text_widget.dart';

Widget allTaskList(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser;
  final AddTaskController controller = Get.put(AddTaskController());
  return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user?.email) // Replace with the user's UID
          .collection('tasks')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading indicator while data is being fetched
          return Center(
            child: CircularProgressIndicator(
              color: Colors.deepOrangeAccent,
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
                      "You don't have any schedule today.\n Tap the plus button to create new task",
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
            itemBuilder: (context, index) {
              // Get task data from Firestore document
              var taskData = snapshot.data.docs[index].data();
              DateTime taskDate = taskData['date'].toDate();
              // Format the DateTime as a string
              String formattedDate = DateFormat('dd-MM-yyyy').format(taskDate);
              String documentId = snapshot.data.docs[index].id;

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
                        offset:
                            Offset(0, 2), // Specify the offset of the shadow
                        blurRadius: 6.0, // Specify the blur radius
                        spreadRadius: 2.0, // Specify the spread radius
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                                text: taskData['taskType'],
                                color: Color(0xff4F5753),
                                fsize: 13),
                            Container(
                                child: TextWidget(
                                    text: taskData['description'],
                                    color: Color(0xffF46837),
                                    fsize: 15)),
                            TextWidget(
                                text: formattedDate,
                                color: Color(0xff4F5753),
                                fsize: 10),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Get.defaultDialog(
                                title: "Task Status",
                                middleText: "Task done? 'Todo' or 'Complete'.",
                                actions: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.updateToTodo(documentId);
                                            // controller.todoList(
                                            //     context,
                                            //     taskData['taskTitle'],
                                            //     taskData['description'],
                                            //     taskData['taskType'],
                                            //     taskData['date']);
                                          },
                                          child: Container(
                                            width: Get.width * 0.2,
                                            height: Get.height * 0.043,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        31.000001907348633),
                                                color: Colors.deepOrange),
                                            child: Center(
                                              child: TextWidget(
                                                  text: "Todo",
                                                  color: Colors.white,
                                                  fsize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){
                                          controller.updateToComplete(documentId);
                                          },
                                          child: Container(
                                            width: Get.width * 0.26,
                                            height: Get.height * 0.043,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        31.000001907348633),
                                                color: Color(0xff048c44)),
                                            child: Center(
                                              child: TextWidget(
                                                  text: "Complete",
                                                  color: Colors.white,
                                                  fsize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){
                                           controller.deleteMainTask(documentId);
                                          },
                                          child: Container(
                                            width: Get.width * 0.18,
                                            height: Get.height * 0.043,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        31.000001907348633),
                                                color: Colors.red),
                                            child: Center(
                                              child: TextWidget(
                                                  text: "Delete",
                                                  color: Colors.white,
                                                  fsize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]);
                          },
                          child: Container(
                            width: Get.width * 0.26,
                            height: Get.height * 0.043,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(31.000001907348633),
                               color: snapshot.data.docs[index]['status']=='todo'?
                                  Color(0xffF46837)
                               :Color(0xff048c44)),
                            child: Center(
                              child: TextWidget(
                                  text:snapshot.data.docs[index]['status']==null||snapshot.data.docs[index]['status'].isEmpty?"Task Status":snapshot.data.docs[index]['status'],
                                  //snapshot.data.docs[index]['taskType'],
                                  color: Colors.white,
                                  fsize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      });
}

Widget todoListWdiget(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser;
  final AddTaskController controller = Get.put(AddTaskController());

  return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user?.email) // Replace with the user's UID
          .collection('tasks').where('status',isEqualTo:'todo')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
          );
        }
        return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              // Get task data from Firestore document
              var taskTodoData = snapshot.data.docs[index].data();
              DateTime taskDate = (taskTodoData['date'] as Timestamp).toDate();
              String formattedDate = DateFormat('dd-MM-yyyy').format(taskDate);
              String documentId = snapshot.data.docs[index].id;
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
                        offset:
                            Offset(0, 2), // Specify the offset of the shadow
                        blurRadius: 6.0, // Specify the blur radius
                        spreadRadius: 2.0, // Specify the spread radius
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                                text: taskTodoData['taskTitle'],
                                color: Color(0xff4F5753),
                                fsize: 13),
                            Container(
                                child: TextWidget(
                                    text: taskTodoData['description'],
                                    color: Color(0xffF46837),
                                    fsize: 15)),
                            TextWidget(
                                text: formattedDate,
                                color: Color(0xff4F5753),
                                fsize: 10),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Get.defaultDialog(
                                title: "Task Status",
                                middleText: "Is the task done?",
                                actions: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                         controller.updateToComplete(documentId);
                                          },
                                          child: Container(
                                            width: Get.width * 0.26,
                                            height: Get.height * 0.043,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        31.000001907348633),
                                                color: Colors.deepOrange),
                                            child: Center(
                                              child: TextWidget(
                                                  text: "Completed",
                                                  color: Colors.white,
                                                  fsize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.deleteMainTask(documentId);

                                          },
                                          child: Container(
                                            width: Get.width * 0.26,
                                            height: Get.height * 0.043,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        31.000001907348633),
                                                color: Color(0xff048c44)),
                                            child: Center(
                                              child: TextWidget(
                                                  text: "Delete",
                                                  color: Colors.white,
                                                  fsize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]);
                          },
                          child: Container(
                            width: Get.width * 0.26,
                            height: Get.height * 0.043,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(31.000001907348633),
                                color: Colors.deepOrange),
                            child: Center(
                              child: TextWidget(
                                  text: "Todo",
                                  color: Colors.white,
                                  fsize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      });
}

Widget completeListWdiget(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser;
  final AddTaskController controller = Get.put(AddTaskController());

  return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user?.email) // Replace with the user's UID
          .collection('tasks').where('status',isEqualTo:'compelete')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading indicator while data is being fetched
          return Center(
            child: CircularProgressIndicator(
              color: Colors.deepOrangeAccent,
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
                      "You don't have any schedule today.\n Tap the plus button to create new task",
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
            itemBuilder: (context, index) {
              // Get task data from Firestore document
              var taskCompleteData = snapshot.data.docs[index].data();
              DateTime taskDate =
                  (taskCompleteData['date'] as Timestamp).toDate();
              String formattedDate = DateFormat('dd-MM-yyyy').format(taskDate);
              String documentId = snapshot.data.docs[index].id;



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
                        offset:
                            Offset(0, 2), // Specify the offset of the shadow
                        blurRadius: 6.0, // Specify the blur radius
                        spreadRadius: 2.0, // Specify the spread radius
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                                text: taskCompleteData['taskTitle'],
                                color: Color(0xff4F5753),
                                fsize: 13),
                            Container(
                                child: TextWidget(
                                    text: taskCompleteData['description'],
                                    color: Colors.green,
                                    fsize: 15)),
                            TextWidget(
                                text: formattedDate,
                                color: Color(0xff4F5753),
                                fsize: 10),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Get.defaultDialog(
                                title: "Task Status",
                                middleText: "do you wanna delete Task?",
                                actions: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.deleteMainTask(documentId);
                                          },
                                          child: Container(
                                            width: Get.width * 0.26,
                                            height: Get.height * 0.043,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        31.000001907348633),
                                                color: Color(0xff048c44)),
                                            child: Center(
                                              child: TextWidget(
                                                  text: "Delete",
                                                  color: Colors.white,
                                                  fsize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]);
                          },
                          child: Container(
                            width: Get.width * 0.26,
                            height: Get.height * 0.043,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(31.000001907348633),
                                color: Colors.green,),
                            child: Center(
                              child: TextWidget(
                                  text: "Complete",
                                  color: Colors.white,
                                  fsize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      });
}
