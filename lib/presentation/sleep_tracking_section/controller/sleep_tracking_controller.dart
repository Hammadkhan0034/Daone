import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class SleepTrackingController extends GetxController {

  RxDouble currentValue = 0.0.obs;

  RxString selectedWeekday = 'Monday'.obs;
  RxString selectSleepQuality= 'Good'.obs;

  void getSleepQuality(String sleepQuality ){
    selectSleepQuality.value  =sleepQuality;
  }

  final user = FirebaseAuth.instance.currentUser;

  Rx<TimeOfDay> selectedTime1 = TimeOfDay.now().obs;

  Rx<TimeOfDay> selectedTime2 = TimeOfDay.now().obs;

  RxList<double> sleepDataDuration = <double>[].obs;

 // final List<String> weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

 // final List<double> sleepData = [8, 10, 14, 15, 13, 10, 16];

  RxString currentDayOfWeek = "".obs;
  @override
  void onInit() {
    super.onInit();
  getPreviousWeekdayValue();
  getBarGroupsData();
  fetchBarGroups();
  }
  List<BarChartGroupData> barGroups = [];

  Future<void> fetchBarGroups() async {
    barGroups = await getBarGroupsData();
  }
  Future<List<BarChartGroupData>> getBarGroupsData() async {
    final snapshot = await FirebaseFirestore.instance.collection('users')
        .doc(user!.email).collection('sleepData').doc('week').get();

    if (snapshot.exists) {
      final data = snapshot.data() as Map<String, dynamic>;
      final days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

      final List<BarChartGroupData> barGroups = [];

      for (int i = 0; i < days.length; i++) {
        final dayData = data[days[i]];
        var duration = dayData['duration'];
        if (duration is int) {
          duration = duration.toDouble(); // Convert int to double if needed
        }
        barGroups.add(
          BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                toY: duration,
                gradient: _barsGradient,
              ),
            ],
            showingTooltipIndicators: [0],
          ),
        );
      print('duration: $duration');


      }
      return barGroups;
    } else {
      // Handle the case where the document does not exist in Firestore
      return [];
    }
  }




  LinearGradient get _barsGradient => LinearGradient(
    colors: [
      Colors.deepOrange,
      Colors.deepOrange,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  DateTime now = DateTime.now();


// Define a function to get the previous weekday
  RxString getPreviousWeekdayValue() {
    int daysToSubtract = 1; // Change this value to adjust the number of days to subtract

    DateTime previousDay = now.subtract(Duration(days: daysToSubtract));
    RxString weekday = DateFormat('EEEE').format(previousDay).obs; // Create an RxString
    currentDayOfWeek = weekday;
    return weekday;
  }


  void setSelectedWeekday(String weekday) {
    selectedWeekday.value = weekday;
  }

  late DateTime inputDuration;

  Duration calculateSleepingHours(DateTime sleepTime, DateTime wakeupTime) {
    inputDuration =sleepTime;
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
        .doc(user!.email)
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
        'duration': 0,
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
    Get.offAndToNamed(AppRoutes.sleepTrackingRoute);
  }

  Future<void> updateDayData(String day, Map<String, dynamic> newData) async {
    final sleepDataCollection = FirebaseFirestore.instance.collection('users')
        .doc(user!.email)
        .collection("sleepData")
        .doc('week'); // 'week' is a document, not a subcollection

    // Fetch the existing data
    final snapshot = await sleepDataCollection.get();

    if (snapshot.exists) {
      final data = snapshot.data() as Map<String, dynamic>;

      // Check if the specified day exists in the data
      if (data.containsKey(day)) {
        // Update the data for the specified day
        data[day] = newData;

        // Set the updated data back to Firestore
        await sleepDataCollection.update({day: data[day]});
      }
    }
  }





}
