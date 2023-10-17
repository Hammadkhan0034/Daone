import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app_export.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      popGesture: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
        timePickerTheme: TimePickerThemeData(

          dialBackgroundColor: Colors.black12,
          backgroundColor: Colors.grey[200], // Background color
          hourMinuteTextColor: Colors.black, // Hour and minute text color
          dialHandColor: Colors.deepOrange, // Clock hand color
          dialTextColor: Colors.black, // Clock dial text color
        ),
      ),
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'daone',
      initialBinding: InitialBindings(),
      initialRoute: determineInitialRoute(), // Updated initial route
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
