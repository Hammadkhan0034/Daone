import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/add_task_model.dart';

/// A controller class for the AddTaskScreen.
///
/// This class manages the state of the AddTaskScreen, including the
/// current addTaskModelObj
class AddTaskController extends GetxController {
  late FocusNode titleFocusNode;
  late FocusNode descriptionFocusNode;
  TextEditingController group216Controller = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Rx<AddTaskModel> addTaskModelObj = AddTaskModel().obs;

  final user = FirebaseAuth.instance.currentUser!.email;

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
        final dateTime=DateTime.now();
        String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
        DocumentReference userDocRef = FirebaseFirestore.instance.collection('users').doc(user.email);
      await userDocRef.collection('tasks').add({
        'taskType' :selectedValue.value,
        'taskTitle': taskTitle,
        'status' : '',
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
        FirebaseFirestore.instance.collection('users').doc(user.email);

        // Specify the path to the document you want to delete
        DocumentReference taskDocRef =
        userDocRef.collection('tasks').doc(documentId);

        // Delete the task
        await taskDocRef.delete();
        Get.back();
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
  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }
  //
  // void updateSelectedDate(DateTime? date){
  // selectedDate.value = date;
  // }

@override
  void onInit() {
  titleFocusNode=FocusNode();
  descriptionFocusNode=FocusNode();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    group216Controller.dispose();
    descriptionController.dispose();
    titleFocusNode.dispose();
    descriptionFocusNode.dispose();
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
    void updateToTodo(var documentId,){
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('users')
          .doc(user)
          .collection('tasks')
          .doc(documentId); // Replace with the ID of the document you want to update

      String newStatus = 'todo';


      documentReference.update({
        'status': newStatus,
      }).then((value) {
        Get.back();
        Get.snackbar("Task Add to Todo List", "Task Saved Successfully");
      }).catchError((error) {
        Get.snackbar('Error', 'User is not authenticated');
      });
    }
    //completeTask
  void updateToComplete(var documentId,){
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(user)
        .collection('tasks')
        .doc(documentId); // Replace with the ID of the document you want to update

    String newStatus = 'compelete';


    documentReference.update({
      'status': newStatus,
    }).then((value) {
      Get.back();
      Get.snackbar("Task Add to Complete List", "Task Saved Successfully");
    }).catchError((error) {
      Get.snackbar('Error', 'User is not authenticated');
    });
  }









}
