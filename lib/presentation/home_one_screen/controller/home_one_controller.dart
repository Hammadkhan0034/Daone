import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/home_one_screen/models/home_one_model.dart';

/// A controller class for the HomeOneScreen.
///
/// This class manages the state of the HomeOneScreen, including the
/// current homeOneModelObj
class HomeOneController extends GetxController {
 Rx<HomeOneModel> homeOneModelObj = HomeOneModel().obs;
  Rx<bool> isCheckbox = false.obs;
  SelectionPopupModel? selectedDropDownValue;







  onSelected(dynamic value) {
    for (var element in homeOneModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    homeOneModelObj.value.dropdownItemList.refresh();
  }
}
