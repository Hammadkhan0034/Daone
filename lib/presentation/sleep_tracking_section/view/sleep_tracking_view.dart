

import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../widgets/app_bar/appbar_iconbutton.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/text_widget.dart';
import '../get_dialogue_of_sleep.dart';
import '../sleep_widget.dart';

class SleepTrackingView extends StatelessWidget {
  const SleepTrackingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: getVerticalSize(
          69,
        ),
        leadingWidth: 78,
        leading: AppbarIconbutton(
          onTap: (){
            Get.back();
          },

          svgPath: ImageConstant.imgInfo,
          margin: getMargin(
            left: 30,
            top: 10,
            bottom: 5,
          ),
        ),
        centerTitle: true,
        title:TextWidget(text:"lbl_sleep_tracker".tr, color:Colors.black, fsize: 18,font:FontWeight.bold),
      ),
      floatingActionButton: InkWell(
          onTap: (){
            Get.dialog(
              AlertDialog(
                backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
                insetPadding: const EdgeInsets.only(left: 0),
                content:SleepDialogue(),
              ),
            );
          },
          child: sleepFloatingButton()),

    );
  }
}
