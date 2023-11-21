import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/latest_blog_screen/models/latest_blog_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LatestBlogController extends GetxController {
  final RxBool _shouldShowBottomMenu = false.obs;
  final Rx<Color> _selectedColor = Colors.grey.obs;
  String selectedText = "";

  List<Color> colorsList = [
    Colors.grey,
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.green
  ];
  final user = FirebaseAuth.instance.currentUser!.email;
  TextEditingController noteTextController = TextEditingController();

  Rx<LatestBlogModel> latestBlogModelObj = LatestBlogModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element in latestBlogModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    latestBlogModelObj.value.dropdownItemList.refresh();
  }

  Future<void> notesList(
      {required BuildContext context,
      required String selectedText,
      required String noteComment,
      required String title}) async {
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
        DocumentReference userDocRef =
            FirebaseFirestore.instance.collection('users').doc(user.email);
        await userDocRef.collection('NoteList').add({
          'selectedText': selectedText,
          'date': DateFormat('dd-MM-yyyy').format(DateTime.now()),
          'title': title,
          'noteComment': noteComment
        }); // Data saved successfully
        print('Notes saved to Firestore');
        Get.snackbar("Info", "Note Add to Successfully");

        // Hide the progress indicator and navigate
        Navigator.of(context).pop();
        Get.offAndToNamed(AppRoutes.blogScreen);
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

  Color get selectedColor => _selectedColor.value;

  set selectedColor(Color value) {
    _selectedColor.value = value;
  }

  bool get shouldShowBottomMenu => _shouldShowBottomMenu.value;

  set shouldShowBottomMenu(bool value) {
    _shouldShowBottomMenu.value = value;
  }
}
