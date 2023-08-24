import '../controller/recording_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RecordingScreen.
///
/// This class ensures that the RecordingController is created when the
/// RecordingScreen is first loaded.
class RecordingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecordingController());
  }
}
