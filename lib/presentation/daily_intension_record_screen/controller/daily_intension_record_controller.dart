import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/daily_intension_record_screen/models/daily_intension_record_model.dart';

/// A controller class for the DailyIntensionRecordScreen.
///
/// This class manages the state of the DailyIntensionRecordScreen, including the
/// current dailyIntensionRecordModelObj
class DailyIntensionRecordController extends GetxController {
  Rx<DailyIntensionRecordModel> dailyIntensionRecordModelObj =
      DailyIntensionRecordModel().obs;
}
