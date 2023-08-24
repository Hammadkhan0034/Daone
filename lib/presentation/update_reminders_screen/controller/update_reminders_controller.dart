import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/update_reminders_screen/models/update_reminders_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the UpdateRemindersScreen.
///
/// This class manages the state of the UpdateRemindersScreen, including the
/// current updateRemindersModelObj
class UpdateRemindersController extends GetxController {
  TextEditingController affirmationvideController = TextEditingController();

  Rx<UpdateRemindersModel> updateRemindersModelObj = UpdateRemindersModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  @override
  void onClose() {
    super.onClose();
    affirmationvideController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in updateRemindersModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    updateRemindersModelObj.value.dropdownItemList.refresh();
  }
}
