import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/presentation/add_task_screen/add_task_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widgets/text_widget.dart';
import '../badges/badgeslist.dart';
import 'controller/select_task_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SelectTaskScreen extends GetWidget<SelectTaskController> {
  SelectTaskScreen({Key? key})
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
          height: Get.height*0.6,
          width: Get.width*1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser?.email)
                    .collection('OwnAffirmationList')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (snapshot.data?.docs.isEmpty ?? true) {
                    // Handle the case when there are no documents
                    return Center(
                      child: Text('No documents found'),
                    );
                  } else {
                    final data = snapshot.data!.docs.length;

                    List<int> createNumberList(int n) {
                      return List<int>.generate(n, (index) => index + 1);
                    }

                    int itemCount = (data / 100).ceil(); // Calculate the number of grid items
                    List<int> numberList = createNumberList(itemCount);
                    final newNum = numberList.last;

                    return Container(
                      width: Get.width * 0.5,
                      height: Get.height * 0.22,
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          print(newNum);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(badges[newNum % badges.length - 1]),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
              //old
              // StreamBuilder(
              //   stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.email).collection('OwnAffirmationList').snapshots(),
              //   builder: (context, AsyncSnapshot snapshot) {
              //     final data = snapshot.data?.docs.length == 0 ? 1 : snapshot.data?.docs.length;
              //
              //
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return Center(
              //         child: Container(
              //           height: 50,
              //           width: 50,
              //           child: CircularProgressIndicator(
              //             color: Colors.deepOrangeAccent,
              //           ),
              //         ),
              //       );
              //     } else {
              //       List<int> createNumberList(int n) {
              //         List<int> result = List<int>.generate(n, (index) => index + 1);
              //         return result;
              //       }
              //       int itemCount = (data / 100).ceil(); // Calculate the number of grid items
              //       List<int> numberList = createNumberList(itemCount);
              //       final newNum =numberList.last;
              //
              //       return Container(
              //          //color: Colors.deepOrange,
              //         width: Get.width*0.5,
              //         height:Get.height*0.22,
              //         child: ListView.builder(
              //           itemCount:1,
              //           itemBuilder: (context, index) {
              //             print(newNum);
              //             return  Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: Image.asset(badges[newNum % badges.length - 1],),
              //             );
              //             // return Center(
              //             //   child: Container(
              //             //     width: Get.width*0.28,
              //             //     height:Get.height*0.1,
              //             //     decoration: BoxDecoration(
              //             //     color: Colors.lightBlue,
              //             //       // image: DecorationImage(image: AssetImage(badges[newNum % badges.length - 1]),fit: BoxFit.cover),
              //             //     ),
              //             //    // child: Image.asset(badges[newNum % badges.length - 1],),
              //             //   ),
              //             // );
              //           },
              //         ),
              //       );
              //     }
              //   },
              // ),
              SizedBox(
                height: Get.height*0.02,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.email).snapshots(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // While the data is being fetched, you can return a loading indicator or an empty widget.
                    return CircularProgressIndicator(); // Replace with your loading indicator widget
                  }

                  if (snapshot.hasError) {
                    // Handle errors here
                    return Text('Error: ${snapshot.error}');
                  }

                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    // Handle the case where the document doesn't exist
                    return Text('Document not found');
                  }

                  // Access the 'fullName' field from the document data
                  String fullName = snapshot.data!['fullName'];

                  return TextWidget(text: fullName,color: Colors.black,fsize: 25,font: FontWeight.w600,);
                },
              ),
              SizedBox(
                height: Get.height*0.05,
              ),
              InkWell(
                onTap: (){
                 _showTaskOptions(context);
//              Get.to(()=>AddTaskScreen(taskType: 'WorkOut'));
                  //    Get.toNamed(AppRoutes.addTaskScreen);
                },
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadiusStyle.roundedBorder14,
                  child: Container(
                    // margin: getMargin(
                    //   top: 43,
                    // ),
                    padding: getPadding(
                      left: 109,
                      top: 19,
                      right: 109,
                      bottom: 19,
                    ),
                    decoration: AppDecoration.fill3.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder14,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgPlus,
                          height: getSize(
                            22,
                          ),
                          width: getSize(
                            22,
                          ),
                          margin: getMargin(
                            top: 3,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 6,
                          ),
                          child: Text(
                            "lbl_add_new_task".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.titleSmallPoppinsWhiteA700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showTaskOptions(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a Task'),
          content: Container(
            height: Get.height*0.22,
            child: Column(
              children: [
                ListTile(
                  title: Text(taskType1),
                  onTap: () {
                    Get.to(()=>AddTaskScreen(taskType: taskType1));

                    // Handle task 1 selection
                   // Navigator.pop(context); // Close the dialog
                  },
                ),
                ListTile(
                  title: Text(taskType2),
                  onTap: () {
                    Get.to(()=>AddTaskScreen(taskType: taskType2));

                  },
                ),
                // ListTile(
                //   title: Text(taskType3),
                //   onTap: () {
                //     Get.to(()=>AddTaskScreen(taskType:taskType3));
                //   },
                // ),
                ListTile(
                  title: Text(taskType4),
                  onTap: () {
                    Get.to(()=>AddTaskScreen(taskType: taskType4));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  String taskType1 = 'Workout';
  String taskType2 = 'Job';
  String taskType3 = 'Sleep';
  String taskType4 = 'Event';


}
