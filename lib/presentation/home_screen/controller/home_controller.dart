import 'package:daone/core/app_export.dart';import 'package:daone/presentation/home_screen/models/home_model.dart';/// A controller class for the HomeScreen.
///
/// This class manages the state of the HomeScreen, including the
/// current homeModelObj
class HomeController extends GetxController {Rx<HomeModel> homeModelObj = HomeModel().obs;

Rx<bool> isCheckbox = false.obs;

SelectionPopupModel? selectedDropDownValue;

onSelected(dynamic value) { for (var element in homeModelObj.value.dropdownItemList.value) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}} homeModelObj.value.dropdownItemList.refresh(); } 
 }
