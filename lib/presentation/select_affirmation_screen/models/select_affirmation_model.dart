import 'package:get/get.dart';import 'select_item_model.dart';import 'package:daone/data/models/selectionPopupModel/selection_popup_model.dart';/// This class defines the variables used in the [select_affirmation_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SelectAffirmationModel {Rx<List<SelectItemModel>> selectItemList = Rx(List.generate(6,(index) => SelectItemModel()));

Rx<List<SelectionPopupModel>> dropdownItemList = Rx([SelectionPopupModel(id:1,title:"Item One",isSelected:true,),SelectionPopupModel(id:2,title:"Item Two",),SelectionPopupModel(id:3,title:"Item Three",)]);

 }
