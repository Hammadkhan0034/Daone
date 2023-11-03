import 'package:daone/presentation/select_task_screen/Alarm/AlarmController.dart';
import 'package:daone/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/utils/initial_bindings.dart';
import 'localization/app_localization.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // tzdata.initializeTimeZones();
  // // Set the local time zone to 'Asia/Karachi'
  // final location = tz.getLocation('Asia/Karachi');
  // tz.setLocalLocation(location);
  //
  // // Now you can work with time zones using the 'Asia/Karachi' time zone.
  // // For example, you can create a TZDateTime in the 'Asia/Karachi' time zone:
  // final karachiTime = tz.TZDateTime.now(location);
  //
  // print('Current time in Karachi: $karachiTime');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(MyApp());
    final alarmcontroller = Get.put(AlarmController());
    alarmcontroller.registerAlarmPlugin();
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      popGesture: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
        timePickerTheme: TimePickerThemeData(
          dialBackgroundColor: Colors.black12,
          backgroundColor: Colors.grey[200],
          hourMinuteTextColor: Colors.black,
          dialHandColor: Colors.deepOrange,
          dialTextColor: Colors.black,
        ),
      ),
      translations: AppLocalization(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      title: 'daone',
      initialBinding: InitialBindings(),
      initialRoute: determineInitialRoute(),
      getPages: AppRoutes.pages,
    );
  }

  String determineInitialRoute() {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;

    if (user != null) {
      return AppRoutes.dashboardRoute;
    } else {
      return AppRoutes.welcomeScreenOneScreen;
    }
  }
}