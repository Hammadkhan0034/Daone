import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/select_task_screen/models/select_task_model.dart';

/// A controller class for the SelectTaskScreen.
///
/// This class manages the state of the SelectTaskScreen, including the
/// current selectTaskModelObj
class SelectTaskController extends GetxController {
  Rx<SelectTaskModel> selectTaskModelObj = SelectTaskModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element in selectTaskModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    selectTaskModelObj.value.dropdownItemList.refresh();
  }
}
