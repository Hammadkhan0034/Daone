import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/reminders_screen/models/reminders_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the RemindersScreen.
///
/// This class manages the state of the RemindersScreen, including the
/// current remindersModelObj
class RemindersController extends GetxController {
  TextEditingController remindertitleController = TextEditingController();

  Rx<RemindersModel> remindersModelObj = RemindersModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  @override
  void onClose() {
    super.onClose();
    remindertitleController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in remindersModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    remindersModelObj.value.dropdownItemList.refresh();
  }
}
