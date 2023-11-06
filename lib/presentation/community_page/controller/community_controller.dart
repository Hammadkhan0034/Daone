import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/community_page/community_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/community_model.dart';

class CommunityController extends GetxController {
  CommunityController(this.communityModelObj);

  Rx<CommunityModel> communityModelObj;

  SelectionPopupModel? selectedDropDownValue;


  var isLiked = false.obs;

  onSelected(dynamic value) {
    for (var element in communityModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    communityModelObj.value.dropdownItemList.refresh();
  }

  TextEditingController postController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxString imagePath = "".obs;
  final user = FirebaseAuth.instance.currentUser!.email;

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }

  Future<void> postCollection(BuildContext context,
      String? profilePic,
      String? userName,
      String? postTitle,
      File? postImageFile,) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ),
          );
        },
      );

      if (postImageFile != null && userName != null && profilePic != null) {
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('postImages/${DateTime
            .now()
            .millisecondsSinceEpoch}.jpg');
        final uploadTask = storageRef.putFile(postImageFile);
        final TaskSnapshot uploadTaskSnapshot =
        await uploadTask.whenComplete(() => null);

        if (uploadTaskSnapshot.state == TaskState.success) {
          final imageUrl = await storageRef.getDownloadURL();

          final postDoc =
          await FirebaseFirestore.instance.collection('postCollection').add({
            'userName': userName,
            'userProfilePic': profilePic,
            'date': Timestamp.fromDate(DateTime.now()),
            'postTitle': postTitle,
            'postPic': imageUrl,
            'postLike': 0, // Initialize likes count to 0
          });

          print('Post saved');
          Get.snackbar("Info", "Post Saved");
          Get.toNamed(AppRoutes.accountSettingScreen);
        } else {
          print('Error uploading image');
          Get.snackbar('Error', 'Error uploading image');
          Navigator.of(context).pop();
        }
      } else {
        print('One or more values are null');
        Get.snackbar('Error', 'One or more values are null');
        Navigator.of(context).pop();
      }
    } catch (e) {
      print('Error saving post: $e');
      Get.snackbar('Error saving post:', '$e');
      Navigator.of(context).pop();
    }
  }

  // Function to check if a like document exists for a specific user and post
  Future<bool> likedExists(String userId, String postId) async {
    final querySnapshot = await FirebaseFirestore.instance.collection('likes')
        .where('userId', isEqualTo: userId)
        .where('postId', isEqualTo: postId)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

// Function to toggle the like status
  Future<void> toggleLikeStatus(String userId, String postId) async {
    final querySnapshot = await FirebaseFirestore.instance.collection('likes')
        .where('userId', isEqualTo: userId)
        .where('postId', isEqualTo: postId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // The user has already liked the post
      final likeDocumentId = querySnapshot.docs.first.id;
      final likeRef = FirebaseFirestore.instance.collection('likes').doc(
          likeDocumentId);
      final currentLikeStatus = querySnapshot.docs.first['isLiked'] ?? false;

      // Toggle the like status
      await likeRef.update({'isLiked': !currentLikeStatus});
    } else {
      // The user has not liked the post, so like it
      await FirebaseFirestore.instance.collection('likes').add({
        'userId': userId,
        'postId': postId,
        'isLiked': true,
      });
    }
  }


// Function to get the like status of a post for a specific user
  Future<bool> getLikeStatus(String userId, String postId) async {
    final querySnapshot = await FirebaseFirestore.instance.collection('likes')
        .where('userId', isEqualTo: userId)
        .where('postId', isEqualTo: postId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first['isLiked'] ?? false;
    }
    return false;
  }

// Function to update the post like count
  Future<void> updatePostLikeCount(String postId) async {
    final querySnapshot = await FirebaseFirestore.instance.collection('likes')
        .where('postId', isEqualTo: postId)
        .where('isLiked', isEqualTo: true)
        .get();
    final likeCount = querySnapshot.docs.length;

    await FirebaseFirestore.instance.collection('postCollection')
        .doc(postId)
        .update({'postLike': likeCount});
  }

// Function to handle liking/unliking
  Future<void> likeFunction(String? userId, String postId) async {
    // Toggle the like status
    await toggleLikeStatus(userId!, postId);

    // Update the post like count
    await updatePostLikeCount(postId);
  }

  TextEditingController commentController = TextEditingController();


  Future commentsSection({context, var postId, profile, comment,name}) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ),
          );
        },
      );
      await FirebaseFirestore.instance.collection('postCollection')
          .doc(postId).collection('comment')
          .add({
        'profile': profile,
        'postId': postId,
        'comment':comment,
        'username':name,
        'date': DateTime.now(),
      });
     Get.toNamed(AppRoutes.accountSettingScreen);
    } catch (e) {
      Get.snackbar('Info','$e');
      print('Error adding comment: $e');
    }
  }
}