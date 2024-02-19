  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/presentation/register_page_one_screen/models/user_model.dart';

class GroupModel {
    final String name,description,image;
    Timestamp createdAt;
    UserModel createdBy;
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
        List<dynamic> list=map['users'] as List<dynamic>;
    return GroupModel(
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      createdAt: map['createdAt'] as Timestamp,
      createdBy: map['createdBy'] as UserModel,
      users:list.map((e) => UserModel.fromMap(e)).toList(),
    );
  }
}
