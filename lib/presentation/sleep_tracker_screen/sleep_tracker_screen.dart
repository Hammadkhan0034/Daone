import 'package:daone/widgets/text_widget.dart';

import '../sleep_tracking_section/controller/sleep_tracking_controller.dart';
import 'controller/sleep_tracker_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_switch.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SleepTrackerScreen extends GetWidget<SleepTrackerController> {
  const SleepTrackerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    SleepTrackingController controller =Get.put(SleepTrackingController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
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
          // title: Text(
          //   "lbl_sleep_tracker".tr,
          //   overflow: TextOverflow.ellipsis,
          //   textAlign: TextAlign.left,
          //   style: CustomTextStyles.titleMediumBold,
          // ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/2 (1).png",scale: 1,),
              SizedBox(height: Get.height*0.06,),
              InkWell(
                onTap: (){

                  controller.saveSleepDatabase();
                },
                child: Container(
                  height: Get.height*0.07,
                  width: Get.width*0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.deepOrange),
                  child: Center(child: TextWidget(text: "Start",color: Colors.white,fsize: 15)),

                ),
              ),
            ],
          ),

        ),

      ),
    );
  }
}
