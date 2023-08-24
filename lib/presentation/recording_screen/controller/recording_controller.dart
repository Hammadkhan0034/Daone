import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/recording_screen/models/recording_model.dart';

/// A controller class for the RecordingScreen.
///
/// This class manages the state of the RecordingScreen, including the
/// current recordingModelObj
class RecordingController extends GetxController {
  Rx<RecordingModel> recordingModelObj = RecordingModel().obs;
}
