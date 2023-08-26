import '../controller/select_affirmation_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SelectAffirmationScreen.
///
/// This class ensures that the SelectAffirmationController is created when the
/// SelectAffirmationScreen is first loaded.
class SelectAffirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectAffirmationController());
  }
}
