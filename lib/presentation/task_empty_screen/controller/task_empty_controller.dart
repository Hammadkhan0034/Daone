import 'package:daone/core/app_export.dart';import 'package:daone/presentation/task_empty_screen/models/task_empty_model.dart';/// A controller class for the TaskEmptyScreen.
///
/// This class manages the state of the TaskEmptyScreen, including the
/// current taskEmptyModelObj
class TaskEmptyController extends GetxController {Rx<TaskEmptyModel> taskEmptyModelObj = TaskEmptyModel().obs;

SelectionPopupModel? selectedDropDownValue;

onSelected(dynamic value) { for (var element in taskEmptyModelObj.value.dropdownItemList.value) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}} taskEmptyModelObj.value.dropdownItemList.refresh(); } 
 }
