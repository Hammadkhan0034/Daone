import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/group_page/group_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../models/group_model.dart';

class GroupController extends GetxController {

  Rx<File?> selectedImage = Rx<File?>(null);
  TextEditingController groupName =TextEditingController();
  TextEditingController groupDes =TextEditingController();
  TextEditingController postTextController =TextEditingController();
  TextEditingController groupPostComment =TextEditingController();
  final user = FirebaseAuth.instance.currentUser!.email;

  RxString imageUrl=''.obs;
  RxString imagePath = "".obs;

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
          await FirebaseFirestore.instance.collection('groups').doc(groupName.text).collection('groupPost').add({
            'userName': userName,
            'userProfilePic': profilePic,
            'date': Timestamp.fromDate(DateTime.now()),
            'postTitle': postTitle,
            'postPic': imageUrl,
            'postLike': 0, // Initialize likes count to 0
          });

          print('Post saved');
          Get.snackbar("Info", "Post Saved");
          Get.offAllNamed(AppRoutes.accountSettingScreen);
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


  /////////// Add Member //////////////////

  Future<void> addMember({
    required BuildContext context,
    String? gmail,
    String? profile,
    String? groupName
  }) async {
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

      if (user != null) {
        if (gmail != null && profile != null ) {
          DocumentReference userDocRef = FirebaseFirestore.instance.collection('groups').doc(groupName);
          await userDocRef.update({
            'groupMembers':FieldValue.arrayUnion([
            {'email': gmail,
            'imageUrl': profile,
            }
            ]),
          });  // Data saved successfully

          Get.snackbar("Info", "Add in your group Successfully");

          // Hide the progress indicator and navigate
          Navigator.of(context).pop();
          Get.offAndToNamed(AppRoutes.accountSettingScreen);
        } else {
          // Handle the case where any of the required values is null
          Get.snackbar('Error', 'Unexpected error');
          Navigator.of(context).pop(); // Hide the progress indicator
        }
      } else {
        // Handle the case where the user is not authenticated
        print('User is not authenticated');
        Get.snackbar('Error', 'User is not authenticated');
        Navigator.of(context).pop(); // Hide the progress indicator
      }
    } catch (e) {
      // Handle errors here
      print('Error saving task: $e');
      Get.snackbar('Error saving task:', '$e');
      Navigator.of(context).pop(); // Hide the progress indicator
    }
  }






  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  Future<void> createGroup(context,profileImageUrl)async{
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
      if (user != null){
        print('hello');
        final dateTime = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();

        // Get a reference to the Firebase Storage location
        Reference storageReference =
        FirebaseStorage.instance.ref().child('group_images/$fileName');
        print(1);
        // Upload the image to Firebase Storage
        UploadTask uploadTask = storageReference.putFile(selectedImage.value as File);
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {
          print('photo upload '),
        });
        print(2);

        // Get the download URL of the uploaded image
        imageUrl.value = await taskSnapshot.ref.getDownloadURL();

        await FirebaseFirestore.instance.collection('groups').doc(groupName.text).set({
        'groupName': groupName.text,
        'groupCreator': user!.email,
        'groupDescription': groupDes.text,
          'groupMembers': [
            // {
            //   'email': user!.email,
            //   'imageUrl': imageUrl,
            // }
          ],
        //   'groupMembers': [
        //
        // //  user.email,profileImageUrl
        //   ],
        'groupStartingDate': formattedDate,
          'groupImageUrl': imageUrl.value,
        'postLike': 0,
        });

        print(3);

        await FirebaseFirestore.instance.collection('groups').doc(groupName.text).collection('likes').add({
        });

        print(4);


        await FirebaseFirestore.instance.collection('groups').doc(groupName.text).collection('comment').add({
        });


        Get.snackbar("App Info", "Group Created Successfully");
      Get.offAllNamed(AppRoutes.viewFriendsTabContainerScreen);
    }else{
        Get.snackbar('Error', 'User is not authenticated');
        Get.back();
    }
    }catch(e){
      Get.snackbar('Error :', '$e');
      Get.back();
    }
  }


  // Function to check if a like document exists for a specific user and post
  Future<bool> likedExists(String userId, String postId,currentGroupName) async {
    final querySnapshot = await FirebaseFirestore.instance.collection('groups').doc(currentGroupName).collection('likes')
        .where('userId', isEqualTo: userId)
        .where('postId', isEqualTo: postId)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

// Function to toggle the like status
  Future<void> toggleLikeStatus(String userId, String postId,currentGroupName) async {
    final querySnapshot = await FirebaseFirestore.instance.collection('groups').doc(currentGroupName).collection('likes')
        .where('userId', isEqualTo: userId)
        .where('postId', isEqualTo: postId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // The user has already liked the post
      final likeDocumentId = querySnapshot.docs.first.id;
      final likeRef = FirebaseFirestore.instance.collection('groups').doc(currentGroupName).collection('likes').doc(
          likeDocumentId);
      final currentLikeStatus = querySnapshot.docs.first['isLiked'] ?? false;

      // Toggle the like status
      await likeRef.update({'isLiked': !currentLikeStatus});
    } else {
      // The user has not liked the post, so like it
      await FirebaseFirestore.instance.collection('groups').doc(currentGroupName).collection('likes').add({
        'userId': userId,
        'postId': postId,
        'isLiked': true,
      });
    }
  }


// Function to get the like status of a post for a specific user
  Future<bool> getLikeStatus(String userId, String postId,currentGroupName) async {
    final querySnapshot = await FirebaseFirestore.instance.collection('groups').doc(currentGroupName).collection('likes')
        .where('userId', isEqualTo: userId)
        .where('postId', isEqualTo: postId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first['isLiked'] ?? false;
    }
    return false;
  }

// Function to update the post like count
//   Future<void> updatePostLikeCount(String postId,currentGroupName) async {
//     print(currentGroupName);
//     final querySnapshot = await FirebaseFirestore.instance.collection('groups').doc(currentGroupName).collection('likes')
//         .where('postId', isEqualTo: postId)
//         .where('isLiked', isEqualTo: true)
//         .get();
//     final likeCount = querySnapshot.docs.length;
//     print(likeCount);
//
//     //await FirebaseFirestore.instance.collection('groupPost')
//     await FirebaseFirestore.instance.collection('groups')
//         .doc(currentGroupName)
//         .update({'postLike': likeCount});
//   }
  Future<void> updatePostLikeCount(String postId, String currentGroupName) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance.collection('groups').doc(currentGroupName).collection('likes')
          .where('postId', isEqualTo: postId)
          .where('isLiked', isEqualTo: true)
          .get();
      final likeCount = querySnapshot.docs.length;

      print('Updating like count for $currentGroupName, postId: $postId, new like count: $likeCount');

      // Update the 'postLike' field in the group document
      await FirebaseFirestore.instance.collection('groups')
          .doc(currentGroupName)
          .update({'postLike': likeCount});

      print('Like count updated successfully');
    } catch (e) {
      print('Error updating like count: $e');
    }
  }


