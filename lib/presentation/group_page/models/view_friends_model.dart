import 'package:get/get.dart';
import 'view_friends1_item_model.dart';
import 'package:daone/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [view_friends_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ViewFriendsModel {
  Rx<List<ViewFriends1ItemModel>> viewFriends1ItemList =
      Rx(List.generate(2, (index) => ViewFriends1ItemModel()));

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
