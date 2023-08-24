import '../controller/task_empty_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TaskEmptyScreen.
///
/// This class ensures that the TaskEmptyController is created when the
/// TaskEmptyScreen is first loaded.
class TaskEmptyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskEmptyController());
  }
}
