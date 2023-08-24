import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/sleep_tracker_screen/models/sleep_tracker_model.dart';

/// A controller class for the SleepTrackerScreen.
///
/// This class manages the state of the SleepTrackerScreen, including the
/// current sleepTrackerModelObj
class SleepTrackerController extends GetxController {
  Rx<SleepTrackerModel> sleepTrackerModelObj = SleepTrackerModel().obs;

  Rx<bool> isSelectedSwitch = false.obs;

  Rx<bool> isSelectedSwitch1 = false.obs;
}
