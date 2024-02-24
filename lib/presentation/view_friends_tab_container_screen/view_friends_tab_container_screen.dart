import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/presentation/friend_finder/friend_finder.dart';
import 'package:daone/presentation/view_friend_full_profile_page/controller/view_friend_full_profile_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_plus/share_plus.dart';
import '../../widgets/text_widget.dart';
import '../group_page/group_page.dart';
import 'controller/view_friends_tab_container_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/view_friend_full_profile_page/view_friend_full_profile_page.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('Friends and Groups',
              style: TextStyle(
                  fontFamily: 'Gotham Light',
                  fontWeight: FontWeight.w800,
                  fontSize: 23,
                  color: Colors.black)),
          leadingWidth: 68,
          leading: AppbarIconbutton(
            onTap: () {
              Get.back();
            },
            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              left: 10,
              top: 10,
              bottom: 10,
            ),
          ),
        ),
        body: SizedBox(
          width: double.maxFinite,
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: getVerticalSize(
                  48,
                ),
                width: Get.width,
                child: TabBar(
                  controller: controller.tabviewController,
                  labelColor: appTheme.deepOrangeA20005,
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  unselectedLabelColor: theme.colorScheme.primaryContainer,
                  unselectedLabelStyle:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: getPadding(
                    all: 2.0,
                  ),
                  indicator: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: appTheme.deepOrangeA20005, width: 1))),
                  tabs: [
                    Tab(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          "Users",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          "lbl_friends".tr,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          "lbl_groups".tr,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: controller.tabviewController,
                  children: [
                    //user Tab //

                    Container(
                      // color: Colors.orange,
                      width: Get.width,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('users')
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
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
                              if (!snapshot.hasData ||
                                  snapshot.data!.docs.isEmpty) {
                                return Text('No data available');
                              }

                              return ListView.builder(
                                itemCount: snapshot.data?.docs.length,
                                itemBuilder: (context, index) {
                                  final userData =
                                      snapshot.data?.docs[index].data();
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
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder(
                                              stream: FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(FirebaseAuth.instance
                                                      .currentUser?.email)
                                                  .snapshots(),
                                              builder: (context,
                                                  AsyncSnapshot<
                                                          DocumentSnapshot>
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
                                                  return Text(
                                                    'Document not found',
                                                    style:
                                                        TextStyle(fontSize: 5),
                                                  );
                                                }

                                                // Access the 'fullName' field from the document data
                                                String imageUrl =
                                                    snapshot.data!['imageUrl'];

                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 2.0,
                                                      vertical: 2),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.black26,
                                                    radius: 26,
                                                    backgroundImage: NetworkImage(
                                                        (userData as Map<String,
                                                                    dynamic>)[
                                                                'imageUrl'] ??
                                                            imageUrl),
                                                  ),
                                                );
                                              },
                                            ),
                                            Container(
                                              width: Get.width * 0.46,
                                              //  color: Colors.green,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: TextWidget(
                                                  text: (userData as Map<String,
                                                              dynamic>)[
                                                          'fullName'] ??
                                                      'No Name',
                                                  color: Colors.black,
                                                  fsize: 18),
                                            ),
                                            Spacer(),
                                            StreamBuilder(
                                                stream: FirebaseFirestore
                                                    .instance
                                                    .collection("users")
                                                    .doc(uid)
                                                    .collection('completeList')
                                                    .snapshots(),
                                                builder: (context,
                                                    AsyncSnapshot
                                                        snapshotTask) {
                                                  return StreamBuilder(
                                                      stream: FirebaseFirestore
                                                          .instance
                                                          .collection("users")
                                                          .doc(
                                                              userData['email'])
                                                          .collection(
                                                              'OwnAffirmationList')
                                                          .snapshots(),
                                                      builder: (context,
                                                          AsyncSnapshot
                                                              snapshot2) {
                                                        final videos =
                                                            FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'users')
                                                                .doc(userData[
                                                                    'email'])
                                                                .collection(
                                                                    'VideosUrl')
                                                                .get();

                                                        return InkWell(
                                                          onTap: () {
                                                            Get.showOverlay(
                                                                asyncFunction:
                                                                    () async {
                                                                  final blogRead = FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          'users')
                                                                      .doc(userData[
                                                                          'email'])
                                                                      .collection(
                                                                          'blogReadList')
                                                                      .get();
                                                                  await blogRead.then(
                                                                      (QuerySnapshot
                                                                          snapshotBlog) {
                                                                    int blogLength =
                                                                        snapshotBlog
                                                                            .docs
                                                                            .length;
                                                                    final videos = FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            'users')
                                                                        .doc(userData[
                                                                            'email'])
                                                                        .collection(
                                                                            'VideosUrl')
                                                                        .get();
                                                                    videos.then(
                                                                        (QuerySnapshot
                                                                            snapshot) {
                                                                      int length = snapshot
                                                                          .docs
                                                                          .length;
                                                                      Get.bottomSheet(
                                                                        ViewFriendFullProfilePage(
                                                                          Get.put(
                                                                              ViewFriendFullProfileController()),
                                                                          affirmationCount:
                                                                              snapshot2.data.docs.length ?? 0,
                                                                          blogReadCount:
                                                                              blogLength.toString() ?? '0',
                                                                          intenseCompleted:
                                                                              length ?? '0',
                                                                          taskCount:
                                                                              snapshotTask.data.docs.length ?? 0,
                                                                          userName:
                                                                              userData['fullName'] ?? '0',
                                                                          number:
                                                                              userData['phoneNumber'] ?? '0',
                                                                          key:
                                                                              key,
                                                                          userProfile:
                                                                              userData['imageUrl'] ?? '',
                                                                          email:
                                                                              userData['email'] ?? '',
                                                                          name: userData['fullName'] ??
                                                                              '',
                                                                        ),
                                                                        backgroundColor:
                                                                            Colors.white,
                                                                        isScrollControlled: true
                                                                      );
                                                                    });
                                                                  });
                                                                },
                                                                loadingWidget:
                                                                    Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 60,
                                                                    height: 60,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: Colors
                                                                          .deepOrange,
                                                                    ),
                                                                  ),
                                                                ));
                                                          },
                                                          child: Container(
                                                            width: Get.width *
                                                                0.21,
                                                            height: Get.height *
                                                                0.04,
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
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 11,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                }),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          Positioned(
                            bottom: 10,
                            child: InkWell(
                              onTap: () {
                                String inviteMessage =
                                    "Hey! Check out this awesome app. Download it now!";

                                // Share the invitation message
                                Share.share(inviteMessage);
                              },
                              child: Container(
                                width: Get.width * 0.64,
                                height: Get.height * 0.075,
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(59),
                                ),
                                child: Center(
                                    child: TextWidget(
                                  text: 'Invite Friends',
                                  color: Colors.white,
                                  fontFamily: 'Gotham light',
                                  fontWeight: FontWeight.w800,
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //  Friends Tab   //

                    Container(
                      width: Get.width,
                      child: Stack(
                        children: [
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('users')
                                .doc(user?.email)
                                .collection('FriendList')
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
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
                              if (!snapshot.hasData ||
                                  snapshot.data!.docs.isEmpty) {
                                return Center(child: Text('No data available'));
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.docs.isEmpty) {
                                return Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                                  text: "Add Friends",
                                                  color: Colors.white,
                                                  fsize: 15)),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else
                                return ListView.builder(
                                  itemCount: snapshot.data?.docs.length,
                                  itemBuilder: (context, index) {
                                    final userData =
                                        snapshot.data?.docs[index].data();

                                    final uid = snapshot.data?.docs[index]
                                        .id; // Retrieve the UID
                                    final imageUrl = (userData
                                        as Map<String, dynamic>)['imageUrl'];
                                    final friendName = (userData
                                        as Map<String, dynamic>)['name'];
                                    final number = (userData
                                        as Map<String, dynamic>)['number'];

                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: Get.height * 0.11,
                                        width: Get.width * 0.9,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                                  StreamBuilder(
                                                    stream: FirebaseFirestore
                                                        .instance
                                                        .collection('users')
                                                        .doc(FirebaseAuth
                                                            .instance
                                                            .currentUser
                                                            ?.email)
                                                        .snapshots(),
                                                    builder: (context,
                                                        AsyncSnapshot<
                                                                DocumentSnapshot>
                                                            snapshot) {
                                                      if (snapshot
                                                              .connectionState ==
                                                          ConnectionState
                                                              .waiting) {
                                                        // While the data is being fetched, you can return a loading indicator or an empty widget.
                                                        return CircularProgressIndicator(); // Replace with your loading indicator widget
                                                      }

                                                      if (snapshot.hasError) {
                                                        // Handle errors here
                                                        return Text(
                                                            'Error: ${snapshot.error}');
                                                      }

                                                      if (!snapshot.hasData ||
                                                          !snapshot
                                                              .data!.exists) {
                                                        // Handle the case where the document doesn't exist
                                                        return Text(
                                                            'Document not found');
                                                      }

                                                      // Access the 'fullName' field from the document data
                                                      String imageUrl = snapshot
                                                          .data!['imageUrl'];

                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 2.0,
                                                                vertical: 2),
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                              Colors.black26,
                                                          radius: 26,
                                                          backgroundImage:
                                                              NetworkImage(userData[
                                                                      'imageUrl'] ??
                                                                  'https://img.icons8.com/?size=50&id=14736&format=png'),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8),
                                                      width: Get.width * 0.47,
                                                      //  color: Colors.red,
                                                      child: TextWidget(
                                                          text: friendName ??
                                                              'N/A',
                                                          color: Colors.black,
                                                          fsize: 18)),
                                                  // Add the rest of your user data widgets here.

                                                  Spacer(),

                                                  StreamBuilder(
                                                      stream: FirebaseFirestore
                                                          .instance
                                                          .collection("users")
                                                          .doc(uid)
                                                          .collection(
                                                              'completeList')
                                                          .snapshots(),
                                                      builder: (context,
                                                          AsyncSnapshot
                                                              snapshotTask) {
                                                        return StreamBuilder(
                                                            stream: FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    "users")
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
                                                                    // backgroundColor: Colors.white,
                                                                    //
                                                                    // title:
                                                                    //     'Profile',
                                                                    // content:
                                                                    userProfile(
                                                                      context,
                                                                      name:
                                                                          friendName,
                                                                      email: userData[
                                                                          'email'],
                                                                      phone: number ??
                                                                          'N/A',
                                                                      imgUrl: userData[
                                                                          'imageUrl'],
                                                                    ),
                                                                  );

                                                                  // Get.defaultDialog(title: "Profile",
                                                                  //     content:profileView(
                                                                  //       name: (userData)['fullName'],
                                                                  //       unfollowEmail: userData['email'],
                                                                  //       affirmation:  snapshot2.data.docs.length,
                                                                  //        blogReads: 15,
                                                                  //        intention: 12,
                                                                  //        task:snapshotTask.data.docs.length,
                                                                  //        imageUrl:  userData['imageUrl'],
                                                                  //         fullName: (userData)['fullName']),
                                                                  // );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width:
                                                                      Get.width *
                                                                          0.21,
                                                                  height:
                                                                      Get.height *
                                                                          0.04,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
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
                                                                          fontSize:
                                                                              11,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                  ),
                                                                ), //ViewMore Button
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
                          Positioned(
                              bottom: 20,
                              right: 20,
                              child: FloatingActionButton(
                                backgroundColor: Colors.deepOrange,
                                onPressed: () {
                                  Get.to(FriendFinderPage());
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ))
                        ],
                      ),
                    ),

                    // Groups //

                    GroupPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget userProfile(BuildContext context,
      {required String imgUrl, name, email, phone}) {
    ViewFriendFullProfileController controller =
        Get.put(ViewFriendFullProfileController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 200,
            width: Get.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      url: imgUrl ??
                          'https://img.icons8.com/?size=50&id=14736&format=png',
                      fit: BoxFit.cover,
                      height: getSize(
                        120,
                      ),
                      width: getSize(
                        120,
                      ),
                      radius: BorderRadius.circular(
                        getHorizontalSize(
                          120,
                        ),
                      ),
                      alignment: Alignment.topCenter,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            //   color: Colors.orange,for test
                            width: Get.width * 0.4,
                            child: TextWidget(
                              text: name ?? 'No name',
                              color: Colors.black,
                              fsize: 18,
                              fontWeight: FontWeight.w800,
                            )),
                        SizedBox(height: 5),
                        Container(
                            width: Get.width * 0.4,
                            //  color: Colors.green,for test
                            child: TextWidget(
                              text: email ?? 'xyz@gmail.com',
                              color: Colors.black,
                              fsize: 12,
                              fontWeight: FontWeight.w600,
                            )),
                        SizedBox(height: 5),
                        Container(
                            // color: Colors.orange, for test
                            width: Get.width * 0.4,
                            child: TextWidget(
                              text: phone ?? 'No Number',
                              color: Colors.black,
                              fsize: 12,
                              fontWeight: FontWeight.w600,
                            )),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            controller.deleteFriend(context, name);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8)),
                            padding: EdgeInsets.all(5),
                            child: TextWidget(
                                text: "Unfollow",
                                color: Colors.white,
                                fontFamily: 'Gotham Light'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
