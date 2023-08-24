import '../controller/add_task_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddTaskScreen.
///
/// This class ensures that the AddTaskController is created when the
/// AddTaskScreen is first loaded.
class AddTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddTaskController());
  }
}
