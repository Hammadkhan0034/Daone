

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/model.dart';

class SleepTrackingController extends GetxController {
  RxDouble currentValue = 0.0.obs;
  RxString selectedWeekday = 'Monday'.obs;
  final user = FirebaseAuth.instance.currentUser;

  void setSelectedWeekday(String weekday) {
    selectedWeekday.value = weekday;
  }

  Duration calculateSleepingHours(DateTime sleepTime, DateTime wakeupTime) {
    // Calculate the duration between sleep and wakeup times
    return wakeupTime.difference(sleepTime);
  }

  DateTime convertTimeOfDayToDateTime(TimeOfDay time) {
    final now = DateTime.now(); // Get the current date
    return DateTime(now.year, now.month, now.day, time.hour, time.minute);
  }

  Rx<TimeOfDay> selectedTime1 = TimeOfDay
      .now()
      .obs;
  Rx<TimeOfDay> selectedTime2 = TimeOfDay
      .now()
      .obs;

  Future<void> selectTime1(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime1.value,
    );

    if (pickedTime != null) {
      selectedTime1.value = pickedTime;
    }
  }

  Future<void> selectTime2(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime2.value,
    );

    if (pickedTime != null) {
      selectedTime2.value = pickedTime;
    }
  }


  Future<void> saveSleepDatabase() async {
    final sleepDataCollection = FirebaseFirestore.instance.collection('users')
        .doc(user!.uid)
        .collection("sleepData")
        .doc('week'); // 'week' is a document, not a subcollection

    // Sample sleep data for each day of the week
    final sleepData = {
      'Monday': {
        'start_time': '00:00',
        'end_time': '00:00',
        'duration': 0,
        'quality': '',
      },
      'Tuesday': {
        'start_time': '00:00',
        'end_time': '00:00',
        'duration': 0,
        'quality': '',
      },
      'Wednesday': {
        'start_time': '00:00',
        'end_time': '00:00',
        'duration': 8.25,
        'quality': '',
      },
      'Thursday': {
        'start_time': '00:00',
        'end_time': '00:00',
        'duration': 0,
        'quality': '',
      },
      'Friday': {
        'start_time': '00:00',
        'end_time': '00:00',
        'duration': 0,
        'quality': '',
      },
      'Saturday': {
        'start_time': '00:00',
        'end_time': '00:00',
        'duration': 0,
        'quality': '',
      },
      'Sunday': {
        'start_time': '00:00',
        'end_time': '00:00',
        'duration': 0,
        'quality': '',
      },
    };

    // Set the sleep data for the week in the Firestore document
    await sleepDataCollection.set(sleepData);
  }
}
//
// sleepDataCollection.doc(sleepData.id).set({
// 'sleepStartTime': sleepData.sleepStartTime.toString(),
// 'sleepEndTime': sleepData.sleepEndTime.toString(),
// 'selectedWeekday': sleepData.selectedWeekday,
// });