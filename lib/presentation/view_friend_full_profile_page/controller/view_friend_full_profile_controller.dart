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

  final user =FirebaseAuth.instance.currentUser;

  Future<void> copyDataToFriendList(String email,String name) async {
    try {
      // Reference to the Firestore instance
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Reference to the source collection "users"
      final CollectionReference usersCollection = firestore.collection('users');

      // Reference to the destination collection "FriendList"
      final CollectionReference friendListCollection = firestore.collection('users').doc(user?.email).collection('friendList');

      // Query the specific documents you want to copy (e.g., 'dev@gmail.com')
      final QuerySnapshot querySnapshot = await usersCollection.where(FieldPath([email])).get();

      // Iterate through the documents in the query result
      querySnapshot.docs.forEach((QueryDocumentSnapshot document) async {
        // Get the data from the source document
        final Map<String, dynamic> data = document.data() as Map<String, dynamic>;

        // Get the email as the document ID
        final String email = document.id;

        // Create a new document in the destination collection with the same data
        await friendListCollection.doc(email).set(data);
      });
      Get.snackbar('Info','$name  Add in your friendlist');
      print('Data copied to FriendList successfully');

    } catch (error) {
      print('Error copying data: $error');
      Get.snackbar('Error copying data','$error');
    }
  }
  
  Future<void> unFollowedFriend(String documentId,name)async{
    try{
      final collectionRefrence = FirebaseFirestore.instance
          .collection('users')
          .doc(user?.email)
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
