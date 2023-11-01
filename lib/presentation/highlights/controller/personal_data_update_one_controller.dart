import 'package:daone/core/app_export.dart';

import '../models/personal_data_update_one_model.dart';

class PersonalDataUpdateOneController extends GetxController {Rx<PersonalDataUpdateOneModel> personalDataUpdateOneModelObj = PersonalDataUpdateOneModel().obs;

SelectionPopupModel? selectedDropDownValue;

onSelected(dynamic value) { for (var element in personalDataUpdateOneModelObj.value.dropdownItemList.value) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}} personalDataUpdateOneModelObj.value.dropdownItemList.refresh(); } 
 }
