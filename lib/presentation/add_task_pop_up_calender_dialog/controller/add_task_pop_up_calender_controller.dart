import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/add_task_pop_up_calender_dialog/models/add_task_pop_up_calender_model.dart';

/// A controller class for the AddTaskPopUpCalenderDialog.
///
/// This class manages the state of the AddTaskPopUpCalenderDialog, including the
/// current addTaskPopUpCalenderModelObj
class AddTaskPopUpCalenderController extends GetxController {
  Rx<AddTaskPopUpCalenderModel> addTaskPopUpCalenderModelObj =
      AddTaskPopUpCalenderModel().obs;
}
