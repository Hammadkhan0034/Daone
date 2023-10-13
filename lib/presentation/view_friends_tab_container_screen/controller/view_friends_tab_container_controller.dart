import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/view_friends_tab_container_screen/models/view_friends_tab_container_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// A controller class for the ViewFriendsTabContainerScreen.
///
/// This class manages the state of the ViewFriendsTabContainerScreen, including the
/// current viewFriendsTabContainerModelObj
class ViewFriendsTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<ViewFriendsTabContainerModel> viewFriendsTabContainerModelObj =
      ViewFriendsTabContainerModel().obs;

  User? user = FirebaseAuth.instance.currentUser;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //
  // RxList<String> friends = <String>[].obs;
  //
  // @override
  // void onInit() {
  //   super.onInit();
  //   // Fetch the user's friends when the controller is initialized.
  //   _getUserFriends();
  // }
  // Future<void> _getUserFriends() async {
  //   final User? user = _auth.currentUser;
  //   if (user != null) {
  //     final DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
  //     final List<dynamic> friendIds = userDoc['friendIds'];
  //
  //     friends.value = friendIds.map((id) => id.toString()).toList();
  //   }
  // }
  //
  // Future<void> sendFriendRequest(String friendId) async {
  //   final User? user = _auth.currentUser;
  //   if (user != null) {
  //     final DocumentReference userRef = _firestore.collection('users').doc(user.uid);
  //
  //     // Update the current user's friend list.
  //     await userRef.update({
  //       'friendIds': FieldValue.arrayUnion([friendId]),
  //     });
  //
  //     // Re-fetch the friends to update the UI.
  //     _getUserFriends();
  //   }
  // }

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 3));





}
