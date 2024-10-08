


import 'dart:math';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/select_task_model.dart';

class AlarmController extends GetxController{

  List<int> numbers = List<int>.generate(100, (index) => index + 1);

  int selectRandomNumber(List<int> numbers) {
    final random = Random();
    final randomIndex = random.nextInt(numbers.length);
    return numbers[randomIndex];
  }

  Rx<TimeOfDay> selectedTime1 = TimeOfDay.now().obs;
  TextEditingController alarmController = TextEditingController();



  Future<void> selectTime1(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime1.value,
    );

    if (pickedTime != null) {
      selectedTime1.value = pickedTime;
    }
  }

  Future<void> deleteAlarm(String documentId) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final collectionReference = FirebaseFirestore.instance
          .collection("users")
          .doc(user?.email)
          .collection('Alarm');

      await collectionReference.doc(documentId).delete();
      Get.snackbar(
        'Success',
        'Alarm deleted successfully',
        backgroundColor: Colors.white, // Customize the snackbar appearance
        snackPosition: SnackPosition.BOTTOM, // Adjust the position as needed
        duration: Duration(seconds: 2), // Adjust the duration as needed
        isDismissible: true, // Set to true to allow dismissing the snackbar
        dismissDirection:DismissDirection.horizontal, // Dismiss direction
      );
      print('Alarm deleted successfully');
    } catch (e) {
      print('Error deleting alarm: $e');
      Get.snackbar(
        'Error',
        '$e',
        backgroundColor: Colors.green, // Customize the snackbar appearance
        snackPosition: SnackPosition.BOTTOM, // Adjust the position as needed
        duration: Duration(seconds: 2), // Adjust the duration as needed
        isDismissible: true, // Set to true to allow dismissing the snackbar
        dismissDirection:DismissDirection.horizontal, // Dismiss direction
      );
    }
  }

  Future<void> saveAlarmToFirestore(String title, DateTime dateTime,int id) async {
    final firestore = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser?.email;
    final collectionReference = firestore.collection("users").doc(user!).collection('Alarm');

    try {
      await collectionReference.add({
        'title': title,
        'dateTime': dateTime,
        'id': id
      });

      // Show a success message to the user using a snackbar
      Get.snackbar(
        'Success',
        'Alarm saved successfully!',
        backgroundColor: Colors.white,
        colorText: Colors.black,
      );
      Get.back();
    } catch (error) {
      // Handle any errors, e.g., show an error snackbar or log the error
      Get.snackbar(
        'Error',
        'An error occurred while saving the alarm.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      Get.back();
      print('Error saving alarm: $error');
    }
  }

}