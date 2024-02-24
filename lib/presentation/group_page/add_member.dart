

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/group_page/controller/group_controller.dart';
import 'package:daone/presentation/register_page_one_screen/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/text_widget.dart';

class AddMember extends StatelessWidget {
  String groupId;
  AddMember({required this.groupId});

  @override
  Widget build(BuildContext context) {
    GroupController controller = Get.put(GroupController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add member',
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
      body:   Column(
        children: [
          Container(
            height: Get.height*0.87,
            //color: Colors.deepOrange,
            child: StreamBuilder<List<UserModel>>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .snapshots().map((event) {
                    List<UserModel> list=[];
                    for(final snapshot in event.docs){
                      print(snapshot.data());
                      UserModel userModel=UserModel.fromMap(snapshot.data());
                      if(userModel.uid==FirebaseAuth.instance.currentUser!.uid) continue;
                      list.add(userModel);
                    }
                    return list;
              }),
              builder:
                  (context,  snapshot) {
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
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No data available');
                }

                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    UserModel userModel=snapshot.data![index];
                    return Container(
                      margin: const EdgeInsets.all(8.0),
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
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(
                                  horizontal: 2.0,
                                  vertical: 2),
                              child: CircleAvatar(
                                backgroundColor:
                                Colors.black26,
                                radius: 26,
                                backgroundImage: NetworkImage(
                                    userModel.imageUrl??dummyGroupImage),
                              ),
                            ),                              Container(
                              width: Get.width*0.46,
                              //  color: Colors.green,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: TextWidget(text: userModel.fullName,color: Colors.black,fsize: 18),
                            ),
                            Spacer(),
                      InkWell(
                        onTap: () {
                          controller.addMember(context: context,userModel:userModel,groupId: groupId.toString(),
                          );
                        },
                        child: Container(
                          width: Get.width * 0.21,
                          height: Get.height * 0.04,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(31.0),
                            color: Color(0xff048c44),
                          ),
                          child: Center(
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

    );
  }
}
