import 'package:daone/core/app_export.dart';import 'package:daone/presentation/personal_data_update_one_screen/models/personal_data_update_one_model.dart';/// A controller class for the PersonalDataUpdateOneScreen.
///
/// This class manages the state of the PersonalDataUpdateOneScreen, including the
/// current personalDataUpdateOneModelObj
class PersonalDataUpdateOneController extends GetxController {Rx<PersonalDataUpdateOneModel> personalDataUpdateOneModelObj = PersonalDataUpdateOneModel().obs;

SelectionPopupModel? selectedDropDownValue;

onSelected(dynamic value) { for (var element in personalDataUpdateOneModelObj.value.dropdownItemList.value) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}} personalDataUpdateOneModelObj.value.dropdownItemList.refresh(); } 
 }
