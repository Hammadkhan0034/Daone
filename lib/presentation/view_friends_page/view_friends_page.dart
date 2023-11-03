import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../view_friends_page/widgets/view_friends1_item_widget.dart';
import 'controller/group_controller.dart';
import 'controller/view_friends_controller.dart';
import 'models/group_model.dart';
import 'models/view_friends1_item_model.dart';
import 'models/view_friends_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_drop_down.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
class ViewFriendsPage extends StatelessWidget {
  ViewFriendsPage({Key? key})
      : super(
          key: key,
        );
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  ViewFriendsController controller =
      Get.put(ViewFriendsController(ViewFriendsModel().obs));




  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SizedBox(
      width: Get.width*0.3,
      height: Get.height*0.5,
      child: Padding(
        padding: getPadding(
          left: 29,
          top: 31,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: getVerticalSize(480),
              width: getHorizontalSize(400),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller
                    .groups.length,
                itemBuilder: (context, index) {
                  print(controller
                      .viewFriendsModelObj
                      .value
                      .viewFriends1ItemList.value.length);
                  return ViewFriends1ItemWidget(
                    controller
                        .groups[index],
                    index: index,
                  );
                },
              ),
            ),
            Spacer(),
            Row(
              children: [
                CustomElevatedButton(
                  onTap: (){
                    createGroupDialog(context);
                  },
                  width: getHorizontalSize(
                    250,
                  ),
                  height: getVerticalSize(
                    60,
                  ),
                  text: "lbl_create_group".tr,
                  margin: getMargin(
                    left: 5,
                    right: 14,
                  ),
                  buttonStyle: CustomButtonStyles.outlineIndigoA1004c
                      .copyWith(
                      fixedSize:
                      MaterialStateProperty.all<Size>(Size(
                        double.maxFinite,
                        getVerticalSize(
                          60,
                        ),
                      ))),
                  decoration: CustomButtonStyles
                      .outlineIndigoA1004cDecoration,
                  buttonTextStyle:
                  CustomTextStyles.titleMediumWhiteA700,
                ),
                Padding(
                  padding: getMargin(
                    left: 5,
                  ),                  child: IconButton(onPressed: ()async{
                    await controller.loadGroups();
                  }, icon: Icon(Icons.refresh),
                  ),
                ),
              ],
            ),
            SizedBox(height: getVerticalSize(20),)
          ],
        ),
      ),
    );
  }

  Future<void> createGroupDialog(BuildContext context) async {
    TextEditingController groupNameController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return Container(

          child: AlertDialog(

            title: Text('Enter Group Name'),
            content: Container(
        height: Get.height*0.2,
              width: Get.width*0.05,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
        color: Colors.white, // Set your desired background color
        borderRadius: BorderRadius.circular(14),), // Set your d
              child: TextField(
                controller: groupNameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14),borderSide: BorderSide(color: Color(0xffC4BEBE))),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14),borderSide: BorderSide(color: Color(0xffC4BEBE))),
                  hintText: 'Enter Group Name',
                ),
              ),
            ),
            actions: <Widget>[

              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffF56737),    // Set your desired background color
                  padding: EdgeInsets.all(0), // Remove default padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99), // Set your desired border radius
                  ),
                  minimumSize: Size(123, 59), // Set your desired width and height
                ),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Save the group to Firebase
                  String groupName = groupNameController.text;
                  if (groupName.isNotEmpty) {
                    // Call a function to save the group to Firebase
                    saveGroupToFirebase(GroupModel(groupName, []));
                  }
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffF56737),      // Set your desired background color
                  padding: EdgeInsets.all(0), // Remove default padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99), // Set your desired border radius
                  ),
                  minimumSize: Size(123, 59), // Set your desired width and height
                ),
                child: Text('Create'),
              ),
            ],
          ),
        );
      },
    );
  }
  Future<void> saveGroupToFirebase(GroupModel group) async {
    CollectionReference groups = FirebaseFirestore.instance.collection('groups');

    // Convert the GroupModel to a map and save it to Firebase
    await groups.add(group.toMap());
  }


}
