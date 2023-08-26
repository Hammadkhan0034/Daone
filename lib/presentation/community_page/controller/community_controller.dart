import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/community_page/models/community_model.dart';

/// A controller class for the CommunityPage.
///
/// This class manages the state of the CommunityPage, including the
/// current communityModelObj
class CommunityController extends GetxController {
  CommunityController(this.communityModelObj);

  Rx<CommunityModel> communityModelObj;

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element in communityModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    communityModelObj.value.dropdownItemList.refresh();
  }
}
