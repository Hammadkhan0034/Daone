

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../get_dialogue_of_sleep.dart';
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
    CircularProgressIndicator();
    // Set the sleep data for the week in the Firestore document
    await sleepDataCollection.set(sleepData);
    Get.offAndToNamed(AppRoutes.addTaskScreen);
  }

  final RxBool collectionExists = false.obs;

  Future<void> checkAndHandleSleepData() async {
    // Get a reference to the user's sleepData collection
    final userCollection =
    FirebaseFirestore.instance.collection('users').doc(user!.uid).collection("sleepData");

    // Check if the collection exists
    final collectionExistsValue = await userCollection.get().then((querySnapshot) {
      return querySnapshot.docs.isNotEmpty;
    });

    collectionExists.value = collectionExistsValue;
    print(collectionExistsValue);

    if (collectionExistsValue) {
      Get.dialog(
        AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.only(left: 0),
          content:SleepDialogue(),
        ),
      );
    } else {
      Get.dialog(
        AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.only(left: 0),
          content: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white),
           height: Get.height*0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Image.asset("assets/images/2 (1).png",scale: 2,),
                ),
                SizedBox(height: Get.height*0.03,),
                InkWell(
                  onTap: (){
                    saveSleepDatabase();
                  },
                  child: Container(
                    height: Get.height*0.05,
                    width: Get.width*0.6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.deepOrange),
                    child: Center(child: TextWidget(text: "Track Your Sleep with Daone",color: Colors.white,fsize: 12)),

                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }



}
