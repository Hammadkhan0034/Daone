import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/presentation/view_friend_full_profile_page/controller/view_friend_full_profile_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../widgets/text_widget.dart';
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
            onTap: (){
              Get.back();
            },
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
                                                return Text(
                                                    'Document not found');
                                              }

                                              // Access the 'fullName' field from the document data
                                              String imageUrl =
                                                  snapshot.data!['imageUrl'];

                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 2.0,
                                                        vertical: 2),
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.black26,
                                                  radius: 26,
                                                  backgroundImage: NetworkImage(
                                                      (userData as Map<String,dynamic>)['imageUrl'] ??
                                                          imageUrl),
                                                ),
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12.0, vertical: 10),
                                            child: TextWidget(text: (userData as Map<String,
                                                dynamic>)?['fullName'] ??
                                                'No Name',color: Colors.black,fsize: 18),
                                          ),
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
                                                        .doc(user!.email)
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
                                                                  content: ViewFriendFullProfilePage(
                                                                    Get.put(
                                                                        ViewFriendFullProfileController()),
                                                                    affirmationCount:
                                                                        snapshot2
                                                                            .data
                                                                            .docs
                                                                            .length??0,
                                                                    blogReadCount:
                                                                        3??0,
                                                                    intenseCompleted:
                                                                        13??0,
                                                                    taskCount:
                                                                        snapshotTask
                                                                            .data
                                                                            .docs
                                                                            .length??0,
                                                                    userName:
                                                                        userData[
                                                                            'fullName']??0,
                                                                    key: key,
                                                                    userProfile:
                                                                        userData[
                                                                            'imageUrl']??'',
                                                                    email: userData['email']??'',
                                                                    name:  userData[
                                                                    'fullName']??'',
                                                                  )));

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
                                                        ),   //ViewMore Button
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
                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('users').doc(user?.email).collection('FriendList')
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
                        }else if (!snapshot.hasData ||
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
                        }else
                        return ListView.builder(
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            final userData = snapshot.data?.docs[index].data();

                            final uid = snapshot
                                .data?.docs[index].id; // Retrieve the UID
                            final imageUrl =(userData as Map<String,dynamic>)['imageUrl'];
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
                                                    horizontal: 2.0,
                                                    vertical: 2),
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                  Colors.black26,
                                                  radius: 26,
                                                  backgroundImage: NetworkImage(
                                                      userData['imageUrl']?? 'https://img.icons8.com/?size=50&id=14736&format=png'),
                                                ),
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12.0, vertical: 10),
                                            child: TextWidget(text: userData['fullName'] ??
                                                'No Name',color: Colors.black,fsize: 18),
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
                                                          Get.defaultDialog(
                                                            title: 'Profile',
                                                            content: userProfile(name:
                                                                userData['fullName'],
                                                             email:  userData['email'],
                                                             phone:  userData['phoneNumber'], imgUrl:userData['imageUrl'],
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
                                                        ),   //ViewMore Button
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


                    // Groups //

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
  Widget userProfile({required String imgUrl,name,email,phone}){
    return Container(
      height: Get.height*0.164,
      width: Get.width*0.6,
      child: Column(
        children: [
        Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  url: imgUrl??
                      'https://img.icons8.com/?size=50&id=14736&format=png',fit: BoxFit.cover,
                  height: getSize(
                    120,
                  ),
                  width: getSize(
                    120,
                  ),
                  radius: BorderRadius.circular(
                    getHorizontalSize(
                      40,
                    ),
                  ),
                  alignment: Alignment.topCenter,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Column(
                    children: [
                      Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: TextWidget(text: name??'No name', color: Colors.black, fsize: 20,font:FontWeight.w600,),
                          ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Container(child: TextWidget(
                          text: email??'xxx@gmail.com', color: Colors.black, fsize: 10,font:FontWeight.w600,)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Container(child: TextWidget(
                          text: phone??'No Number', color: Colors.black, fsize: 10,font:FontWeight.w600,)),
                      ),
                    ],
                  ),
                ),

        ],
      ),

    ],));

  }





