import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/presentation/view_friend_full_profile_page/controller/view_friend_full_profile_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/text_widget.dart';
import '../add_new_friends_dialog/add_new_friends_dialog.dart';
import '../add_new_friends_dialog/controller/add_new_friends_controller.dart';
import 'controller/view_friends_tab_container_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/view_friend_full_profile_page/view_friend_full_profile_page.dart';
import 'package:daone/presentation/view_friends_page/view_friends_page.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ViewFriendsTabContainerScreen
    extends GetWidget<ViewFriendsTabContainerController> {
  const ViewFriendsTabContainerScreen({Key? key})
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
        appBar: CustomAppBar(
          height: getVerticalSize(
            97,
          ),
          leadingWidth: 77,
          leading: AppbarIconbutton(
            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              left: 29,
              top: 4,
              bottom: 4,
            ),
          ),
          centerTitle: true,
          title: AppbarSubtitle2(
            text: "Friends and Group",
          ),
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: getVerticalSize(
                  40,
                ),
                width: getHorizontalSize(
                  305,
                ),
                margin: getMargin(
                  top: 42,
                ),
                decoration: BoxDecoration(
                  color: appTheme.gray20001,
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      20,
                    ),
                  ),
                ),
                child: TabBar(
                  controller: controller.tabviewController,
                  labelColor: appTheme.whiteA700,
                  labelStyle: TextStyle(),
                  unselectedLabelColor: theme.colorScheme.primaryContainer,
                  unselectedLabelStyle: TextStyle(),
                  indicatorPadding: getPadding(
                    all: 2.0,
                  ),
                  indicator: BoxDecoration(
                    color: appTheme.deepOrangeA20005,
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        18,
                      ),
                    ),
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        "Users",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "lbl_friends".tr,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "lbl_groups".tr,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getVerticalSize(
                  633,
                ),
                child: TabBarView(
                  controller: controller.tabviewController,
                  children: [
                    //user Tab //

                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: Container(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(
                                  color: Colors.deepOrange),
                            ),
                          ); // Loading indicator while data is loading.
                        }
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Text('No data available');
                        }

                        return ListView.builder(
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            final userData = snapshot.data?.docs[index].data();
                            final uid = snapshot
                                .data?.docs[index].id; // Retrieve the UID
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: Get.height * 0.11,
                                width: Get.width * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white24,
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 2.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(0, 2),
                                      blurRadius: 6.0,
                                      spreadRadius: 2.0,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // Replace this with the actual user image data.
                                          // Image.asset(ImageConstant.profile2, scale: 4),
                                          StreamBuilder(
                                            stream: FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(FirebaseAuth.instance
                                                    .currentUser?.email)
                                                .snapshots(),
                                            builder: (context,
                                                AsyncSnapshot<DocumentSnapshot>
                                                    snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                // While the data is being fetched, you can return a loading indicator or an empty widget.
                                                return CircularProgressIndicator(); // Replace with your loading indicator widget
                                              }

                                              if (snapshot.hasError) {
                                                // Handle errors here
                                                return Text(
                                                    'Error: ${snapshot.error}');
                                              }

                                              if (!snapshot.hasData ||
                                                  !snapshot.data!.exists) {
                                                // Handle the case where the document doesn't exist
                                                return Text(
                                                    'Document not found');
                                              }

                                              // Access the 'fullName' field from the document data
                                              String imageUrl =
                                                  snapshot.data!['imageUrl'];

                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 8),
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  radius: 20,
                                                  backgroundImage: NetworkImage(
                                                      controller
                                                              .user?.photoURL ??
                                                          imageUrl),
                                                ),
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12.0, vertical: 10),
                                            child: Text(
                                              (userData as Map<String,
                                                      dynamic>)?['fullName'] ??
                                                  'No Name',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          // Add the rest of your user data widgets here.

                                          Spacer(),

                                          StreamBuilder(
                                              stream: FirebaseFirestore.instance
                                                  .collection("users")
                                                  .doc(uid)
                                                  .collection('completeList')
                                                  .snapshots(),
                                              builder: (context,
                                                  AsyncSnapshot snapshotTask) {
                                                return StreamBuilder(
                                                    stream: FirebaseFirestore
                                                        .instance
                                                        .collection("users")
                                                        .doc(uid)
                                                        .collection(
                                                            'OwnAffirmationList')
                                                        .snapshots(),
                                                    builder: (context,
                                                        AsyncSnapshot
                                                            snapshot2) {
                                                      return InkWell(
                                                        onTap: () {
                                                          Get.dialog(
                                                              AlertDialog(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10),
                                                                  insetPadding:
                                                                      const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              0),
                                                                  content:
                                                                      ViewFriendFullProfilePage(
                                                                    Get.put(
                                                                        ViewFriendFullProfileController()),
                                                                    affirmationCount:
                                                                        snapshot2
                                                                            .data
                                                                            .docs
                                                                            .length,
                                                                    blogReadCount:
                                                                        3,
                                                                    intenseCompleted:
                                                                        13,
                                                                    taskCount:
                                                                        snapshotTask
                                                                            .data
                                                                            .docs
                                                                            .length,
                                                                    userName:
                                                                        userData[
                                                                            'fullName'],
                                                                    key: key,
                                                                    userProfile:
                                                                        userData[
                                                                            'imageUrl'],
                                                                  )));
                                                          // Navigate to the full profile page.
                                                          // Get.toNamed(AppRoutes.viewFriendFullProfilePage);
                                                          //AddNewFriendsDialog(Get.put(AddNewFriendsController(),),),
                                                        },
                                                        child: Container(
                                                          width:
                                                              Get.width * 0.21,
                                                          height:
                                                              Get.height * 0.04,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        31.0),
                                                            color: Color(
                                                                0xff048c44),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "View More",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 11,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              }),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),

                    //  Friends Tab   //
                    FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection('users')
                            .doc(user!.email)
                            .collection('friendList')
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  child: CircularProgressIndicator(
                                    color: Colors.deepOrange,
                                  )),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                                child: TextWidget(
                                    text: "Error",
                                    color: Colors.red,
                                    fsize: 17));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: Image.asset(
                                      "assets/images/OBJECTS.png",
                                      scale: 2,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.06,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: Get.height * 0.07,
                                      width: Get.width * 0.8,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.deepOrange),
                                      child: Center(
                                          child: TextWidget(
                                              text:

                                                  "Add Friends",
                                              color: Colors.white,
                                              fsize: 15)),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else
                            return Container(
                              child: TextWidget(
                                  text: "FriendList",
                                  color: Colors.black,
                                  fsize: 26),
                            );
                        }),

                    ViewFriendsPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
