import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    'WORKOUT ',
    'JOB',
    'SLEEP',
    'EVENT',
  ];

// Define a controller to manage the selected item.
  final selectedValue = 'WORKOUT '.obs; // Using GetX's Rx variable
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
            child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ),
          );
        },
      );
      if (user!=null){
        DocumentReference userDocRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      await userDocRef.collection('tasks').add({
        'taskType' :selectedValue.value,
        'taskTitle': taskTitle,
        'date': Timestamp.fromDate(DateTime.now()),
        //'date': DateFormat('dd-MM-yyyy').format(DateTime.now()),
        'description':taskDescription,
      });  // Data saved successfully
        print('Task saved to Firestore');
        Get.snackbar("Task Information", "Task Saved Successfully");

        // Hide the progress indicator and navigate
        Navigator.of(context).pop();
        Get.offAndToNamed(AppRoutes.dashboardRoute);
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

  void deleteMainTask(String documentId) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentReference userDocRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

        // Specify the path to the document you want to delete
        DocumentReference taskDocRef =
        userDocRef.collection('tasks').doc(documentId);

        // Delete the task
        await taskDocRef.delete();

        print('Task deleted from Firestore');
        Get.snackbar("Task Deleted", "Task Deleted Successfully");
      } else {
        // Handle the case where the user is not authenticated
        print('User is not authenticated');
        Get.snackbar('Error', 'User is not authenticated');
      }
    } catch (e) {
      // Handle errors here
      print('Error deleting task: $e');
      Get.snackbar('Error deleting task:', '$e');
    }
  }





  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  void updateSelectedDate(DateTime? date){
  selectedDate.value = date;
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
  //To Do List

  Future<void> todoList(BuildContext context,taskTitle,String taskDescription,String taskType,Timestamp date) async {
    try {
      User? user =FirebaseAuth.instance.currentUser;
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
      if (user!=null){
        DocumentReference userDocRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
        await userDocRef.collection('todoList').add({
          'taskType' : taskType,
          'taskTitle': taskTitle,
          'date': date,
          //'date': DateFormat('dd-MM-yyyy').format(DateTime.now()),
          'description':taskDescription,
        });  // Data saved successfully
        print('Task saved to Firestore');
        Get.snackbar("Task Add to Todo List", "Task Saved Successfully");

        // Hide the progress indicator and navigate
        Navigator.of(context).pop();
        Get.offAndToNamed(AppRoutes.dashboardRoute);
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
// Create a function to delete the task by its document ID
  void deleteTask(String documentId) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentReference userDocRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

        // Specify the path to the document you want to delete
        DocumentReference taskDocRef =
        userDocRef.collection('todoList').doc(documentId);

        // Delete the task
        await taskDocRef.delete();

        print('Task deleted from Firestore');
        Get.snackbar("Task Deleted", "Task Deleted Successfully");
      } else {
        // Handle the case where the user is not authenticated
        print('User is not authenticated');
        Get.snackbar('Error', 'User is not authenticated');
      }
    } catch (e) {
      // Handle errors here
      print('Error deleting task: $e');
      Get.snackbar('Error deleting task:', '$e');
    }
  }


  Future<void> completeList(BuildContext context,taskTitle,String taskDescription,String taskType,Timestamp date) async {
    try {
      User? user =FirebaseAuth.instance.currentUser;
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
      if (user!=null){
        DocumentReference userDocRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
        await userDocRef.collection('completeList').add({
          'taskType' : taskType,
          'taskTitle': taskTitle,
          'date': date,
          //'date': DateFormat('dd-MM-yyyy').format(DateTime.now()),
          'description':taskDescription,
        });  // Data saved successfully
        print('Task saved to Firestore');
        Get.snackbar("Task Add to Todo List", "Task Saved Successfully");

        // Hide the progress indicator and navigate
        Navigator.of(context).pop();
        Get.offAndToNamed(AppRoutes.dashboardRoute);
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

  void deleteCompleteTask(String documentId) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentReference userDocRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

        // Specify the path to the document you want to delete
        DocumentReference taskDocRef =
        userDocRef.collection('completeList').doc(documentId);

        // Delete the task
        await taskDocRef.delete();

        print('Task deleted from Firestore');
        Get.snackbar("Task Deleted", "Task Deleted Successfully");
      } else {
        // Handle the case where the user is not authenticated
        print('User is not authenticated');
        Get.snackbar('Error', 'User is not authenticated');
      }
    } catch (e) {
      // Handle errors here
      print('Error deleting task: $e');
      Get.snackbar('Error deleting task:', '$e');
    }
  }



}
