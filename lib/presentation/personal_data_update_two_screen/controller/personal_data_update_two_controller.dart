import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/personal_data_update_two_screen/models/personal_data_update_two_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the PersonalDataUpdateTwoScreen.
///
/// This class manages the state of the PersonalDataUpdateTwoScreen, including the
/// current personalDataUpdateTwoModelObj
class PersonalDataUpdateTwoController extends GetxController {
  TextEditingController lastnameController = TextEditingController();

  TextEditingController phonenumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController newpasswordController = TextEditingController();

  Rx<PersonalDataUpdateTwoModel> personalDataUpdateTwoModelObj =
      PersonalDataUpdateTwoModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isShowPassword1 = true.obs;

  SelectionPopupModel? selectedDropDownValue;

  @override
  void onClose() {
    super.onClose();
    lastnameController.dispose();
    phonenumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    newpasswordController.dispose();
  }

  onSelected(dynamic value) {
    for (var element
        in personalDataUpdateTwoModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    personalDataUpdateTwoModelObj.value.dropdownItemList.refresh();
  }
}
