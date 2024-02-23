import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/register_page_one_screen/models/user_model.dart';
import '../../presentation/view_friend_full_profile_page/controller/view_friend_full_profile_controller.dart';
class UserListTileWidget extends StatelessWidget {
  const UserListTileWidget({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: CustomImageView(url: userModel.imageUrl,radius: BorderRadius.circular(50),width: 50,height: 50,),
      title: Text(userModel.fullName),
      subtitle: Text(userModel.email),
      onTap: () {
        Get.dialog(

              AlertDialog(
                title: Text('Add Friend'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(
                          'Do you want to add this user as a friend?'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () async {
                      await Get.put(
                          ViewFriendFullProfileController())
                          .addFriendList(
                          context,
                          userModel.fullName,
                          userModel.email,
                          userModel.imageUrl,
                          userModel.phoneNumber);
                    },
                    child: Text('Add'),
                  ),
                ],
              )
        );
      },
    );
  }
}
