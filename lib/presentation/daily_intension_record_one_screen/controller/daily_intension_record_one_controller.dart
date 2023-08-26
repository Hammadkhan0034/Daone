import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/daily_intension_record_one_screen/models/daily_intension_record_one_model.dart';

/// A controller class for the DailyIntensionRecordOneScreen.
///
/// This class manages the state of the DailyIntensionRecordOneScreen, including the
/// current dailyIntensionRecordOneModelObj
class DailyIntensionRecordOneController extends GetxController {
  Rx<DailyIntensionRecordOneModel> dailyIntensionRecordOneModelObj =
      DailyIntensionRecordOneModel().obs;
}
