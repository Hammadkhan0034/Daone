
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';


class FriendFinderController extends GetxController {
  final searchQuery = ''.obs;
  final userList = <DocumentSnapshot>[].obs;
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





  void setSearchQuery(String query) {
    searchQuery.value = query;

    debounce(
      searchQuery, // Observable to watch for changes
          (_) => searchUser(), // Function to execute
      time: Duration(milliseconds: 100), // Delay duration
    );
  }

  void searchUser() async {
    if (searchQuery.value.isNotEmpty) {
      try {
        final snapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('email', isGreaterThanOrEqualTo: searchQuery.value)
            .get();
        userList.value = snapshot.docs;
      } catch (error) {
        // Handle errors if any
        print('Error searching users: $error');
      }
    }
    if (searchQuery.value.isNotEmpty) {
      try {
        final snapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('userName', isGreaterThanOrEqualTo: searchQuery.value)
            .get();
        userList.value = snapshot.docs;
      } catch (error) {
        // Handle errors if any
        print('Error searching users: $error');
      }
    }

    else {
      // Clear the user list if search query is empty
      userList.clear();
    }
  }


}
