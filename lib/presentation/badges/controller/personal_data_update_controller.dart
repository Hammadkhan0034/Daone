import 'package:daone/core/app_export.dart';

import '../models/personal_data_update_model.dart';
/// A controller class for the PersonalDataUpdateScreen.
///
/// This class manages the state of the PersonalDataUpdateScreen, including the
/// current personalDataUpdateModelObj
class PersonalDataUpdateController extends GetxController {Rx<PersonalDataUpdateModel> personalDataUpdateModelObj = PersonalDataUpdateModel().obs;

SelectionPopupModel? selectedDropDownValue;

onSelected(dynamic value) { for (var element in personalDataUpdateModelObj.value.dropdownItemList.value) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}} personalDataUpdateModelObj.value.dropdownItemList.refresh(); }


 }
