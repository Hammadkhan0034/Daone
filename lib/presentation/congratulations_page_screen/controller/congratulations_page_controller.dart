import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/congratulations_page_screen/models/congratulations_page_model.dart';

/// A controller class for the CongratulationsPageScreen.
///
/// This class manages the state of the CongratulationsPageScreen, including the
/// current congratulationsPageModelObj
class CongratulationsPageController extends GetxController {
  Rx<CongratulationsPageModel> congratulationsPageModelObj =
      CongratulationsPageModel().obs;
}
