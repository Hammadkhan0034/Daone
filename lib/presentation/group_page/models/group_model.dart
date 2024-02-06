  import 'package:cloud_firestore/cloud_firestore.dart';

class GroupModel {
    final String name;
    final List<String> users;

    GroupModel(this.name, this.users);
    Map<String, dynamic> toMap() {
      return {
        'name': name,
        'users': users,
      };
    }
    //Fetching Groups


  }
