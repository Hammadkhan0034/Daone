import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/latest_blog_one_screen/models/latest_blog_one_model.dart';

/// A controller class for the LatestBlogOneScreen.
///
/// This class manages the state of the LatestBlogOneScreen, including the
/// current latestBlogOneModelObj
class LatestBlogOneController extends GetxController {
  Rx<LatestBlogOneModel> latestBlogOneModelObj = LatestBlogOneModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element in latestBlogOneModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    latestBlogOneModelObj.value.dropdownItemList.refresh();
  }
}
