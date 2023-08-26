import 'package:get/get.dart';import 'completedtask1_item_model.dart';import 'package:daone/data/models/selectionPopupModel/selection_popup_model.dart';/// This class defines the variables used in the [home_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeOneModel {Rx<List<Completedtask1ItemModel>> completedtask1ItemList = Rx(List.generate(5,(index) => Completedtask1ItemModel()));

Rx<List<SelectionPopupModel>> dropdownItemList = Rx([SelectionPopupModel(id:1,title:"Item One",isSelected:true,),SelectionPopupModel(id:2,title:"Item Two",),SelectionPopupModel(id:3,title:"Item Three",)]);

 }
