import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/core/utils/utils.dart';
import 'package:daone/presentation/group_page/group_page.dart';
import 'package:daone/presentation/register_page_one_screen/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../models/group_model.dart';

class GroupController extends GetxController {

  Rx<File?> selectedImage = Rx<File?>(null);
  GroupModel? oldGroupModel;
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
   required UserModel userModel,
    required String groupId
  }) async {
    try {

          DocumentReference userDocRef = FirebaseFirestore.instance.collection('groups').doc(groupId);
          await userDocRef.update({
            'users':FieldValue.arrayUnion([
            userModel.toMap()
            ]),
          });  // Data saved successfully

          Get.snackbar("Info", "${userModel.fullName} added to group successfully");

    } catch (e) {
      // Handle errors here
      print('Error Adding user: $e');
      Get.snackbar('Error Adding user:', '$e');
    }
  }

  Future<void> removeMember({

    required List<UserModel> userList,
   required UserModel userModel,
    required String groupId
  }) async {
    if(await Utils.askForConfirmation(Get.context!, "remove ${userModel.fullName} from this group", "Remove Participant")) try {

          DocumentReference userDocRef = FirebaseFirestore.instance.collection('groups').doc(groupId);
          await userDocRef.update({
            'users': userList.map((e) => e.toMap()).toList(growable: false)
          });  // Data saved successfully

          Get.snackbar("Info", "${userModel.fullName} removed from the group");

    } catch (e) {
      // Handle errors here
      print('Error Adding user: $e');
      Get.snackbar('Error removing user:', '$e');
    }
  }






  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }
Future<UserModel> getUserById()async{
  DocumentSnapshot<Map<String, dynamic>>snapshot=await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.email!).get();
  print(snapshot.data());
return UserModel.fromMap(snapshot.data());
}

  Future<void> createGroup()async{
    Get.showOverlay(asyncFunction: ()async{

      try {
        User? user = FirebaseAuth.instance.currentUser;
        imageUrl.value="";
        UserModel createdBy=await getUserById();
        Timestamp timestamp=Timestamp.now();
        String fileName =oldGroupModel==null? timestamp.millisecondsSinceEpoch.toString():oldGroupModel!.groupId;
        if(selectedImage.value!=null){
          Reference storageReference =
          FirebaseStorage.instance.ref().child('group_images/$fileName');
          // Upload the image to Firebase Storage
          UploadTask uploadTask = storageReference.putFile(selectedImage.value!);
          TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {
            print('photo upload '),
          });
          imageUrl.value = await taskSnapshot.ref.getDownloadURL();
        }

        GroupModel groupModel;
        if(oldGroupModel==null){
         groupModel= GroupModel(name: groupName.text, description: groupDes.text, image: imageUrl.value, createdAt: timestamp, createdBy:createdBy, users: []);
        }else{
          oldGroupModel!.name=groupName.text;
          oldGroupModel!.description=groupDes.text;
          oldGroupModel!.image=imageUrl.value.isEmpty?oldGroupModel!.image:imageUrl.value;
          groupModel=oldGroupModel!;
        }

        Map<String,dynamic> data=groupModel.toMap();

        await FirebaseFirestore.instance.collection('groups').doc(groupModel.groupId).set(
            data
        );
        bool isNew=oldGroupModel==null;
        Get.until((route) => Get.currentRoute == AppRoutes.viewFriendsTabContainerScreen);

        Get.snackbar("App Info", isNew?"Group Created Successfully":"Group updated successfully");

      }catch(e,stackTrace){
        print(stackTrace);
        print(e);
        Get.snackbar('Error :', '$e');
      }


    },loadingWidget: Center(child: SizedBox(height: 60,width: 60,child: CircularProgressIndicator(color: Colors.deepOrange,),),));


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
  Future commentsSection({context, var postId, profile, comment,name,currentGroupId}) async {
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
          .doc(currentGroupId).collection('comment')
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
    if(await Utils.askForConfirmation(Get.context!, "delete this group", "Delete Group"))
    try {
      await FirebaseFirestore.instance.collection('groups').doc(groupName).delete();
      // You can navigate to another screen or handle the navigation as needed
      Get.until((route) => Get.currentRoute == AppRoutes.viewFriendsTabContainerScreen);
      Get.snackbar("Info", "Group deleted successfully");

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
