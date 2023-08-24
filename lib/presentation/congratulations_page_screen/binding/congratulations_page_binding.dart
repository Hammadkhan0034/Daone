import '../controller/congratulations_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CongratulationsPageScreen.
///
/// This class ensures that the CongratulationsPageController is created when the
/// CongratulationsPageScreen is first loaded.
class CongratulationsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CongratulationsPageController());
  }
}
