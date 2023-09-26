import 'package:get/get.dart';
import 'listmonth_item_model.dart';

/// This class defines the variables used in the [view_all_task_tab_container_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ViewAllTaskTabContainerModel {
  Rx<List<ListmonthItemModel>> listmonthItemList =
      Rx(List.generate(5, (index) => ListmonthItemModel()));
}
