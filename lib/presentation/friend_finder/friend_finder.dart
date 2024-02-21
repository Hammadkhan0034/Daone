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
  TextEditingController usernamecontroller=TextEditingController();

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Icon(
                    Icons.person,
                    size: 24,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: Get.width * 0.5,
                  child: TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      labelText: 'Enter Email',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20),
                  child: ElevatedButton(
                      onPressed: () async {
                        print("Email clicekd");
                        await ctrl.findUser(emailcontroller.text);

                      },
                      child: Text("Find user")),
                )
              ],
            ),
            // Third Tab Content (Username)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Icon(
                    Icons.person,
                    size: 24,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: Get.width * 0.5,
                  child: TextFormField(
                    controller: usernamecontroller,
                    decoration: InputDecoration(
                      labelText: 'Enter UserName',
                    ),
                  ),
                ),
                ElevatedButton(onPressed: () {

                  print("cLICKED");
                  ctrl.findUser(usernamecontroller.text);

                }, child: Text("Find User"))
              ],
            ),
          ],
        );
      }),
    );
  }
}
