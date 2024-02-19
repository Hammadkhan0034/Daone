import 'package:daone/core/utils/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/size_utils.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';

class SendInviteScreen extends StatefulWidget {
  @override
  _SendInviteScreenState createState() => _SendInviteScreenState();
}

class _SendInviteScreenState extends State<SendInviteScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Send Invite Request',
            style:
            TextStyle(
                fontFamily: 'Gotham Light',
                fontWeight: FontWeight.w800,
                fontSize: 23, color: Colors.black)),
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

      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Get.height*0.02),
            Container(
              margin: EdgeInsets.only(left: 30),
                height: Get.height*0.35,

                child: Image.asset('assets/images/referfriend.png')),
            SizedBox(height: Get.height*0.02),
            Text('Invite your friends',
                textAlign: TextAlign.center,
                style:
                TextStyle(
                    fontFamily: 'Gotham Light',
                    fontWeight: FontWeight.w800,
                    fontSize: 23, color: Colors.black)),
            SizedBox(height: 32.0),
ElevatedButton(
  style: ElevatedButton.styleFrom(

    backgroundColor: Colors.deepOrange
  ),

  onPressed: (){}, child: Text('Send Invite',
    textAlign: TextAlign.center,
    style:
    TextStyle(
        fontFamily: 'Gotham Light',
        fontWeight: FontWeight.w800,
        fontSize: 15, color: Colors.white)),)
          ],
        ),
      ),
    );
  }
}