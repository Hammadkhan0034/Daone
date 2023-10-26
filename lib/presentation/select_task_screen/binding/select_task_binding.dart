import 'package:daone/presentation/select_task_screen/Alarm/AlarmController.dart';

import '../controller/select_task_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SelectTaskScreen.
///
/// This class ensures that the SelectTaskController is created when the
/// SelectTaskScreen is first loaded.
class SelectTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectTaskController());
    Get.lazyPut(() => AlarmController());
  }
}
