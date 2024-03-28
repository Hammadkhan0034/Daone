import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/account_setting_screen/models/account_setting_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// A controller class for the AccountSettingScreen.
///
/// This class manages the state of the AccountSettingScreen, including the
/// current accountSettingModelObj
class AccountSettingController extends GetxController {
  Rx<AccountSettingModel> accountSettingModelObj = AccountSettingModel().obs;

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(AppRoutes.loginPageScreen);
  }



  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element in accountSettingModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    accountSettingModelObj.value.dropdownItemList.refresh();
  }
}
