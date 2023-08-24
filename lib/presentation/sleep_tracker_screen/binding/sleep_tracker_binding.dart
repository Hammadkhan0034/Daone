import '../controller/sleep_tracker_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SleepTrackerScreen.
///
/// This class ensures that the SleepTrackerController is created when the
/// SleepTrackerScreen is first loaded.
class SleepTrackerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SleepTrackerController());
  }
}
