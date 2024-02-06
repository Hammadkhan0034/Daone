

import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/sleep_tracker_screen/controller/sleep_tracker_controller.dart';

class SleepTrackingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SleepTrackerController());
    // TODO: implement dependencies
  }

}