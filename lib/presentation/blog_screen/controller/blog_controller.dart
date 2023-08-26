import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/blog_screen/models/blog_model.dart';

/// A controller class for the BlogScreen.
///
/// This class manages the state of the BlogScreen, including the
/// current blogModelObj
class BlogController extends GetxController {
  Rx<BlogModel> blogModelObj = BlogModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element in blogModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    blogModelObj.value.dropdownItemList.refresh();
  }
}
