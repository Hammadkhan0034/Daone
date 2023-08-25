import 'controller/recording_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class RecordingScreen extends GetWidget<RecordingController> {
  const RecordingScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        //extendBody: true,
        //extendBodyBehindAppBar: true,
        backgroundColor: appTheme.whiteA700,
        body: InkWell(
          onTap: (){
            Get.toNamed(AppRoutes.remindersScreen);
          },
          child: Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height,
            decoration: BoxDecoration(
              color: appTheme.whiteA700,
              image: DecorationImage(
                image: AssetImage(
                  ImageConstant.imgRecording
                ),
                fit: BoxFit.cover,
              ),
            ),
            // child: Container(
            //   width: double.maxFinite,
            //   padding: getPadding(
            //     left: 7,
            //     top: 88,
            //     right: 7,
            //   ),
            //   child: CustomImageView(
            //     imagePath: ImageConstant.imgRectangle5942,
            //     height: getVerticalSize(
            //       546,
            //     ),
            //     width: getHorizontalSize(
            //       358,
            //     ),
            //     alignment: Alignment.center,
            //     margin: getMargin(
            //       bottom: 5,
            //     ),
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