// Function to handle liking/unliking
  Future<void> likeFunction({required String? userId, required String postId,required currentGroupName}) async {
    // Toggle the like status
    await toggleLikeStatus(userId!, postId,currentGroupName);

    // Update the post like count
    await updatePostLikeCount(postId,currentGroupName);
  }

  ///comment section
  Future commentsSection({context, var postId, profile, comment,name,currentGroupName}) async {
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
      await FirebaseFirestore.instance.collection('groups')
          .doc(currentGroupName).collection('comment')
          .add({
        'profile': profile,
        'postId': postId,
        'comment':comment,
        'username':name,
        'date': DateTime.now(),
      });
      Get.offAndToNamed(AppRoutes.viewFriendsTabContainerScreen);
    } catch (e) {
      Get.snackbar('Info','$e');
      print('Error adding comment: $e');
    }
  }



  Future<void> deleteGroup(String groupName) async {
    try {
      await FirebaseFirestore.instance.collection('groups').doc(groupName).delete();
      Get.snackbar("Info", "Group deleted successfully");
      // You can navigate to another screen or handle the navigation as needed
      Get.offAndToNamed(AppRoutes.viewFriendsTabContainerScreen);
    } catch (e) {
      Get.snackbar("Error", "Error deleting group: $e");
      print("Error deleting group: $e");
    }
  }







  @override
  void onClose() {
    // Clean up resources, close streams, dispose of controllers, etc.
    groupName.dispose();
    groupDes.dispose();
    super.onClose();
  }
}
