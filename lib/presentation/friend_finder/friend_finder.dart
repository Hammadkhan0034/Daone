import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/common_widgets/user_list_tile.dart';
import 'package:daone/presentation/add_friends_screen/controller/add_friends_controller.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:share_plus/share_plus.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/custom_elevated_button.dart';
import '../register_page_one_screen/models/user_model.dart';
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
    ViewFriendFullProfileController viewFriendFullProfileController =Get.put(ViewFriendFullProfileController());
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
                ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {

                      setState(() {
                        searchQuery = value.toLowerCase();
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Search Contact',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _contacts.length,
                    itemBuilder: (context, index) {
                      Contact contact = _contacts[index];
                      if (contact != null && contact.displayName != null && (searchQuery == null || contact.displayName!.toLowerCase().contains(searchQuery!))) {
                        return InkWell(
                          onTap: () async {
                            var phoneNumber = contact.phones!.isNotEmpty ? contact.phones!.first.value : '';
                            var userData = await ctrl.checkIfPhoneNumberExistsInFirebase(phoneNumber);
                            if (userData.isNotEmpty) {
                              print(userData.toString());
                              var name = userData['fullName'];
                              var email = userData['email'];
                              var imageUrl = userData['imageUrl'];
                               Get.bottomSheet(
                                 enableDrag: true,
                                            isDismissible: true,
                                            backgroundColor:
                                            Colors.white,
                                            Container(
                                              height: Get.height*0.2,
                                              width: Get.width,

                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  CustomElevatedButton(
                                                    onTap: (){
                                                      Get.showOverlay(
                                                          asyncFunction:
                                                              () async {
                                                            viewFriendFullProfileController.addFriendList(context, name, email, imageUrl, phoneNumber);

                                                          },
                                                          loadingWidget:
                                                          Center(
                                                            child:
                                                            SizedBox(
                                                              width: 60,
                                                              height: 60,
                                                              child:
                                                              CircularProgressIndicator(
                                                                color: Colors
                                                                    .deepOrange,
                                                              ),
                                                            ),
                                                          ));
                                                    },
                                                    width: getHorizontalSize(
                                                      307,
                                                    ),
                                                    height: getVerticalSize(
                                                      60,
                                                    ),
                                                    text: "lbl_add_friends".tr,
                                                    margin: getMargin(
                                                      left: 5,
                                                      top: 34,
                                                      right: 5,
                                                    ),
                                                    buttonStyle:
                                                    CustomButtonStyles.outlineIndigoA1004c.copyWith(
                                                        fixedSize: MaterialStateProperty.all<Size>(Size(
                                                          double.maxFinite,
                                                          getVerticalSize(
                                                            60,
                                                          ),
                                                        ))),
                                                    decoration:
                                                    CustomButtonStyles.outlineIndigoA1004cDecoration,
                                                    buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                            } else {
                              String inviteMessage = "Hey! Check out this awesome app. Download it now!";
                              Share.share(inviteMessage);
                            }
                          },
                          child: ListTile(
                            title: Text(contact.displayName ?? ''),
                            subtitle: Text('${contact.phones!.isNotEmpty ? contact.phones!.first.value : ''}'),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),

                ),
              ],
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
                          ctrl.searchUsersByEmail(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter Email',
                        ),
                        controller: emailcontroller,
                      ),
                    ),
                  ],
                ),
                  if (ctrl.userList.isEmpty && ctrl.searchQuery.value.isNotEmpty)
                     Text('No email exists.')
                   else Expanded(
                      child: ListView.builder(
                        itemCount: ctrl.userList.length,
                        itemBuilder: (context, index) {
                          UserModel userModel = ctrl.userList[index];

                          return UserListTileWidget(userModel: userModel);
                        },
                      ),
                    )

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
                          ctrl.searchUsersByUserName(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter User Name',
                        ),
                        controller: usernamecontroller,
                      ),
                    ),
                  ],
                ),
                if (ctrl.userListByName.isEmpty && ctrl.searchQuery.value.isNotEmpty)
                  Text('No user exists.')
                else Expanded(
                  child: ListView.builder(
                    itemCount: ctrl.userListByName.length,
                    itemBuilder: (context, index) {
                      UserModel userModel = ctrl.userListByName[index];

                      return UserListTileWidget(userModel: userModel);
                    },
                  ),
                )
              ],
            ),
          ],
        );
      }),
    );
  }
}
