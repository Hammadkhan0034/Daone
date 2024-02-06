

import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/dashboard/controller/dashboard_controller.dart';
import 'package:daone/presentation/home_one_screen/home_one_screen.dart';
import 'package:daone/presentation/select_task_screen/controller/select_task_controller.dart';
import 'package:daone/presentation/stats_screen/controller/stats_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../account_setting_screen/controller/account_setting_controller.dart';
import '../../select_affirmation_screen/controller/select_affirmation_controller.dart';
import '../../view_all_task_tab_container_screen/controller/view_all_task_tab_container_controller.dart';

class DashBoardBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DashBoardController>(()=>DashBoardController());
    Get.lazyPut(() => ViewAllTaskTabContainerController());
    Get.lazyPut(() => SelectTaskController());
    Get.lazyPut(() => HomeOneScreen());
    Get.lazyPut(() => StatsController());
    Get.lazyPut(() => SelectAffirmationController());
    Get.lazyPut(() => AccountSettingController());

  }

}