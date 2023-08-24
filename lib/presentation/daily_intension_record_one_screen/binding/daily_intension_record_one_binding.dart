import '../controller/daily_intension_record_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DailyIntensionRecordOneScreen.
///
/// This class ensures that the DailyIntensionRecordOneController is created when the
/// DailyIntensionRecordOneScreen is first loaded.
class DailyIntensionRecordOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DailyIntensionRecordOneController());
  }
}
