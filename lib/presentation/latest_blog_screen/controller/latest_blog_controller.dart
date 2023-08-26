import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/latest_blog_screen/models/latest_blog_model.dart';

/// A controller class for the LatestBlogScreen.
///
/// This class manages the state of the LatestBlogScreen, including the
/// current latestBlogModelObj
class LatestBlogController extends GetxController {
  Rx<LatestBlogModel> latestBlogModelObj = LatestBlogModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element in latestBlogModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    latestBlogModelObj.value.dropdownItemList.refresh();
  }
}
