import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../models/group_model.dart';
import '../models/view_friends_model.dart';/// A controller class for the ViewFriendsPage.
///
/// This class manages the state of the ViewFriendsPage, including the
/// current viewFriendsModelObj
class ViewFriendsController extends GetxController {ViewFriendsController(this.viewFriendsModelObj);

Rx<ViewFriendsModel> viewFriendsModelObj;

RefreshController refreshController=RefreshController();
SelectionPopupModel? selectedDropDownValue;
RxList<GroupModel> groups = <GroupModel>[].obs;
onSelected(dynamic value) { for (var element in viewFriendsModelObj.value.dropdownItemList.value) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}} viewFriendsModelObj.value.dropdownItemList.refresh(); }

@override
void onInit() {
 super.onInit();
 loadGroups();
}
Future<List<GroupModel>> fetchGroupsFromFirebase() async {
 CollectionReference groups = FirebaseFirestore.instance.collection('groups');
 QuerySnapshot querySnapshot = await groups.get();

 if (querySnapshot.docs.isNotEmpty) {
  List<GroupModel> groupsList = [];

  querySnapshot.docs.forEach((doc) {
   Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
   
   GroupModel group = GroupModel.fromMap(data);
   groupsList.add(group);
  });
  print(groupsList);
  return groupsList;

 } else {
  return [];
 }
}

Future<void> loadGroups() async {
 List<GroupModel>? fetchedGroups = await fetchGroupsFromFirebase();
groups.assignAll(fetchedGroups);
 }


}
