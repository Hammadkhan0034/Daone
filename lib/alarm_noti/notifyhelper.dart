import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotifyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  initializeNotification() async {
    tz.initializeTimeZones();

    final tz.TZDateTime now = tz.TZDateTime.now(tz.getLocation('Asia/Karachi'));

    final DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('logo');

    final InitializationSettings initializationSettings = InitializationSettings(
      iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> scheduleNotification() async {
    // Initialize time zones (if not already done)
    tz.initializeTimeZones();

    // Calculate the scheduled time, e.g., 5 seconds from now
    final scheduledTime = tz.TZDateTime.now(tz.getLocation('Asia/Karachi'))
        .add(const Duration(seconds: 5));

    // Define the notification details
    final notificationDetails = const NotificationDetails(
      android: AndroidNotificationDetails(
        'your_channel_id', // Replace with your channel ID
        'your_channel_name', // Replace with your channel name
      ),
    );

    // Schedule the notification
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0, // Notification ID (can be any unique integer)
      'Scheduled Title', // Notification title
      'This is a scheduled notification', // Notification body
      scheduledTime,
      notificationDetails,
      payload: 'Default sound',
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );

    print('Scheduled notification for: $scheduledTime');
  }


  displayNotification({required String title, required String body}) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      importance: Importance.max,
      priority: Priority.high,
    );

    var iOSPlatformChannelSpecifics = DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'Default sound',
    );
  }

  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future onDidReceiveLocalNotification(
      int? id, String? title, String? body, String? payload) async {
    Get.dialog(Text('Hello'));
  }
}
