import '../../alarm_noti/noti_screen.dart';
import '../../widgets/text_widget.dart';
import 'controller/select_task_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SelectTaskScreen extends GetWidget<SelectTaskController> {
  const SelectTaskScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 27,
            ),
            child: Padding(
              padding: getPadding(
                left: 29,
                right: 29,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CustomIconButton(
                      //   onTap: (){
                      //     Get.toNamed(AppRoutes.dashboardRoute);
                      //   },
                      //   height: 48,
                      //   width: 48,
                      //   margin: getMargin(
                      //     bottom: 82,
                      //   ),
                      //   padding: getPadding(
                      //     all: 12,
                      //   ),
                      //   child: CustomImageView(
                      //     svgPath: ImageConstant.imgInfo,
                      //   ),
                      // ),
                      Spacer(
                        flex: 46,
                      ),
                      SizedBox(
                        height: getVerticalSize(
                          130,
                        ),
                        width: getHorizontalSize(
                          108,
                        ),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "lbl_stefani".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles
                                    .titleMediumHindSiliguriIndigo9000118,
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgUntit11,
                              height: getSize(
                                108,
                              ),
                              width: getSize(
                                108,
                              ),
                              alignment: Alignment.topCenter,
                            ),
                          ],
                        ),
                      ),
                      Spacer(
                        flex: 53,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      Get.toNamed(AppRoutes.addTaskScreen);
                    },
                    child: Container(
                      margin: getMargin(
                        top: 43,
                      ),
                      padding: getPadding(
                        left: 109,
                        top: 19,
                        right: 109,
                        bottom: 19,
                      ),
                      decoration: AppDecoration.fill3.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder14,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgPlus,
                            height: getSize(
                              22,
                            ),
                            width: getSize(
                              22,
                            ),
                            margin: getMargin(
                              top: 3,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 6,
                            ),
                            child: Text(
                              "lbl_add_new_task".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.titleSmallPoppinsWhiteA700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:20.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.addTaskScreen);
                          },
                          child: Container(
                            height: Get.height*0.18,
                            width: Get.width*0.35,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                                color: Color(0x3f858fe9)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: Get.width*0.15,
                                    height: Get.height*0.067,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Color(0xff858fe9),
                                    image: DecorationImage(image: AssetImage(ImageConstant.workout,),scale: 2),
                                    ),
                                ),
                                SizedBox( height: Get.height*0.01,),
                                TextWidget(text: "Workout", color: Color(0xff10275A), fsize: 12,font: FontWeight.w600),
                              ],
                            ),
                          ),
                        ),
                        SizedBox( width: Get.width*0.13,),
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.addTaskScreen);
                          },
                          child: Container(
                            height: Get.height*0.18,
                            width: Get.width*0.35,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0x3f7fc9e7),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: Get.width*0.15,
                                    height: Get.height*0.067,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Color(0xff7FC9E7),
                                    image: DecorationImage(image: AssetImage(ImageConstant.job,),scale: 4),
                                    ),
                                ),
                                SizedBox( height: Get.height*0.01,),
                                TextWidget(text: "Job", color: Color(0xff10275A), fsize: 12,font: FontWeight.w600),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:20.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Get.offAndToNamed(AppRoutes.sleepTrackingRoute);
                          },
                          child: Container(
                            height: Get.height*0.18,
                            width: Get.width*0.35,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                                color: Color(0x3fffe4e4)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: Get.width*0.15,
                                    height: Get.height*0.067,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Color(0xffe77d7d),
                                    image: DecorationImage(image: AssetImage(ImageConstant.moon,),scale: 4),
                                    ),
                                ),
                                SizedBox( height: Get.height*0.01,),
                                TextWidget(text: "Sleep Tracker", color: Color(0xff10275A), fsize: 12,font: FontWeight.w600),
                              ],
                            ),
                          ),
                        ),
                        SizedBox( width: Get.width*0.13,),
                        InkWell(
                          onTap: (){
                            // Get.to(()=> AlarmView());
                            Get.to(()=>NotiScreen());
                          },
                          child: Container(
                            height: Get.height*0.18,
                            width: Get.width*0.35,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                                color: Color(0x3f858fe9)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: Get.width*0.15,
                                    height: Get.height*0.067,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                      color: Color(0xff858fe9),
                                    image: DecorationImage(image: AssetImage(ImageConstant.calender),scale: 4),
                                    ),
                                ),
                                SizedBox( height: Get.height*0.01,),
                                TextWidget(text: "Alarm", color: Color(0xff10275A), fsize: 12,font: FontWeight.w600),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
