
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../register_page_one_screen/models/user_model.dart';


class FriendFinderController extends GetxController {
  final searchQuery = ''.obs;
  final List<UserModel>userList = <UserModel>[];
  final List<UserModel>userListByName = <UserModel>[];
  Future<Map<dynamic, dynamic>> checkIfPhoneNumberExistsInFirebase(
      String? phoneNumber) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get();

      if (snapshot.docs.isNotEmpty) {
        var userData = snapshot.docs.first.data();
        print('User Data: $userData');
        return userData;
      } else {
        return {};
      }
    } catch (error) {
      print('Error checking phone number: $error');
      return {};
    }
  }





  // void setSearchQuery(String query) {
  //   searchQuery.value = query;
  //
  //   debounce(
  //     searchQuery, // Observable to watch for changes
  //         (_) => searchUser(), // Function to execute
  //     time: Duration(milliseconds: 5000), // Delay duration
  //   );
  // }


bool isSearching=false;
   Future<void> searchUsersByUserName(String searchCase) async {
     if(isSearching) return;
     String currentUserId=FirebaseAuth.instance.currentUser!.uid;
     isSearching=true;

     try {
       final snapshot=await  FirebaseFirestore.instance
           .collection('users')
           .where("fullName", isGreaterThanOrEqualTo: searchCase)
           .where("fullName",
           isLessThan: searchCase+'z')
           .get();

       userListByName.clear();
         for(final user in snapshot.docs){
           UserModel userModel=UserModel.fromMap(user.data());
           if(user.id==currentUserId) continue;
           userListByName.add(userModel);
         }
         isSearching=false;
         update();

     }  catch (e) {
       print(e);
       isSearching=false;

     }


   }
   Future<void> searchUsersByEmail(String searchCase) async {
     String currentUserId=FirebaseAuth.instance.currentUser!.uid;
     try {
       final snapshot=await  FirebaseFirestore.instance
           .collection('users')
           .where("email", isGreaterThanOrEqualTo: searchCase)
           .where("email",
           isLessThan: searchCase+'z')
           .get();
       if(snapshot.size>0)
       {
         userList.clear();
         for(final user in snapshot.docs){
           UserModel userModel=UserModel.fromMap(user.data());
           if(user.id==currentUserId) continue;
           userList.add(userModel);
         }
         update();
       }
     }  catch (e) {
       print(e);
     }
   }




}
