import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/view_friend_full_profile_page/models/view_friend_full_profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A controller class for the ViewFriendFullProfilePage.
///
/// This class manages the state of the ViewFriendFullProfilePage, including the
/// current viewFriendFullProfileModelObj
class ViewFriendFullProfileController extends GetxController {

    final user = FirebaseAuth.instance.currentUser!.email;

  Future<void> addFriendList(
      BuildContext context,
      String? name,
      String? gmail,
      String? profile,
      String? number
      ) async {
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
        if (name != null && gmail != null && profile != null ) {
          DocumentReference userDocRef = FirebaseFirestore.instance.collection('users').doc(user.email);
          await userDocRef.collection('FriendList').doc(name).set({
            'email': gmail,
            'imageUrl': profile,
            'name': name,
            'number': number

          });  // Data saved successfully

          Get.snackbar("Info", "$name Add in your friend list Successfully");

          // Hide the progress indicator and navigate
         Get.back();

        } else {
          // Handle the case where any of the required values is null
          print('One or more values are null');
          Get.snackbar('Error', 'One or more values are null');
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

    Future<void> deleteFriend(
        BuildContext context,
        String? friendName,
        ) async {
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

        if (user != null && friendName != null) {
          DocumentReference userDocRef =
          FirebaseFirestore.instance.collection('users').doc(user.email);

          // Delete the friend from the FriendList collection
          await userDocRef.collection('FriendList').doc(friendName).delete();

          Get.snackbar("Info", "$friendName removed from your friend list");
          Get.offAndToNamed(AppRoutes.accountSettingScreen);
        } else {
          // Handle the case where the user is not authenticated or friendName is null
          print('User is not authenticated or friendName is null');
          Get.snackbar('Error', 'User is not authenticated or friendName is null');
          Navigator.of(context).pop(); // Hide the progress indicator
        }
      } catch (e) {
        // Handle errors here
        print('Error deleting friend: $e');
        Get.snackbar('Error deleting friend:', '$e');
        Navigator.of(context).pop(); // Hide the progress indicator
      }
    }










    //
  // Future<void> copyDataToFriendList(String email,String name) async {
  //   try {
  //     // Reference to the Firestore instance
  //     final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //
  //     // Reference to the source collection "users"
  //     final CollectionReference usersCollection = firestore.collection('users');
  //
  //     // Reference to the destination collection "FriendList"
  //     final CollectionReference friendListCollection = firestore.collection('users').doc(user?.email).collection('friendList');
  //
  //     // Query the specific documents you want to copy (e.g., 'dev@gmail.com')
  //     final QuerySnapshot querySnapshot = await usersCollection.where(FieldPath([email])).get();
  //
  //     // Iterate through the documents in the query result
  //     querySnapshot.docs.forEach((QueryDocumentSnapshot document) async {
  //       // Get the data from the source document
  //       final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
  //
  //       // Get the email as the document ID
  //       final String email = document.id;
  //
  //       // Create a new document in the destination collection with the same data
  //       await friendListCollection.doc(email).set(data);
  //     });
  //     Get.snackbar('Info','$name  Add in your friendlist');
  //     print('Data copied to FriendList successfully');
  //
  //   } catch (error) {
  //     print('Error copying data: $error');
  //     Get.snackbar('Error copying data','$error');
  //   }
  // }
  
  Future<void> unFollowedFriend(String documentId,name)async{
    try{
      final collectionRefrence = FirebaseFirestore.instance
          .collection('users')
          .doc(user)
          .collection('friendList');
      await collectionRefrence.doc(documentId).delete();
      Get.snackbar(
        'Info',
        'You Unfollow $name Succesfully',
        backgroundColor: Colors.white, // Customize the snackbar appearance
        snackPosition: SnackPosition.BOTTOM, // Adjust the position as needed
        duration: Duration(seconds: 2), // Adjust the duration as needed
        isDismissible: true, // Set to true to allow dismissing the snackbar
        dismissDirection:DismissDirection.horizontal, // Dismiss direction
      );

    }catch(e){
      Get.snackbar(
        'Error',
        '$e',
        backgroundColor: Colors.white, // Customize the snackbar appearance
        snackPosition: SnackPosition.BOTTOM, // Adjust the position as needed
        duration: Duration(seconds: 2), // Adjust the duration as needed
        isDismissible: true, // Set to true to allow dismissing the snackbar
        dismissDirection:DismissDirection.horizontal, // Dismiss direction
      );
    }
  }
  
}
