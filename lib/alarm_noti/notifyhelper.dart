import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
class NotifyHelper{
  FlutterLocalNotificationsPlugin
  flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin(); //

  initializeNotification() async {
   tz.initializeTimeZones();

    // // Initialize the "Asia/Karachi" time zone (PKT)
    // final String karachiTimeZoneId = 'Asia/Karachi';
    // final tz.Location karachiLocation = tz.getLocation(karachiTimeZoneId);
    //
    // // Load time zone data
    // tz.initializeTimeZones();
    //
    // // Initialize time zones
    // tz.initializeTimeZones();
    // // this is for latest iOS settings
    final DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
        requestSoundPermission: false,
        requestBadgePermission: false,
        requestAlertPermission: false,
        onDidReceiveLocalNotification: onDidReceiveLocalNotification
    );

    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('logo');

      final InitializationSettings initializationSettings =
      InitializationSettings(
      iOS: initializationSettingsIOS,
      android:initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
    );}
  scheduledNotification() async {
    final tz.TZDateTime scheduledTime = tz.TZDateTime(
      tz.local,
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      DateTime.now().hour,
      DateTime.now().minute,
    ).add(const Duration(seconds: 5));
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'scheduled title',
        'theme changes 5 seconds ago',
        scheduledTime,
        const NotificationDetails(
            android: AndroidNotificationDetails('your channel id',
                'your channel name',
            )),

        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime );
      print(  tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)));
      print(  tz.TZDateTime.now(tz.local).hour);
  }


  displayNotification({required String title, required String body}) async {
    print("doing test");
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = new DarwinNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
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
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future onDidReceiveLocalNotification(
      int? id, String? title, String? body, String? payload) async {
  Get.dialog(Text('hello'));
  }

}