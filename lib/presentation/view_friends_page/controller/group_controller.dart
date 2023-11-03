import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/group_model.dart';

class GroupController extends GetxController {
  RxList<GroupModel> groups = <GroupModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadGroups();
  }

  Future<List<GroupModel>?> fetchGroupsFromFirebase() async {
    CollectionReference groups = FirebaseFirestore.instance.collection('groups');
    QuerySnapshot querySnapshot = await groups.get();

    if (querySnapshot.docs.isNotEmpty) {
      List<GroupModel> groupsList = [];

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        String groupName = data['name'];
        List<String> users = List<String>.from(data['users']);
        GroupModel group = GroupModel(groupName, users);
        groupsList.add(group);
      });

      return groupsList;
    } else {
      return null;
    }
  }

  Future<void> loadGroups() async {
    List<GroupModel>? fetchedGroups = await fetchGroupsFromFirebase();
    if (fetchedGroups != null) {
      groups.assignAll(fetchedGroups);
    }
  }


}
