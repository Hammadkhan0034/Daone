import 'package:get/get.dart';import 'view_friends_item_model.dart';import 'package:daone/data/models/selectionPopupModel/selection_popup_model.dart';/// This class defines the variables used in the [view_friends_one_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ViewFriendsOneModel {Rx<List<ViewFriendsItemModel>> viewFriendsItemList = Rx(List.generate(4,(index) => ViewFriendsItemModel()));

Rx<List<SelectionPopupModel>> dropdownItemList = Rx([SelectionPopupModel(id:1,title:"Item One",isSelected:true,),SelectionPopupModel(id:2,title:"Item Two",),SelectionPopupModel(id:3,title:"Item Three",)]);

 }
