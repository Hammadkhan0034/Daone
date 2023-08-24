import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/add_new_friends_dialog/models/add_new_friends_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the AddNewFriendsDialog.
///
/// This class manages the state of the AddNewFriendsDialog, including the
/// current addNewFriendsModelObj
class AddNewFriendsController extends GetxController {
  TextEditingController emailController = TextEditingController();

  Rx<AddNewFriendsModel> addNewFriendsModelObj = AddNewFriendsModel().obs;

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }
}
