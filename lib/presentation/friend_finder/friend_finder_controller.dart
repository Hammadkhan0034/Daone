
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/register_page_one_screen/models/user_model.dart';
import 'package:daone/presentation/view_friend_full_profile_page/controller/view_friend_full_profile_controller.dart';
import 'package:daone/presentation/view_friend_full_profile_page/view_friend_full_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class FriendFinderController extends GetxController {
  var searchQuery = '';

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

  Future<bool> checkIfemailExistsInFirebase(String? email) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    update();
    return querySnapshot.docs.isNotEmpty;
  }

  Future<bool> checkIfuserNameExistsInFirebase(String? userName) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('fullName', isEqualTo: userName)
        .get();
    update();
    return querySnapshot.docs.isNotEmpty;
  }

  Future<Map<String, dynamic>> findUser(dynamic query) async {
    Map<String, dynamic> userData = {};

    if (query.isNotEmpty) {
      // Query Firestore collection for documents matching either email or phone number
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: query)
          .get();
      if (querySnapshot.docs.isEmpty) {
        // If no documents are found with email, query for phone number
        querySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('userName', isEqualTo: query)
            .get();
      }

      // If documents are found, extract user data from the first document
      if (querySnapshot.docs.isNotEmpty) {
        var doc = querySnapshot.docs.first;
        var data = doc.data();
        if (data != null && data is Map<String, dynamic>) {
          String? name = data['fullName'];
          String? email = data['email'];
          String? imageUrl = data['imageUrl'];
          String? phoneNumber = data['phoneNumber'];

          if (name != null && email != null) {
            userData = {
              'fullName': name,
              'email': email,
              'imageUrl': imageUrl,
              'phoneNumber': phoneNumber
            };

            Get.snackbar("User $name  found with email $email ",
                "Do you want to add $name ");
            print('User Name: $name, Email: $email');

            Get.dialog(
              AlertDialog(
                  backgroundColor: Colors.white,
                  contentPadding: EdgeInsets.all(10),
                  insetPadding: const EdgeInsets.only(left: 0),
                  content: SizedBox(
                    height: Get.height * 0.25,
                    width: Get.width * 0.8,
                    child: AlertDialog(
                      title: Text('Add Friend'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('Do you want to add this user as a friend?'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Get.back(closeOverlays: true);
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.put(ViewFriendFullProfileController())
                                .addFriendList( Get.context!, name, email, imageUrl,
                                    phoneNumber);
                          },
                          child: Text('Add'),
                        ),
                      ],

                    ),
                  )
               
              ),
            );
          } else {
            print("Name or email not found");
          }
        }
      } else {
        Get.snackbar("User not found ", "Do you want to send him invite link");
        String inviteMessage =
            "Hey! Check out this awesome app. Download it now!";

        // Share the invitation message
        Share.share(inviteMessage);
        print("User not found");
      }
    } else {
      print("Empty query");
    }

    return userData;
  }

  // Future<List<Map<String, dynamic>>> findUser(dynamic query) async {
  //   List<Map<String, dynamic>> users = [];
  //
  //   if (query.isNotEmpty) {
  //     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .where('email', isEqualTo: query)
  //         .get();
  //     print("object");
  //     // Iterate over each document in the query snapshot
  //     querySnapshot.docs.forEach((doc) {
  //       // Perform a null check before accessing fields
  //       var data = doc.data();
  //       if (data != null && data is Map<String, dynamic>) {
  //         String? name = data['fullName'];
  //         String? email = data['email'];
  //
  //         // Check if name and email are not null before printing
  //         if (name != null && email != null) {
  //           // Create a map containing the user's name and email
  //           Map<String, dynamic> userData = {
  //             'fullName': name,
  //             'email': email,
  //           };
  //
  //           users.add(userData);
  //
  //           print('User Name: $name, Email: $email');
  //         }
  //         else{
  //
  //           print("EMAIL NOT FOUND ");
  //         }
  //       }
  //     });
  //   }
  //
  //   // Perform any necessary updates or operations
  //   update();
  //
  //   return users;
  // }
}
