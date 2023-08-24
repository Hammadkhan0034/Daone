import 'package:daone/core/app_export.dart';import 'package:daone/presentation/add_task_screen/models/add_task_model.dart';import 'package:flutter/material.dart';/// A controller class for the AddTaskScreen.
///
/// This class manages the state of the AddTaskScreen, including the
/// current addTaskModelObj
class AddTaskController extends GetxController {TextEditingController group216Controller = TextEditingController();

Rx<AddTaskModel> addTaskModelObj = AddTaskModel().obs;

Rx<String> radioGroup = "".obs;

SelectionPopupModel? selectedDropDownValue;

@override void onClose() { super.onClose(); group216Controller.dispose(); } 
onSelected(dynamic value) { for (var element in addTaskModelObj.value.dropdownItemList.value) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}} addTaskModelObj.value.dropdownItemList.refresh(); } 
 }
