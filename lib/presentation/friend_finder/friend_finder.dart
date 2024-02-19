import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';

class FriendFinderPage extends StatefulWidget {
  @override
  _FriendFinderPageState createState() => _FriendFinderPageState();
}

class _FriendFinderPageState extends State<FriendFinderPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Contact> _contacts = [];

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
      body: TabBarView(
        controller: _tabController,
        children: [
          // First Tab Content (Contact)
          _contacts.isNotEmpty
              ? ListView.builder(
                  itemCount: _contacts.length,
                  itemBuilder: (context, index) {
                    Contact contact = _contacts[index];
                    return ListTile(
                      title: Text(contact.displayName ?? ''),
                      subtitle: Text(
                          '${contact.phones!.isNotEmpty ? contact.phones!.first.value : ''}'),
                    );
                  },
                )
              : Center(
                  child:
                      CircularProgressIndicator(),
                ),
          // Second Tab Content (Email)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [

              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Icon(Icons.person,size: 24,),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: Get.width*0.5,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter Email',
                  ),
                ),
              ),
            ],
          ),
          // Third Tab Content (Username)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [

              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Icon(Icons.person,size: 24,),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: Get.width*0.5,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter UserName',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
