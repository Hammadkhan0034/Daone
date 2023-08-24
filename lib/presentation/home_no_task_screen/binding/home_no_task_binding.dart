import '../controller/home_no_task_controller.dart';
import 'package:get/get.dart';

/// A binding class for the HomeNoTaskScreen.
///
/// This class ensures that the HomeNoTaskController is created when the
/// HomeNoTaskScreen is first loaded.
class HomeNoTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeNoTaskController());
  }
}
