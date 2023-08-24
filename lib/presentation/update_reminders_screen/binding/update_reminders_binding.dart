import '../controller/update_reminders_controller.dart';
import 'package:get/get.dart';

/// A binding class for the UpdateRemindersScreen.
///
/// This class ensures that the UpdateRemindersController is created when the
/// UpdateRemindersScreen is first loaded.
class UpdateRemindersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateRemindersController());
  }
}
