import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/utils/size_utils.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/text_widget.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: getVerticalSize(
            79,
          ),
          leadingWidth: 72,
          leading: AppbarIconbutton(
            onTap: (){
              Get.back();
            },
            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              left: 24,
              top: 4,
              bottom: 4,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     TextWidget(text:'Daone Mobile Application', color:Colors.black, fsize: 24,font: FontWeight.w600),
                //   ],
                // ),
               // SizedBox(height: 16.0),
                TextWidget(text:'Privacy Policy',
                    fontFamily: 'Gotham Light',
                    font: FontWeight.w800,
                    color:Colors.deepOrange, fsize: 18),
                SizedBox(height: 16.0),
                TextWidget(
                    text:'This is the privacy policy for our Daone app. It explains how we collect, use, and protect your personal information.',
                    fontFamily: 'Gotham Light',
                    font: FontWeight.w800,
                    color:Colors.black, fsize: 12),
                SizedBox(height: 16.0),
                TextWidget(text:  'Data Collection',  fontFamily: 'Gotham Light',
                    font: FontWeight.w800,color:Colors.deepOrange, fsize: 18),
                SizedBox(height: 8.0),
                TextWidget(
                    text:'We may collect certain types of information when you use our app, such as your name, email address, and device information.',
                    fontFamily: 'Gotham Light',
                    font: FontWeight.w800, color:Colors.black, fsize: 12),
                SizedBox(height: 16.0),
                TextWidget(text:  'Data Usage', fontFamily: 'Gotham Light',
                    font: FontWeight.w800, color:Colors.deepOrange, fsize: 18),

                SizedBox(height: 8.0),
                TextWidget(
                   text: 'We use the collected data for various purposes, including providing and improving our app, personalizing user experiences, and analyzing app usage patterns.',
                    color:Colors.black, fontFamily: 'Gotham Light',
                    font: FontWeight.w800, fsize: 12),
                SizedBox(height: 16.0),
                TextWidget(text:  'Data Sharing', color:Colors.deepOrange, fontFamily: 'Gotham Light',
                    font: FontWeight.w800, fsize: 18),

                SizedBox(height: 8.0),
                TextWidget(
                   text: 'We may share your information with third parties only in cases where it is necessary for providing our services or as required by law.',
                    color:Colors.black,  fontFamily: 'Gotham Light',
                    font: FontWeight.w800,fsize: 12),
                SizedBox(height: 16.0),
                TextWidget(text:  'Security', fontFamily: 'Gotham Light',
                    font: FontWeight.w800, color:Colors.deepOrange, fsize: 18),
                SizedBox(height: 8.0),
                TextWidget(
                    text: 'We take appropriate measures to protect your personal information and maintain the security of our app. However, please note that no method of transmission or storage is completely secure.',
                    color:Colors.black, fontFamily: 'Gotham Light',
                    font: FontWeight.w800, fsize: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}