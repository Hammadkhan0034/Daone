import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/utils/size_utils.dart';
import 'package:daone/presentation/group_page/add_member.dart';
import 'package:daone/presentation/group_page/controller/group_controller.dart';
import 'package:daone/presentation/group_page/creategroup.dart';
import 'package:daone/widgets/custom_image_view.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/utils/image_constant.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../register_page_one_screen/models/user_model.dart';
import 'models/group_model.dart';

class GroupDetailed extends StatelessWidget {
 GroupModel groupModel;

  GroupDetailed(
      {required this.groupModel});

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
        actions: [
          InkWell(
          onTap: (){
            Get.to(()=>CreateGroup(isEdit: true,oldGroupModel: groupModel,));

          },
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(Icons.edit,color: Colors.green,size: 24,weight: 2,),
        )),
 InkWell(
          onTap: (){
            groupController.deleteGroup(groupModel.groupId);

          },
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(Icons.delete,color: Colors.red,size: 24,weight: 2,),
        ))

        ],
      ),
      body: StreamBuilder<GroupModel?>(
        stream:  FirebaseFirestore.instance.collection('groups').doc(groupModel.groupId).snapshots().map((event) {
if(!event.exists) return null;
            GroupModel groupModel=GroupModel.fromMap(event.data()!);

          return groupModel;
        }),
        builder: (context, snapshot) {
          GroupModel updatedGroupModel=snapshot.data??groupModel;
          return SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                CustomImageView(url:updatedGroupModel.image.isEmpty?dummyGroupImage:updatedGroupModel.image ,width: 200,height:200,fit: BoxFit.fill,radius: BorderRadius.circular(200),),
                SizedBox(height: 20,),

                Container(
                  constraints: BoxConstraints(maxWidth: Get.width*0.8),
                  child: TextWidget(
                    text: updatedGroupModel.name,
                    fontFamily: 'Gotham Light',
                    fontWeight: FontWeight.bold,

                    fsize: 16,
                  ),
                ),

                Container(
                  constraints: BoxConstraints(maxWidth: Get.width*0.8),

                  child: TextWidget(
                      text: updatedGroupModel.description,
                      fontFamily: 'Gotham Light',
                      fontWeight: FontWeight.w800,
                      fsize: 16,
                      color: Colors.black54),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: "Group Members",
                        fontFamily: 'Gotham Light',
                        fontWeight: FontWeight.w800,
                        fsize: 16,
                      ),
                      InkWell(
                          onTap: (){
                            Get.to(()=>AddMember(groupId: groupModel.groupId));
                          },
                          child: Icon(Icons.add,color: Colors.deepOrange,size: 24,weight: 2,))

                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border(top:BorderSide(color: Colors.grey[300]!)),
                  ),
                  child:
                  updatedGroupModel.users.isEmpty?SizedBox(
                      height: Get.height*0.4,
                      child: Center(child: TextWidget(text: "No people added in the group yet",),))
              :
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: updatedGroupModel.users.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      color: Colors.white,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                         padding: const EdgeInsets.symmetric(horizontal: 10),

                        height: 60,
                        width: Get.width * 0.9,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(15),
                        //   color: Colors.white24,
                        //   border: Border.all(
                        //     color: Colors.black12,
                        //     width: 2.0,
                        //   ),
                        //   boxShadow: [
                        //     BoxShadow(
                        //       color: Colors.white,
                        //       offset: Offset(0, 2),
                        //       blurRadius: 6.0,
                        //       spreadRadius: 2.0,
                        //     ),
                        //   ],
                        // ),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                              Colors.black26,
                              radius: 26,
                              backgroundImage: NetworkImage(
                                  updatedGroupModel.users[index].imageUrl??dummyGroupImage),
                            ),
                            Container(
                              width: Get.width*0.6,
                              //  color: Colors.green,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextWidget(text: updatedGroupModel.users[index].fullName,color: Colors.black,fsize: 18,fontWeight: FontWeight.w600,),
                            ),
                            Spacer(),
                            updatedGroupModel.createdBy.uid==FirebaseAuth.instance.currentUser!.uid?InkWell(

                              onTap: (){
                               UserModel deletedUser= updatedGroupModel.users.removeAt(index);
                                groupController.removeMember( userList: updatedGroupModel.users, userModel: deletedUser, groupId: updatedGroupModel.groupId);
                              },
                              child: Icon(Icons.delete,color: Colors.red,size: 20,),
                            ):SizedBox.shrink()

                          ],
                        ),
                      ),
                    );

                    },
                  ),
                ),

              ],
            ),
          );
        }
      ),
    );
  }


}
