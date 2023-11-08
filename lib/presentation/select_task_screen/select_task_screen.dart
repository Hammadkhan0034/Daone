import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/presentation/select_task_screen/Alarm/Alarm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widgets/text_widget.dart';
import '../badges/badgeslist.dart';
import 'controller/select_task_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SelectTaskScreen extends GetWidget<SelectTaskController> {
  const SelectTaskScreen({Key? key})
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
              top: 27,
            ),
            child: Padding(
              padding: getPadding(
                left: 29,
                right: 29,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Spacer(
                        flex: 46,
                      ),
                      SizedBox(
                        height: getVerticalSize(
                          130,
                        ),
                        width: getHorizontalSize(
                          108,
                        ),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child:StreamBuilder(
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

                                  return Padding(
                                    padding: getPadding(
                                      top: 1,
                                    ),
                                    child:TextWidget(text: fullName,color: Colors.black,fsize: 20),
                                  );
                                },
                              ),
                            ),
                            StreamBuilder(
                              stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.email).collection('OwnAffirmationList').snapshots(),
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
                                  List<int> createNumberList(int n) {
                                    List<int> result = List<int>.generate(n, (index) => index + 1);
                                    return result;
                                  }
                                  int itemCount = (data / 100).ceil(); // Calculate the number of grid items
                                  List<int> numberList = createNumberList(itemCount);
                                  final newNum =numberList.last;

                                  return Container(
                                   // color: Colors.deepOrange,
                                    width: Get.width*0.3,
                                    height:Get.height*0.13,
                                    child: ListView.builder(
                                      itemCount:1,
                                      itemBuilder: (context, index) {
                                        print(newNum);
                                        return Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Center(
                                            child: Container(
                                              width: Get.width*0.28,
                                              height:Get.height*0.1,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(image: AssetImage(badges[newNum % badges.length - 1]),fit: BoxFit.cover),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Spacer(
                        flex: 53,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      Get.toNamed(AppRoutes.addTaskScreen);
                    },
                    child: Container(
                      margin: getMargin(
                        top: 43,
                      ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:20.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.addTaskScreen);
                          },
                          child: Container(
                            height: Get.height*0.18,
                            width: Get.width*0.35,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                                color: Color(0x3f858fe9)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: Get.width*0.15,
                                    height: Get.height*0.067,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Color(0xff858fe9),
                                    image: DecorationImage(image: AssetImage(ImageConstant.workout,),scale: 2),
                                    ),
                                ),
                                SizedBox( height: Get.height*0.01,),
                                TextWidget(text: "Workout", color: Color(0xff10275A), fsize: 12,font: FontWeight.w600),
                              ],
                            ),
                          ),
                        ),
                        SizedBox( width: Get.width*0.13,),
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.addTaskScreen);
                          },
                          child: Container(
                            height: Get.height*0.18,
                            width: Get.width*0.35,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0x3f7fc9e7),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: Get.width*0.15,
                                    height: Get.height*0.067,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Color(0xff7FC9E7),
                                    image: DecorationImage(image: AssetImage(ImageConstant.job,),scale: 4),
                                    ),
                                ),
                                SizedBox( height: Get.height*0.01,),
                                TextWidget(text: "Job", color: Color(0xff10275A), fsize: 12,font: FontWeight.w600),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:20.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.sleepTrackingRoute);
                          },
                          child: Container(
                            height: Get.height*0.18,
                            width: Get.width*0.35,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                                color: Color(0x3fffe4e4)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: Get.width*0.15,
                                    height: Get.height*0.067,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Color(0xffe77d7d),
                                    image: DecorationImage(image: AssetImage(ImageConstant.moon,),scale: 4),
                                    ),
                                ),
                                SizedBox( height: Get.height*0.01,),
                                TextWidget(text: "Sleep Tracker", color: Color(0xff10275A), fsize: 12,font: FontWeight.w600),
                              ],
                            ),
                          ),
                        ),
                        SizedBox( width: Get.width*0.13,),
                        InkWell(
                          onTap: (){
                            Get.to(()=>AlarmView());
                             // Get.to(()=>AlarmScreen());
                          },
                          child: Container(
                            height: Get.height*0.18,
                            width: Get.width*0.35,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                                color: Color(0x3f858fe9)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: Get.width*0.15,
                                    height: Get.height*0.067,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                      color: Color(0xff858fe9),
                                    image: DecorationImage(image: AssetImage(ImageConstant.calender),scale: 4),
                                    ),
                                ),
                                SizedBox( height: Get.height*0.01,),
                                TextWidget(text: "Alarm", color: Color(0xff10275A), fsize: 12,font: FontWeight.w600),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
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
