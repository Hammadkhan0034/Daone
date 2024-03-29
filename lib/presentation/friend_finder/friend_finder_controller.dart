import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../register_page_one_screen/models/user_model.dart';

class FriendFinderController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    searchusers;
  }

  final searchQuery = ''.obs;
  final List<UserModel> userList = <UserModel>[];
  final List<UserModel> userListByName = <UserModel>[];
  static final searchusers = FirebaseFirestore.instance.collection("users");

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

  bool isSearching = false;

  Future<void> searchUsersByEmail(String searchCase) async {
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where("email", isGreaterThanOrEqualTo: searchCase)
          .where("email", isLessThan: searchCase + 'z')
          .get();
      if (snapshot.size > 0) {
        userList.clear();
        for (final user in snapshot.docs) {
          UserModel userModel = UserModel.fromMap(user.data());
          if (user.id == currentUserId) continue;
          userList.add(userModel);
        }
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> searchUsersByUserName(String searchCase) async {
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    try {
      final snapshot = await searchusers.get();

      if (snapshot.size > 0) {
        userListByName.clear();
        for (final user in snapshot.docs) {
          String fullName = user.data()['fullName'] ?? '';
          if (fullName.toLowerCase().contains(searchCase.toLowerCase()) &&
              user.id != currentUserId) {
            UserModel userModel = UserModel.fromMap(user.data());
            userListByName.add(userModel);
          }
        }
        update();
      }
    } catch (e) {
      print(e);
    }
  }
}
