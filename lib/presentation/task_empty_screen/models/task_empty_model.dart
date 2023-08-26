import 'package:get/get.dart';import 'listmonth1_item_model.dart';import 'listgroup_item_model.dart';import 'package:daone/data/models/selectionPopupModel/selection_popup_model.dart';/// This class defines the variables used in the [task_empty_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class TaskEmptyModel {Rx<List<Listmonth1ItemModel>> listmonth1ItemList = Rx(List.generate(5,(index) => Listmonth1ItemModel()));

Rx<List<ListgroupItemModel>> listgroupItemList = Rx(List.generate(4,(index) => ListgroupItemModel()));

Rx<List<SelectionPopupModel>> dropdownItemList = Rx([SelectionPopupModel(id:1,title:"Item One",isSelected:true,),SelectionPopupModel(id:2,title:"Item Two",),SelectionPopupModel(id:3,title:"Item Three",)]);

 }
