

import 'package:daone/alarm_noti/notifyhelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotiScreen extends StatefulWidget {
  const NotiScreen({Key? key}) : super(key: key);

  @override
  State<NotiScreen> createState() => _NotiScreenState();
}



class _NotiScreenState extends State<NotiScreen> {
 var notifyHelper;

 @override
 void initState() {
   super.initState();
   notifyHelper = NotifyHelper();
   notifyHelper.initializeNotification();
   notifyHelper.scheduleNotification(); // Schedule a notification
   notifyHelper.requestIOSPermissions();
 }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:  Scaffold(
          backgroundColor: Colors.teal,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  notifyHelper.displayNotification(
                    title:'hello',body:'isDarkMode',
                  );
                },
                child: Text("Send Noti"),
              ),
              ElevatedButton(
                onPressed: () {
                  notifyHelper.scheduleNotification();

                },
                child: Text("Schedule Noti"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement logic to stop notifications if needed
                },
                child: Text("Stop Noti"),
              ),
            ],
          ),
        ),
    );
  }
}
