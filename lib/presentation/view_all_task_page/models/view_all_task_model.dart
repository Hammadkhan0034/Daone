import 'package:get/get.dart';
import 'view_all_task_item_model.dart';
import 'package:daone/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [view_all_task_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ViewAllTaskModel {
  Rx<List<ViewAllTaskItemModel>> viewAllTaskItemList =
      Rx(List.generate(4, (index) => ViewAllTaskItemModel()));

  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ]);
}
