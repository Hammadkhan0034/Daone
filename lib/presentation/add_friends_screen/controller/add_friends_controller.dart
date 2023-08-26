import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/add_friends_screen/models/add_friends_model.dart';

/// A controller class for the AddFriendsScreen.
///
/// This class manages the state of the AddFriendsScreen, including the
/// current addFriendsModelObj
class AddFriendsController extends GetxController {
  Rx<AddFriendsModel> addFriendsModelObj = AddFriendsModel().obs;

  Rx<bool> isSelectedSwitch = false.obs;

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element in addFriendsModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    addFriendsModelObj.value.dropdownItemList.refresh();
  }
}
