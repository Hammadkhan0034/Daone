import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/comment_section_screen/models/comment_section_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the CommentSectionScreen.
///
/// This class manages the state of the CommentSectionScreen, including the
/// current commentSectionModelObj
class CommentSectionController extends GetxController {
  TextEditingController typesomethingController = TextEditingController();

  Rx<CommentSectionModel> commentSectionModelObj = CommentSectionModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  @override
  void onClose() {
    super.onClose();
    typesomethingController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in commentSectionModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    commentSectionModelObj.value.dropdownItemList.refresh();
  }
}
