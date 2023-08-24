import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/home_no_task_screen/models/home_no_task_model.dart';

/// A controller class for the HomeNoTaskScreen.
///
/// This class manages the state of the HomeNoTaskScreen, including the
/// current homeNoTaskModelObj
class HomeNoTaskController extends GetxController {
  Rx<HomeNoTaskModel> homeNoTaskModelObj = HomeNoTaskModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element in homeNoTaskModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    homeNoTaskModelObj.value.dropdownItemList.refresh();
  }
}
