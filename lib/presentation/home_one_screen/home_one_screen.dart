import 'package:daone/widgets/text_widget.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'controller/home_one_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

// ignore_for_file: must_be_immutable
class HomeOneScreen extends GetWidget<HomeOneController> {
  const HomeOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: appTheme.whiteA700,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Image.asset(ImageConstant.imgUntit11,scale: 2.8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      TextWidget(text:"lbl_welcome_back2".tr, color: Colors.black38, fsize: 12),
                      TextWidget(text:"lbl_stefani".tr, color: Colors.black, fsize: 20,font: FontWeight.bold),
                    ],),
                    SizedBox(width: Get.width*0.36,),
                    Image.asset(ImageConstant.notificationIcon,scale: 3.3),

                  ],
                ),
              ),
              SizedBox(
                height: getVerticalSize(
                  124,
                ),
                width: getHorizontalSize(
                  317,
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgBa,
                      height: getVerticalSize(
                        124,
                      ),
                      width: getHorizontalSize(
                        317,
                      ),
                      radius: BorderRadius.circular(
                        getHorizontalSize(
                          22,
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: getVerticalSize(
                          90,
                        ),
                        width: getHorizontalSize(
                          273,
                        ),
                        margin: getMargin(
                          bottom: 11,
                        ),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: getHorizontalSize(
                                  205,
                                ),
                                child: Text(
                                  "msg_transform_your_mind".tr,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles
                                      .titleSmallPoppinsWhiteA70015,
                                ),
                              ),
                            ),
                            CustomElevatedButton(
                              text: "lbl_read_more".tr,
                              buttonStyle: CustomButtonStyles
                                  .fillDeeporangeA20006
                                  .copyWith(
                                      fixedSize:
                                          MaterialStateProperty.all<Size>(
                                              Size(
                                getHorizontalSize(
                                  77,
                                ),
                                getVerticalSize(
                                  36,
                                ),
                              ))),
                              buttonTextStyle:
                                  CustomTextStyles.labelSmallWhiteA700,
                              alignment: Alignment.bottomRight,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomImageView(
                svgPath: ImageConstant.imgGroup10071,
                height: getVerticalSize(
                  5,
                ),
                width: getHorizontalSize(
                  57,
                ),
                margin: getMargin(
                  top: 7,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 19.0,right: 19,bottom: 7,top: 18),
                child: Row(
                  children: [
                    Container(
                      height: Get.height*0.26,
                      width: Get.width*0.43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft, end: Alignment.topRight,
                          colors: [Color(0xfffd785a), Color(0xfff46735)], ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment(0, -1),
                          child:  Image.asset(ImageConstant.vector9,scale: 4),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                          child:  Image.asset(ImageConstant.vector9,scale: 4),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SizedBox(height: Get.height*0.02,),
                                CircularPercentIndicator(
                                  radius: 53.0,
                                  lineWidth: 15.0,
                                  percent: 0.6,
                                  center: TextWidget(text: "60%",color: Colors.white,fsize: 20),
                                  progressColor: Colors.green,
                                  backgroundColor: Colors.white,
                                  circularStrokeCap: CircularStrokeCap.round,
                                ),
                                SizedBox(height: Get.height*0.005,),
                                TextWidget(text: "Completed",color: Colors.white,fsize: 20),
                                SizedBox(height: Get.height*0.001,),
                                TextWidget(text: "80 Task",color: Colors.white,fsize: 12),
                              ],
                            ),
                          ),
                        ],
                      ),

                    ),
                    SizedBox( width: Get.width*0.03,),
                    Container(
                      height: Get.height*0.26,
                      width: Get.width*0.43,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(image: AssetImage(ImageConstant.containerBackgroundImg),fit: BoxFit.cover),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextWidget(text: "I deserve to experience joy and abundance in all aspects of my life.",
                              color: Color(0xff5E4646), fsize: 14),
                          ),
                          SizedBox( height: Get.height*0.02,),
                          Image.asset(ImageConstant.blackMoreButtonImg,scale: 3,),
                        ],
                      ),
                    )
                  ],

                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 0),
                child: Row(
                  children: [
                    Container(
                      height: Get.height*0.26,
                      width: Get.width*0.43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(image: AssetImage(ImageConstant.virtualizationImg),fit: BoxFit.cover),
                      ),

                    ),
                    SizedBox( width: Get.width*0.03,),
                    Container(
                      height: Get.height*0.26,
                      width: Get.width*0.43,
                      decoration: BoxDecoration(
                        color: Color(0xff048C44),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment(0, -1),
                            child:  Image.asset(ImageConstant.vector10,scale: 1),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:  Image.asset(ImageConstant.vector10,scale: 1),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SizedBox(height: Get.height*0.02,),
                                Image.asset(ImageConstant.ladyImg,scale: 4),
                                SizedBox(height: Get.height*0.01,),
                                TextWidget(text: "Daily Intention",color: Colors.white,fsize: 16),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],

                ),
              ),
              SizedBox(height: Get.height*0.15,),
            ],
          ),
        ),
      ),
    );
  }
}
