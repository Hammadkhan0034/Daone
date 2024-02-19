import 'package:daone/presentation/send_friend_invite/send_friend_invite.dart';
import 'package:daone/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:alarm/alarm.dart';
import 'core/utils/initial_bindings.dart';
import 'localization/app_localization.dart';
import 'presentation/friend_finder/friend_finder.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Alarm.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(MyApp());
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
        primarySwatch: Colors.deepOrange

      ),
      translations: AppLocalization(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      title: 'daone',
home: FriendFinderPage(),
      initialBinding: InitialBindings(),
      // initialRoute: determineInitialRoute(),
      // getPages: AppRoutes.pages,
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