import 'package:get/get.dart';import 'select_task_item_model.dart';import 'package:daone/data/models/selectionPopupModel/selection_popup_model.dart';/// This class defines the variables used in the [select_task_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SelectTaskModel {Rx<List<SelectTaskItemModel>> selectTaskItemList = Rx(List.generate(4,(index) => SelectTaskItemModel()));

Rx<List<SelectionPopupModel>> dropdownItemList = Rx([SelectionPopupModel(id:1,title:"Item One",isSelected:true,),SelectionPopupModel(id:2,title:"Item Two",),SelectionPopupModel(id:3,title:"Item Three",)]);

 }
class AlarmModel {
 String title;
 DateTime dateTime;

 AlarmModel({required this.dateTime,required this.title});
}