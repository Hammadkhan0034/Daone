import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/add_task_model.dart';

/// A controller class for the AddTaskScreen.
///
/// This class manages the state of the AddTaskScreen, including the
/// current addTaskModelObj
class AddTaskController extends GetxController {
  TextEditingController group216Controller = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Rx<AddTaskModel> addTaskModelObj = AddTaskModel().obs;

  Rx<String> radioGroup = "".obs;

  final List<String> items = [
    'Workout',
    'Job',
    'Sleep Tracker',
    'Tracker',
  ];

// Define a controller to manage the selected item.
  final selectedValue = 'Workout'.obs; // Using GetX's Rx variable
  SelectionPopupModel? selectedDropDownValue;

  CollectionReference tasksCollection =
  FirebaseFirestore.instance.collection('tasks');

  Future<void> saveTaskToFirestore(BuildContext context,taskTitle,String taskDescription) async {
    try {
      User? user =FirebaseAuth.instance.currentUser;
      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      if (user!=null){
        DocumentReference userDocRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      await userDocRef.collection('tasks').add({
        'taskType' :selectedValue.value,
        'taskTitle': taskTitle,
        'date': DateFormat('dd-MM-yyyy').format(DateTime.now()),
        'description':taskDescription,
      });  // Data saved successfully
        print('Task saved to Firestore');
        Get.snackbar("Task Information", "Task Saved Successfully");

        // Hide the progress indicator and navigate
        Navigator.of(context).pop();
        Get.offAndToNamed(AppRoutes.selectTaskScreen);
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

  @override
  void onClose() {
    super.onClose();
    group216Controller.dispose();
    descriptionController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in addTaskModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    addTaskModelObj.value.dropdownItemList.refresh();
  }
}
