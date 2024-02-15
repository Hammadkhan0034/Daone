import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/utils/size_utils.dart';
import 'package:daone/presentation/group_page/add_member.dart';
import 'package:daone/presentation/group_page/controller/group_controller.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/utils/image_constant.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';

class GroupDetailed extends StatelessWidget {
  var groupName, groupCreatorName, groupStartingDate;

  GroupDetailed(
      {required this.groupName,
      required this.groupCreatorName,
      required this.groupStartingDate});

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Group Detailed',
            style: TextStyle(
                fontFamily: 'Gotham Light',
                fontWeight: FontWeight.w800,
                fontSize: 25,
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
            bottom: 5,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: Get.height * 0.09,
            width: Get.width * 1,
            margin: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 0),
            //color: Colors.pinkAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Group Name",
                  fontFamily: 'Gotham Light',
                  fontWeight: FontWeight.w800,
                  fsize: 16,
                ),
                SizedBox(height: Get.height * 0.005),
                TextWidget(
                    text: groupName,
                    fontFamily: 'Gotham Light',
                    fontWeight: FontWeight.w800,
                    fsize: 16,
                    color: Colors.deepOrange),
              ],
            ),
          ),
          Container(
            height: Get.height * 0.09,
            width: Get.width * 1,
            margin: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
            //color: Colors.pinkAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Group Creator Name",
                  fontFamily: 'Gotham Light',
                  fontWeight: FontWeight.w800,
                  fsize: 16,
                ),
                SizedBox(height: Get.height * 0.005),
                TextWidget(
                    text: groupCreatorName,
                    fontFamily: 'Gotham Light',
                    fontWeight: FontWeight.w800,
                    fsize: 16,
                    color: Colors.deepOrange),
              ],
            ),
          ),
          Container(
            height: Get.height * 0.09,
            width: Get.width * 1,
            margin: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
            //color: Colors.pinkAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Date",
                  fontFamily: 'Gotham Light',
                  fontWeight: FontWeight.w800,
                  fsize: 16,
                ),
                SizedBox(height: Get.height * 0.005),
                TextWidget(
                    text: groupStartingDate.toString(),
                    fontFamily: 'Gotham Light',
                    fontWeight: FontWeight.w800,
                    fsize: 16,
                    color: Colors.deepOrange),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextWidget(
              text: "Group Members",
              fontFamily: 'Gotham Light',
              fontWeight: FontWeight.w800,
              fsize: 16,
            ),
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('groups')
                .doc(groupName)
                .snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(color: Colors.deepOrange,); // Show a loading indicator
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || !snapshot.data!.exists) {
                return Text(
                    'Document does not exist'); // Handle no data scenario
              }

              // Access your array of members from the document snapshot
              List<dynamic> members = snapshot.data?.get('groupMembers') ?? [];
              List<String> imageUrls = [];
              for (dynamic member in members) {
                if (member is Map<String, dynamic> && member.containsKey('imageUrl')) {
                  String imageUrl = member['imageUrl'];
                  imageUrls.add(imageUrl);
                }
              }


              return Container(
                height: Get.height * 0.1,
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                ),
                child: ListView.builder(
                  itemCount: members.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index < imageUrls.length) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                            imageUrls[index],
                          ),
                        ),
                      );
                    } else {
                      // Handle the case where index is out of bounds
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CircleAvatar(),
                      );
                    }
                    // return FutureBuilder<CircleAvatar>(
                    //   future: getProfile(members[index]),
                    //   builder: (context, snapshot) {
                    //     if (snapshot.connectionState ==
                    //         ConnectionState.waiting) {
                    //       return Center(child: CircularProgressIndicator());
                    //     } else if (snapshot.hasError) {
                    //       return Text('Error: ${snapshot.error}');
                    //     } else {
                    //       return snapshot.data ??
                    //           CircleAvatar(); // Return CircleAvatar or a default avatar if data is null
                      //  }
                     // },
                   // );
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          Row(
            children: [
              Spacer(),
              InkWell(
                onTap: () {
                   Get.to(()=>AddMember(groupName: groupName,));
                },
                child: Container(
                  width: Get.width * 0.64,
                  height: Get.height * 0.075,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: TextWidget(
                    text: 'Add member',
                    color: Colors.white,
                    fontFamily: 'Gotham light',
                    fontWeight: FontWeight.w800,
                  )),
                ),
              ),
              Spacer(),
            ],
          ),
          Row(
            children: [
              Spacer(),
              InkWell(
                onTap: () {
                  groupController.deleteGroup(groupName);
                },
                child: Container(
                  width: Get.width * 0.64,
                  height: Get.height * 0.075,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: TextWidget(
                    text: 'Delete Group',
                    color: Colors.white,
                    fontFamily: 'Gotham light',
                    fontWeight: FontWeight.w800,
                  )),
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  // Future<CircleAvatar> getProfile(String userDoc) async {
  //   try {
  //     DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(userDoc)
  //         .get();
  //
  //     // Ensure that 'imageUrl' is a String field in the document
  //     String? imageUrl = userSnapshot.get('imageUrl');
  //
  //     // Ensure imageUrl is not null before using it
  //     if (imageUrl != null && imageUrl.isNotEmpty) {
  //       return CircleAvatar(
  //         child: CachedNetworkImage(imageUrl: imageUrl),
  //       );
  //     } else {
  //       // Return a default avatar if imageUrl is null or empty
  //       return CircleAvatar();
  //     }
  //   } catch (e) {
  //     // Handle any potential errors
  //     print('Error fetching user profile: $e');
  //     return CircleAvatar(); // Return a default avatar on error
  //   }
  // }

}
