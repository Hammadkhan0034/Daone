import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/presentation/group_page/get_started_group.dart';
import 'package:daone/presentation/group_page/group_post.dart';
import 'package:daone/presentation/group_page/models/group_model.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'controller/view_friends_controller.dart';
import 'models/view_friends_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
  GroupPage({Key? key})
      : super(
          key: key,
        );
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  ViewFriendsController controller =
      Get.put(ViewFriendsController(ViewFriendsModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Stack(
      children: [
        StreamBuilder<List<GroupModel>>(
          stream: FirebaseFirestore.instance.collection('groups').snapshots().map((event) {
            List<GroupModel> list=[];
            final String email = FirebaseAuth.instance.currentUser!.email!;

            for(final snap in event.docs){
              GroupModel groupModel=GroupModel.fromMap(snap.data());
              if(groupModel.containsUser(email)){
                list.add(groupModel);
              }
            }
            return list;
          }),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Loading indicator while data is being fetched
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.deepOrangeAccent,
                ),
              );
            }
            if (!snapshot.hasData ||
                snapshot.data == null ||
                snapshot.data.isEmpty) {
              return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.group_add,
                      color: Colors.deepOrange, size: Get.height * 0.1),
                  Container(
                      width: Get.width * 0.6,
                      child: Text(
                        'You are not currently part of any group, and if you want to create a group,'
                        ' please click on the Create Group button below.',
                        style: TextStyle(
                            overflow: TextOverflow.visible,
                            fontFamily: 'Gotham Light'),
                      )),
                ],
              ));
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                // var data= snapshot.data.docs[index].data();
               GroupModel groupModel=snapshot.data[index];
                return InkWell(
                  onTap: () {
                    Get.to(() => GroupPost(groupModel: groupModel,));
                  },
                  child: Container(
                    height: 70,
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.symmetric(
                              horizontal: 15),
                          child:
                          CustomImageView(url: groupModel.image.isEmpty
                              ? 'https://images.unsplash.com/photo-1511632765486-a01980e01a18?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                              : groupModel.image,
                          height: 50,width: 50, radius: BorderRadius.circular(50),
                            fit: BoxFit.fill,
                          )
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                //color: Colors.red,

                                width: Get.width * 0.7,
                                child: Text(
                                  groupModel.name,
                                  maxLines: 1,
                                  style: TextStyle(
                                      overflow: TextOverflow.visible,
                                      fontFamily: 'Gotham Light',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800),
                                )),
                            Container(
                              margin: EdgeInsets.only(top: 2.5),
                                color: Colors.white,
                                width: Get.width * 0.7,
                                child: Text(
                                  groupModel.description,
                                  maxLines: 2,
                                  style: TextStyle(
                                      overflow: TextOverflow.visible,
                                      fontFamily: 'Gotham Light',
                                      fontSize: 8,
                                      fontWeight: FontWeight.w800),
                                )),
                          ],
                        )
                      ],
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
                Get.to(GetStartedGroupScreen());
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 24,
              ),
            ))
      ],
    );
  }

  //   return Container(
  //     width: Get.width*0.3,
  //     height: Get.height*0.6,
  //     color: Colors.blueAccent,
  //     child: Padding(
  //       padding: getPadding(
  //         left: 29,
  //         top: 31,
  //         right: 20,
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           SizedBox(
  //             height: getVerticalSize(510),
  //             width: getHorizontalSize(400),
  //             child: ListView.builder(
  //               physics: BouncingScrollPhysics(),
  //               shrinkWrap: true,
  //               itemCount: controller
  //                   .groups.length,
  //               itemBuilder: (context, index) {
  //                 print(controller
  //                     .viewFriendsModelObj
  //                     .value
  //                     .viewFriends1ItemList.value.length);
  //                 return
  //                   ViewFriends1ItemWidget(
  //                   controller
  //                       .groups[index],
  //                   index: index,
  //                 );
  //               },
  //             ),
  //           ),
  //           Spacer(),
  //           Row(
  //             children: [
  //               CustomElevatedButton(
  //                 onTap: (){
  //                   createGroupDialog(context);
  //                 },
  //                 width: getHorizontalSize(
  //                   250,
  //                 ),
  //                 height: getVerticalSize(
  //                   60,
  //                 ),
  //                 text: "lbl_create_group".tr,
  //                 margin: getMargin(
  //                   left: 5,
  //                   right: 14,
  //                 ),
  //                 buttonStyle: CustomButtonStyles.outlineIndigoA1004c
  //                     .copyWith(
  //                     fixedSize:
  //                     MaterialStateProperty.all<Size>(Size(
  //                       double.maxFinite,
  //                       getVerticalSize(
  //                         60,
  //                       ),
  //                     ))),
  //                 decoration: CustomButtonStyles
  //                     .outlineIndigoA1004cDecoration,
  //                 buttonTextStyle:
  //                 CustomTextStyles.titleMediumWhiteA700,
  //               ),
  //               Padding(
  //                 padding: getMargin(
  //                   left: 5,
  //                 ),                  child: IconButton(onPressed: ()async{
  //                   await controller.loadGroups();
  //                 }, icon: Icon(Icons.refresh),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // Future<void> createGroupDialog(BuildContext context) async {
  //   TextEditingController groupNameController = TextEditingController();
  //
  //   return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return Container(
  //
  //         child: AlertDialog(
  //
  //           title: Text('Enter Group Name'),
  //           content: Container(
  //       height: Get.height*0.15,
  //             width: Get.width*0.05,
  //       padding: EdgeInsets.all(16),
  //       decoration: BoxDecoration(
  //       color: Colors.white, // Set your desired background color
  //       borderRadius: BorderRadius.circular(14),), // Set your d
  //             child: TextField(
  //               controller: groupNameController,
  //               decoration: InputDecoration(
  //                 enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14),borderSide: BorderSide(color: Color(0xffC4BEBE))),
  //                 focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14),borderSide: BorderSide(color: Color(0xffC4BEBE))),
  //                 hintText: 'Enter Group Name',
  //               ),
  //             ),
  //           ),
  //           actions: <Widget>[
  //
  //             ElevatedButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               style: ElevatedButton.styleFrom(
  //                 primary: Color(0xffF56737),    // Set your desired background color
  //                 padding: EdgeInsets.all(0), // Remove default padding
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(99), // Set your desired border radius
  //                 ),
  //                 minimumSize: Size(123, 59), // Set your desired width and height
  //               ),
  //               child: Text('Cancel'),
  //             ),
  //             ElevatedButton(
  //               onPressed: () {
  //                 // Save the group to Firebase
  //                 String groupName = groupNameController.text;
  //                 if (groupName.isNotEmpty) {
  //                   // Call a function to save the group to Firebase
  //                   saveGroupToFirebase(GroupModel(groupName, []));
  //                 }
  //                 Navigator.of(context).pop();
  //               },
  //               style: ElevatedButton.styleFrom(
  //                 primary: Color(0xffF56737),      // Set your desired background color
  //                 padding: EdgeInsets.all(0), // Remove default padding
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(99), // Set your desired border radius
  //                 ),
  //                 minimumSize: Size(123, 59), // Set your desired width and height
  //               ),
  //               child: Text('Create'),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  // Future<void> saveGroupToFirebase(GroupModel group) async {
  //   CollectionReference groups = FirebaseFirestore.instance.collection('groups');
  //
  //   // Convert the GroupModel to a map and save it to Firebase
  //   await groups.add(group.toMap());
  // }
}
