import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../add_task_screen/controller/add_task_controller.dart';
import '../badges/badgeslist.dart';
import 'controller/home_one_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

// ignore_for_file: must_be_immutable
class HomeOneScreen extends GetWidget<HomeOneController> {
  const HomeOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final user = FirebaseAuth.instance.currentUser;
    final AddTaskController controller = Get.put(AddTaskController());
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: appTheme.whiteA700,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.03,
                    ),
                    StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('users').doc(user!.email).
                      collection('OwnAffirmationList').snapshots(),
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
                            //color: Colors.deepOrange,
                            width: Get.width*0.2,
                            height:Get.height*0.09,
                            child: ListView.builder(
                              itemCount:1,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Center(
                                    child: Container(
                                      width: Get.width*0.2,
                                      height:Get.height*0.08,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage(badges[newNum % badges.length - 1 ]),fit: BoxFit.cover),
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
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                            text: "lbl_welcome_back2".tr,
                            color: Colors.black38,
                            fsize: 12),
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

                            return Padding(
                              padding: getPadding(
                                top: 1,
                              ),
                              child:TextWidget(text: fullName,color: Colors.black,
                                  fsize: 20,
                                  font: FontWeight.bold),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      width: Get.width * 0.36,
                    ),
               //     Image.asset(ImageConstant.notificationIcon, scale: 3.3),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.blogScreen);
                },
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('blogs')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(color: Colors.deepOrange,);
                    }
                    // Ensure there are documents in the collection
                    if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                      return Text('No blogs found');
                    }

                    // Determine the total number of items
                    int totalItems = snapshot.data!.docs.length;

                    // Generate a random number within the valid range
                    Random random = Random();
                    int itemCount = random.nextInt(totalItems);

                    var document = snapshot.data!.docs[itemCount];
                    var image = document['imageUrl'];
                    var blogData = document.data() as Map<String, dynamic>;

                    return Container(
                      height: Get.height * 0.15,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: getVerticalSize(124),
                            width: getHorizontalSize(317),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  height: getVerticalSize(124),
                                  width: getHorizontalSize(317),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(image),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(22)),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: getVerticalSize(90),
                                    width: getHorizontalSize(273),
                                    margin: getMargin(bottom: 11),
                                    child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: SizedBox(
                                            width: getHorizontalSize(205),
                                            child: Text(
                                              document['description'],
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .titleSmallPoppinsWhiteA70015,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 80,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.2),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.deepOrange.withOpacity(
                                                    0.3), // Adjust shadow color and opacity
                                                spreadRadius:
                                                    5, // Spread radius
                                                blurRadius: 7, // Blur radius
                                                offset: Offset(0,
                                                    3), // Shadow offset (x, y)
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(22),
                                            ),
                                          ),
                                          child: Center(
                                              child: TextWidget(
                                                  text: "Read more",
                                                  color: Colors.white,
                                                  fsize: 10)),
                                        ),
                                      ],
                                    ),
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
              ),
              CustomImageView(
                svgPath: ImageConstant.imgGroup10071,
                height: getVerticalSize(
                  5,
                ),
                width: getHorizontalSize(
                  57,
                ),
                margin: getMargin(
                  top: 7,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 19.0, right: 19, bottom: 7, top: 18),
                child: Row(
                  children: [
                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(user?.email)
                          .collection('tasks')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> alltaskSnapshot) {
                        int decimalPlaces = 2;
                        double percentage = 0.0; // Initialize percentage to 0

                        return StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user?.email) // Replace with the user's UID
                              .collection('tasks').where('status',isEqualTo:'compelete')
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> completeTaskSnapshot) {
                            if (alltaskSnapshot.hasData &&
                                alltaskSnapshot.data.docs.length > 0) {
                              // Check if there's data and the length is greater than 0
                              percentage = (completeTaskSnapshot.hasData
                                      ? completeTaskSnapshot.data.docs.length
                                      : 0) /
                                  alltaskSnapshot.data.docs.length *
                                  100.0;
                            }

                            int per = percentage.isNaN ? 0 : percentage.toInt();

                            return Container(
                              height: Get.height * 0.26,
                              width: Get.width * 0.43,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Color(0xfffd785a),
                                    Color(0xfff46735)
                                  ],
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment(0, -1),
                                    child: Image.asset(ImageConstant.vector9,
                                        scale: 4),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Image.asset(ImageConstant.vector9,
                                        scale: 4),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: Get.height * 0.02,
                                        ),
                                        CircularPercentIndicator(
                                          radius: 53.0,
                                          lineWidth: 15.0,
                                          percent: percentage / 100.0,
                                          center: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextWidget(
                                                text: per.toString(),
                                                color: Colors.white,
                                                fsize: 20,
                                              ),
                                              TextWidget(
                                                text: "%",
                                                color: Colors.white,
                                                fsize: 20,
                                              ),
                                            ],
                                          ),
                                          progressColor: Colors.green,
                                          backgroundColor: Colors.white,
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.005,
                                        ),
                                        TextWidget(
                                          text: "Completed",
                                          color: Colors.white,
                                          fsize: 20,
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.001,
                                        ),
                                        TextWidget(
                                          text: completeTaskSnapshot.hasData
                                              ? completeTaskSnapshot
                                                  .data.docs.length
                                                  .toString()
                                              : "0",
                                          color: Colors.white,
                                          fsize: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),

                    SizedBox(
                      width: Get.width * 0.03,
                    ),

                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.selectAffirmationScreen);
                      },
                      child: Container(
                        height: Get.height * 0.26,
                        width: Get.width * 0.43,
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("users")
                                .doc(user?.uid)
                                .collection('OwnAffirmationList')
                                .snapshots(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                // Loading indicator while data is being fetched
                                return Center(
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: CircularProgressIndicator(
                                      color: Colors.deepOrangeAccent,
                                    ),
                                  ),
                                );
                              }
                              if (snapshot.hasError) {
                                // Handle errors here
                                return Text('Error: ${snapshot.error}');
                              }

                              if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
                                return Container(
                                  height: Get.height * 0.26,
                                  width: Get.width * 0.43,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage("https://images.unsplash.com/photo-1621091211034-53136cc1eb32?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGJhY2tncm91bmQlMjBpbWFnZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      TextWidget(
                                        text: "NO AFFIRMATIONS",
                                        color: Colors.black38,
                                        fsize: 14,
                                        font: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                );
                              }

                              int totalItems = snapshot.data.docs.length;
                              Random random = Random();
                              int itemCount = random.nextInt(totalItems);

                              var document = snapshot.data.docs[itemCount];

                              return Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    final affirmationData = snapshot.data.docs[index].data();
                                 return Container(
                                   height: Get.height * 0.26,
                                   width: Get.width * 0.43,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(15),
                                     image: DecorationImage(
                                       image: NetworkImage(affirmationData['imageUrl']),
                                       fit: BoxFit.cover,
                                     ),
                                   ),
                                   child: Stack(
                                     children: [Center(child: TextWidget(text: affirmationData['affirmation'],fsize: 13,color: Colors.black,)),
                                     Align(
                                       alignment: Alignment.bottomCenter,
                                         child: Padding(
                                           padding: const EdgeInsets.all(8.0),
                                           child: Container(
                                               decoration: BoxDecoration(
                                                 color: Colors.black12,
                                                 borderRadius: BorderRadius.circular(15),
                                               ),
                                               child: Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: TextWidget(text:"Click to see more Affirmations",fsize: 8,color: Colors.black,),
                                               )),
                                         )
                                     ),
                                     ],
                                   ),
                                 );
                                  },
                                ),
                              );
                            },
                          )

                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.dailyIntensionRecordOneScreen);
                      },
                      child: Container(
                        height: Get.height * 0.26,
                        width: Get.width * 0.43,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image:
                                  AssetImage(ImageConstant.virtualizationImg),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.03,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.dailyIntensionRecordScreen);
                      },
                      child: Container(
                        height: Get.height * 0.26,
                        width: Get.width * 0.43,
                        decoration: BoxDecoration(
                          color: Color(0xff048C44),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment(0, -1),
                              child:
                                  Image.asset(ImageConstant.vector10, scale: 1),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child:
                                  Image.asset(ImageConstant.vector10, scale: 1),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Image.asset(ImageConstant.ladyImg, scale: 4),
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                  TextWidget(
                                      text: "Daily Intention",
                                      color: Colors.white,
                                      fsize: 16),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