// Widget profileView({var imageUrl,fullName,required int affirmation,required String name,
//   required int intention,required int task,required int blogReads,required String unfollowEmail}){
//
//   ViewFriendFullProfileController friendFullProfileController = Get.put(ViewFriendFullProfileController());
//
//   return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 18.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomImageView(
//                   url: imageUrl??
//                       'https://img.icons8.com/?size=50&id=14736&format=png',fit: BoxFit.cover,
//                   height: getSize(
//                     70,
//                   ),
//                   width: getSize(
//                     70,
//                   ),
//                   radius: BorderRadius.circular(
//                     getHorizontalSize(
//                       40,
//                     ),
//                   ),
//                   alignment: Alignment.topCenter,
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextWidget(text: fullName??'', color: Colors.black, fsize: 15,font:FontWeight.w600,),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: InkWell(
//                         onTap: (){
//                           Get.defaultDialog(title:'Do you want to unfollow?',
//                             content:Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 InkWell(
//                                   onTap:(){
//                                     friendFullProfileController.unFollowedFriend(unfollowEmail,name);
//                                     Get.offAllNamed(AppRoutes.accountSettingScreen);
//                                   },
//                                   child: Container(
//                                     height: 30,
//                                     width: 50,
//                                     decoration: BoxDecoration(
//                                       color: Colors.red,
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     child: Center(child: TextWidget(color: Colors.white,text: "Yes",fsize: 12),),
//                                   ),
//                                 ),
//                                 SizedBox(width: 10),
//                                 InkWell(
//                                   onTap: (){
//                                     Get.back();
//                                   },
//                                   child: Container(
//                                       height: 30,
//                                       width: 50,
//                                       decoration: BoxDecoration(
//                                         color: Colors.blue,
//                                         borderRadius: BorderRadius.circular(12),
//                                       ),
//                                       child: Center(child: TextWidget(color: Colors.white,text: "No",fsize: 12),)
//                                   ),
//                                 )
//                               ],
//
//                             ), );
//                         },
//                         child: Container(
//                           height: Get.height*0.04,
//                           width: Get.width*0.24,
//                           decoration: BoxDecoration(
//                             color: Colors.blue,borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Center(child: TextWidget(text: "Followed",fsize: 12,color: Colors.white)),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Spacer(),
//               ],
//             ),
//           ),
//           SizedBox(height: Get.height*0.03),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Material(
//                 borderRadius: BorderRadius.circular(25.921112060546875),
//                 elevation: 5,
//                 child: Container(
//                   width: Get.width * 0.28,
//                   height: Get.height * 0.12,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25.921112060546875),
//                       color: Colors.white),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: Get.width * 0.2,
//                         height: Get.height * 0.04,
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               width: Get.width * 0.01,
//                             ),
//                             TextWidget(
//                               text: affirmation.toString(),
//                               color: Colors.black,
//                               fsize: 20,
//                               font: FontWeight.w600,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top:3.0,left: 3),
//                               child: Image.asset(
//                                 ImageConstant.group10110,
//                                 scale: 5,
//                               ),
//                             ),
//                             SizedBox(
//                               width: Get.width * 0.01,
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: Get.height * 0.01,
//                       ),
//                       Center(
//                           child: TextWidget(
//                             text: "lbl_affirmation_completed".tr,
//                             color: Colors.black54,
//                             fsize: 9,
//                             font: FontWeight.w500,
//                           )),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(width: Get.width*0.05),
//               Material(
//                 borderRadius: BorderRadius.circular(25.921112060546875),
//                 elevation: 5,
//                 child: Container(
//                   width: Get.width * 0.28,
//                   height: Get.height * 0.12,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25.921112060546875),
//                       color: Colors.white),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: Get.width * 0.2,
//                         height: Get.height * 0.04,
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               width: Get.width * 0.01,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top:3.0,left: 3),
//                               child: TextWidget(
//                                 text: intention.toString(),
//                                 color: Colors.black,
//                                 fsize: 20,
//                                 font: FontWeight.w600,
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top:3.0),
//                               child:Image.asset(
//                                 ImageConstant.camIcon,
//                                                    scale: 5,
//                                                  ),
//                             ),
//                             SizedBox(
//                               width: Get.width * 0.01,
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: Get.height * 0.01,
//                       ),
//                       Center(
//                           child: TextWidget(
//                             text: "lbl_intentions_completed".tr,
//                             color: Colors.black54,
//                             fsize: 9,
//                             font: FontWeight.w500,
//                           )),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: Get.height*0.02),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Material(
//                 borderRadius: BorderRadius.circular(25.921112060546875),
//                 elevation: 5,
//                 child: Container(
//                   width: Get.width * 0.28,
//                   height: Get.height * 0.12,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25.921112060546875),
//                       color: Colors.white),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: Get.width * 0.2,
//                         height: Get.height * 0.04,
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               width: Get.width * 0.01,
//                             ),
//                             TextWidget(
//                               text: task.toString(),
//                               color: Colors.black,
//                               fsize: 20,
//                               font: FontWeight.w600,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top:3.0,left: 3),
//                               child:Image.asset(
//                                                       ImageConstant.group10111,
//                                                       scale: 3.8,
//                                                ),
//                             ),
//                             SizedBox(
//                               width: Get.width * 0.01,
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: Get.height * 0.01,
//                       ),
//                       Center(
//                           child: TextWidget(
//                             text: "lbl_tasks_completed".tr,
//                             color: Colors.black54,
//                             fsize: 9,
//                             font: FontWeight.w500,
//                           )),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(width: Get.width*0.05),
//               Material(
//                 borderRadius: BorderRadius.circular(25.921112060546875),
//                 elevation: 5,
//                 child: Container(
//                   width: Get.width * 0.28,
//                   height: Get.height * 0.12,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25.921112060546875),
//                       color: Colors.white),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: Get.width * 0.2,
//                         height: Get.height * 0.04,
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               width: Get.width * 0.01,
//                             ),
//                             TextWidget(
//                               text: blogReads.toString(),
//                               color: Colors.black,
//                               fsize: 20,
//                               font: FontWeight.w600,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top:3.0,left: 3),
//                               child: Image.asset(
//                                                       ImageConstant.msgIcon,
//                                                       scale: 3.8,
//                                                     ),
//                             ),
//                             SizedBox(
//                               width: Get.width * 0.01,
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: Get.height * 0.01,
//                       ),
//                       Center(
//                           child: TextWidget(
//                             text: "lbl_blog_read".tr,
//                             color: Colors.black54,
//                             fsize: 9,
//                             font: FontWeight.w500,
//                           )),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
// }




}
