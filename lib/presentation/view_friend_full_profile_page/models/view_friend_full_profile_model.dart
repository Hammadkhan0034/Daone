import 'package:get/get.dart';import 'package:daone/data/models/selectionPopupModel/selection_popup_model.dart';/// This class defines the variables used in the [view_friend_full_profile_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ViewFriendFullProfileModel {Rx<List<SelectionPopupModel>> dropdownItemList = Rx([SelectionPopupModel(id:1,title:"Item One",isSelected:true,),SelectionPopupModel(id:2,title:"Item Two",),SelectionPopupModel(id:3,title:"Item Three",)]);

 }
