import '../controller/daily_intension_record_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DailyIntensionRecordScreen.
///
/// This class ensures that the DailyIntensionRecordController is created when the
/// DailyIntensionRecordScreen is first loaded.
class DailyIntensionRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DailyIntensionRecordController());
  }
}
