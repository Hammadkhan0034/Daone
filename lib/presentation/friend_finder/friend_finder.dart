import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/presentation/add_friends_screen/controller/add_friends_controller.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:share_plus/share_plus.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../view_friend_full_profile_page/controller/view_friend_full_profile_controller.dart';
import '../view_friend_full_profile_page/view_friend_full_profile_page.dart';
import 'friend_finder_controller.dart';

class FriendFinderPage extends StatefulWidget {
  @override
  _FriendFinderPageState createState() => _FriendFinderPageState();
}

class _FriendFinderPageState extends State<FriendFinderPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Contact> _contacts = [];
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  var searchQuery;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _getContacts();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _getContacts() async {
    var status = await Permission.contacts.request();
    if (status.isGranted) {
      List<Contact> contacts = (await ContactsService.getContacts()).toList();
      setState(() {
        _contacts = contacts;
      });
    } else {
      print('Permission to access contacts is denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Friends Finder',
          style: TextStyle(
            fontFamily: 'Gotham Light',
            fontWeight: FontWeight.w800,
            fontSize: 23,
            color: Colors.black,
          ),
        ),
        leadingWidth: 68,
        leading: AppbarIconbutton(
          onTap: () {
            Get.back();
          },
          svgPath: ImageConstant.imgInfo,
          margin: getMargin(
            left: 10,
            top: 10,
            bottom: 10,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Contact'),
            Tab(text: 'Email'),
            Tab(text: 'Username'),
          ],
        ),
      ),
      body: GetBuilder<FriendFinderController>(builder: (ctrl) {
        return TabBarView(
          controller: _tabController,
          children: [
            // First Tab Content (Contact)
            _contacts.isNotEmpty
                ? ListView.builder(
                    itemCount: _contacts.length,
                    itemBuilder: (context, index) {
                      Contact contact = _contacts[index];
                      return InkWell(
                        onTap: () async {
                          var phoneNumber = contact.phones!.isNotEmpty
                              ? contact.phones!.first.value
                              : '';
                          var userData = await ctrl
                              .checkIfPhoneNumberExistsInFirebase(phoneNumber);
                          if (userData.isNotEmpty) {
                            print(userData.toString());
                            var name = userData['fullName'];
                            var email = userData['email'];
                            var imageUrl = userData['imageUrl'];
                            Get.find<ViewFriendFullProfileController>()
                                .addFriendList(context, name, email, imageUrl,
                                    phoneNumber);
                            // Now you can use the name and email as needed
                          } else {
                            String inviteMessage =
                                "Hey! Check out this awesome app. Download it now!";

                            // Share the invitation message
                            Share.share(inviteMessage);

                            // Handle case when phone number doesn't exist in Firebase
                          }
                        },
                        child: ListTile(
                          title: Text(contact.displayName ?? ''),
                          subtitle: Text(
                              '${contact.phones!.isNotEmpty ? contact.phones!.first.value : ''}'),
                        ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
            // Second Tab Content (Email)

            Column(
              children: [
                SizedBox(height: 20),
                Row(

                  children: [
                    SizedBox(width: 15,),

                    Icon(Icons.person),
                    SizedBox(width: 15,),
                    SizedBox(
                      width: Get.width*0.5,
                      child: TextFormField(
                        onChanged: (value) {
                          ctrl.setSearchQuery(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter Email',
                        ),
                        controller: emailcontroller,
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  if (ctrl.userList.isEmpty && ctrl.searchQuery.isNotEmpty) {
                    return Text('No email exists.');
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: ctrl.userList.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot doc = ctrl.userList[index];

                          return ListTile(
                            title: Text(doc['fullName']),
                            subtitle: Text(doc['email']),
                            onTap: () {
                              Get.dialog(
                                AlertDialog(
                                    backgroundColor: Colors.white,
                                    contentPadding: EdgeInsets.all(10),
                                    insetPadding:
                                        const EdgeInsets.only(left: 0),
                                    content: SizedBox(
                                      height: Get.height * 0.40,
                                      width: Get.width * 0.8,
                                      child: AlertDialog(
                                        title: Text('Add Friend'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text(
                                                  'Do you want to add this user as a friend?'),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Get.back(closeOverlays: true);
                                            },
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              await Get.put(
                                                      ViewFriendFullProfileController())
                                                  .addFriendList(
                                                      context,
                                                      doc['fullName'],
                                                      doc['email'],
                                                      doc['imageUrl'],
                                                      doc['phoneNumber']);
                                            },
                                            child: Text('Add'),
                                          ),
                                        ],
                                      ),
                                    )),
                              );
                            },
                          );
                        },
                      ),
                    );
                  }
                }),
              ],
            ),

            // Third Tab Content (Username)
            Column(
              children: [
                SizedBox(height: 20),
                Row(

                  children: [
                    SizedBox(width: 15,),

                    Icon(Icons.person),
                    SizedBox(width: 15,),
                    SizedBox(
                     width: Get.width*0.5,
                      child: TextFormField(
                        onChanged: (value) {
                          ctrl.setSearchQuery(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter User Name',
                        ),
                        controller: usernamecontroller,
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  if (ctrl.userList.isEmpty && ctrl.searchQuery.isNotEmpty) {
                    return Text('No User exists.');
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: ctrl.userList.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot doc = ctrl.userList[index];

                          return ListTile(
                            title: Text(doc['fullName']),
                            onTap: () {
                              Get.dialog(
                                AlertDialog(
                                    backgroundColor: Colors.white,
                                    contentPadding: EdgeInsets.all(10),
                                    insetPadding:
                                        const EdgeInsets.only(left: 0),
                                    content: SizedBox(
                                      height: Get.height * 0.40,
                                      width: Get.width * 0.8,
                                      child: AlertDialog(
                                        title: Text('Add Friend'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text(
                                                  'Do you want to add this user as a friend?'),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Get.back(closeOverlays: true);
                                            },
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              await Get.put(
                                                      ViewFriendFullProfileController())
                                                  .addFriendList(
                                                      context,
                                                      doc['fullName'],
                                                      doc['email'],
                                                      doc['imageUrl'],
                                                      doc['phoneNumber']);
                                            },
                                            child: Text('Add'),
                                          ),
                                        ],
                                      ),
                                    )),
                              );
                            },
                          );
                        },
                      ),
                    );
                  }
                }),
              ],
            ),
          ],
        );
      }),
    );
  }
}
