import 'package:daone/core/app_export.dart';import 'package:daone/presentation/view_all_task_page/models/view_all_task_model.dart';/// A controller class for the ViewAllTaskPage.
///
/// This class manages the state of the ViewAllTaskPage, including the
/// current viewAllTaskModelObj
class ViewAllTaskController extends GetxController {ViewAllTaskController(this.viewAllTaskModelObj);

Rx<ViewAllTaskModel> viewAllTaskModelObj;

SelectionPopupModel? selectedDropDownValue;

onSelected(dynamic value) { for (var element in viewAllTaskModelObj.value.dropdownItemList.value) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}} viewAllTaskModelObj.value.dropdownItemList.refresh(); } 
 }
