import '../controller/calender_controller.dart';
import '../controller/view_all_task_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ViewAllTaskTabContainerScreen.
///
/// This class ensures that the ViewAllTaskTabContainerController is created when the
/// ViewAllTaskTabContainerScreen is first loaded.
class ViewAllTaskTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewAllTaskTabContainerController());
    Get.lazyPut(() =>  CalendarController());
  }
}
