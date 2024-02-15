


import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../widgets/app_bar/appbar_iconbutton.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Column(
        children: [
          Container(
      height: Get.height*0.3,

              child: Image.asset('assets/images/5143151.jpg')),
          SizedBox(height: Get.height*0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                Icon(Icons.email_outlined,color: Colors.blueAccent,),
                SizedBox(width: Get.width*0.05),
                TextWidget(text: "Daoneofficials@gmail.com",
                    fontFamily: 'Gotham Light',fontWeight: FontWeight.w800,
                    color:Colors.black, fsize: 18),
              ],
            ),
          ),
          SizedBox(height: Get.height*0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                Icon(Icons.phone,color: Colors.blueAccent,),
                SizedBox(width: Get.width*0.05),
                TextWidget(text: "00986556898",
                    fontFamily: 'Gotham Light',fontWeight: FontWeight.w800,
                    color:Colors.black, fsize: 18),
              ],
            ),
          ),
          SizedBox(height: Get.height*0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                Icon(Icons.telegram_outlined,color: Colors.blueAccent,),
                SizedBox(width: Get.width*0.05),
                TextWidget(text: "Daone Telegram",
                    fontFamily: 'Gotham Light',fontWeight: FontWeight.w800,
                    color:Colors.black, fsize: 18),
              ],
            ),
          ),
          SizedBox(height: Get.height*0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined,color: Colors.blueAccent,),
                SizedBox(width: Get.width*0.05),
                TextWidget(text: "United States Of America", color:Colors.black, fsize: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
