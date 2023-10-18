import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SleepTrackingController extends GetxController {

  RxDouble currentValue = 0.0.obs;

  RxString selectedWeekday = 'Monday'.obs;

  final user = FirebaseAuth.instance.currentUser;

  Rx<TimeOfDay> selectedTime1 = TimeOfDay.now().obs;

  Rx<TimeOfDay> selectedTime2 = TimeOfDay.now().obs;

  final List<double> sleepData = [8, 10, 14, 15, 13, 10, 16];


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
    await sleepDataCollection.set(sleepData);
  }






}
