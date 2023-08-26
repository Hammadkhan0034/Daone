import 'package:daone/core/app_export.dart';import 'package:daone/presentation/select_affirmation_screen/models/select_affirmation_model.dart';/// A controller class for the SelectAffirmationScreen.
///
/// This class manages the state of the SelectAffirmationScreen, including the
/// current selectAffirmationModelObj
class SelectAffirmationController extends GetxController {Rx<SelectAffirmationModel> selectAffirmationModelObj = SelectAffirmationModel().obs;

SelectionPopupModel? selectedDropDownValue;

onSelected(dynamic value) { for (var element in selectAffirmationModelObj.value.dropdownItemList.value) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}} selectAffirmationModelObj.value.dropdownItemList.refresh(); } 
 }
