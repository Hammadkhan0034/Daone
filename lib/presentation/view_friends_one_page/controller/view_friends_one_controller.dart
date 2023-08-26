import 'package:daone/core/app_export.dart';import 'package:daone/presentation/view_friends_one_page/models/view_friends_one_model.dart';/// A controller class for the ViewFriendsOnePage.
///
/// This class manages the state of the ViewFriendsOnePage, including the
/// current viewFriendsOneModelObj
class ViewFriendsOneController extends GetxController {ViewFriendsOneController(this.viewFriendsOneModelObj);

Rx<ViewFriendsOneModel> viewFriendsOneModelObj;

SelectionPopupModel? selectedDropDownValue;

onSelected(dynamic value) { for (var element in viewFriendsOneModelObj.value.dropdownItemList.value) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}} viewFriendsOneModelObj.value.dropdownItemList.refresh(); } 
 }
