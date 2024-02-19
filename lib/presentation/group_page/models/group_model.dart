  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/presentation/register_page_one_screen/models/user_model.dart';

class GroupModel {
    final String name,description,image;
    Timestamp createdAt;
    UserModel? createdBy;
    final List<UserModel> users;


    String get groupId=>createdAt.millisecondsSinceEpoch.toString();
    GroupModel({
    required this.name,
    required this.description,
    required this.image,
    required this.createdAt,
        required this.createdBy,
    required this.users,
  });

    Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'description': this.description,
      'image': this.image,
      'createdAt': this.createdAt,
      'createdBy': this.createdBy,
      'users': this.users.map((e) => e.toMap()).toList(growable: false),
    };
  }

    factory GroupModel.fromMap(Map<String, dynamic> map) {
      final List<UserModel> usersList = [];
      if (map['users'] != null && map['users'] is List) {
        List<dynamic> usersData = map['users'] as List<dynamic>;
        usersList.addAll(usersData.map((userData) => UserModel.fromMap(userData)));
      }

      return GroupModel(
        name: map['name'] as String? ?? '', // Handle null value by providing a default empty string
        description: map['description'] as String? ?? '', // Handle null value by providing a default empty string
        image: map['image'] as String? ?? '', // Handle null value by providing a default empty string
        createdAt: map['createdAt'] ?? Timestamp.now() , // Assuming 'createdAt' is always present and non-null
        createdBy: map['createdBy']  , // Assuming 'createdBy' is always present and non-null
        users: usersList,
      );
    }

}
