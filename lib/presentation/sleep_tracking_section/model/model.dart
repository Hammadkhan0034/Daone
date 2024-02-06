import 'package:flutter/material.dart';

class SleepData {
  final String id;
  final TimeOfDay sleepStartTime;
  final TimeOfDay sleepEndTime;
  final String selectedWeekday;

  SleepData({
    required this.id,
    required this.sleepStartTime,
    required this.sleepEndTime,
    required this.selectedWeekday,
  });
}
