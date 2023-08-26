import 'package:daone/core/app_export.dart';import 'package:daone/presentation/view_friends_page/models/view_friends_model.dart';/// A controller class for the ViewFriendsPage.
///
/// This class manages the state of the ViewFriendsPage, including the
/// current viewFriendsModelObj
class ViewFriendsController extends GetxController {ViewFriendsController(this.viewFriendsModelObj);

Rx<ViewFriendsModel> viewFriendsModelObj;

SelectionPopupModel? selectedDropDownValue;

onSelected(dynamic value) { for (var element in viewFriendsModelObj.value.dropdownItemList.value) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}} viewFriendsModelObj.value.dropdownItemList.refresh(); } 
 }
