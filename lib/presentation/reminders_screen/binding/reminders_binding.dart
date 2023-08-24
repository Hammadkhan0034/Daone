import '../controller/reminders_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RemindersScreen.
///
/// This class ensures that the RemindersController is created when the
/// RemindersScreen is first loaded.
class RemindersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RemindersController());
  }
}
