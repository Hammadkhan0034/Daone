import 'dart:io';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/daily_intension_record_screen/controller/daily_intension_record_controller.dart';
import 'package:daone/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../widgets/app_bar/appbar_iconbutton.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/text_widget.dart';

class UploadVideo extends StatefulWidget {
  final File videoFile;

  UploadVideo({required this.videoFile, required String videoPath});

  @override
  _UploadVideoState createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  late VideoPlayerController _controller;
  DailyIntensionRecordController controller = Get.put(DailyIntensionRecordController());
  bool isUploading = false; // To control the circular progress bar

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.videoFile)
      ..initialize().then((_) {
        // Ensure the first frame is shown
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
     GlobalKey<FormState> _key =GlobalKey<FormState>();
    return Scaffold(
      appBar: CustomAppBar(
        height: getVerticalSize(79),
        leadingWidth: 72,
        leading: AppbarIconbutton(
          onTap: () {
            Get.back();
          },
          svgPath: ImageConstant.imgInfo,
          margin: getMargin(left: 24, top: 4, bottom: 4),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _controller.value.isInitialized
                  ? Center(
                child: Container(
                  height: Get.height * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                ),
              )
                  : Container(),
              SizedBox(height: Get.height * 0.03,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text("Video Title",style: TextStyle(fontFamily: "Gotham Light",fontWeight: FontWeight.w800,fontSize: 20)),
                  ),
                  Spacer(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 0),
                child: CustomTextFormField(
                  function: (value) {
                    controller.titleController.text = value;
                  },
                  controller: controller.titleController,
                  margin: getMargin(
                    top: 10,
                  ),
                  contentPadding: getPadding(
                    top: 15,
                    right: 30,
                    bottom: 15,
                  ),
                  textStyle: CustomTextStyles.bodySmallGray50005,
                  hintText: "Title".tr,
                  hintStyle: CustomTextStyles.bodySmallGray50005,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                  prefix: Container(
                    margin: getMargin(
                      left: 15,
                      top: 15,
                      right: 10,
                      bottom: 15,
                    ),
                    child:Icon(Icons.abc),
                  ),
                  prefixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      48,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ) {
                      return "Please enter title";
                    }
                    return null;
                  },
                  filled: true,
                  fillColor: appTheme.gray50,
                ),
              ),
              SizedBox(height: Get.height * 0.03,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text("#Tags",style: TextStyle(fontFamily: "Gotham Light",fontWeight: FontWeight.w800,fontSize: 20)),
                  ),
                  Spacer(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 0),
                child: CustomTextFormField(
                  function: (value) {
                   controller.tagsController.text = value;
                  },
                  controller: controller.tagsController,
                  margin: getMargin(
                    top: 10,
                  ),
                  contentPadding: getPadding(
                    top: 15,
                    right: 30,
                    bottom: 15,
                  ),
                  textStyle: CustomTextStyles.bodySmallGray50005,
                  hintText: "Related Tags (optional)".tr,
                  hintStyle: CustomTextStyles.bodySmallGray50005,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                  prefix: Container(
                    margin: getMargin(
                      left: 15,
                      top: 15,
                      right: 10,
                      bottom: 15,
                    ),
                    child:Icon(Icons.abc),
                  ),
                  prefixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      48,
                    ),
                  ),
                  // validator: (value) {
                  //   if (value == null ||
                  //       (!isValidEmail(value, isRequired: true))) {
                  //     return "Please enter valid email";
                  //   }
                  //   return null;
                  // },
                  filled: true,
                  fillColor: appTheme.gray50,
                ),
              ),
              SizedBox(height: Get.height*0.05),

              // Show circular progress bar if isUploading is true

              if (isUploading)
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextWidget(text: 'Video uploading...', color: Colors.black, fsize: 14),
                      ),
                      CircularProgressIndicator(color: Colors.deepOrange),
                    ],
                  ),
                ),
              // Show buttons to upload and end intention
              if (!isUploading)
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        if(_key.currentState!.validate()){

                        // Set isUploading to true before starting the upload
                        setState(() {
                          isUploading = true;
                        });

                        controller.uploadVideoToFirebaseStorage(widget.videoFile, context).then((result) {
                          // Set isUploading to false after the upload is complete
                          setState(() {
                            isUploading = false;
                          });
                        });}

                        },
                      child: Container(
                        width: Get.width * 0.9,
                        height: Get.height * 0.075,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xff04585a),
                        ),
                        child: Center(
                          child: TextWidget(
                            color: Colors.white,
                            fsize: 20,
                            fontWeight: FontWeight.w300,
                            text: "Upload video",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02,),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: Get.width * 0.9,
                        height: Get.height * 0.075,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.deepOrange,
                        ),
                        child: Center(
                          child: TextWidget(
                            color: Colors.white,
                            fsize: 20,
                            fontWeight: FontWeight.w300,
                            text: "End Intention",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          if (_controller.value.isPlaying) {
            _controller.pause();
          } else {
            _controller.play();
          }
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}


// import 'dart:io';
// import 'package:daone/core/app_export.dart';
// import 'package:daone/presentation/daily_intension_record_screen/controller/daily_intension_record_controller.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:video_player/video_player.dart';
//
// import '../../../core/utils/image_constant.dart';
// import '../../../core/utils/size_utils.dart';
// import '../../../widgets/app_bar/appbar_iconbutton.dart';
// import '../../../widgets/app_bar/custom_app_bar.dart';
// import '../../../widgets/text_widget.dart';
//
// class UploadVideo extends StatefulWidget {
//   final File videoFile;
//
//   UploadVideo({required this.videoFile, required String videoPath});
//
//   @override
//   _UploadVideoState createState() => _UploadVideoState();
// }
//
// class _UploadVideoState extends State<UploadVideo> {
//   late VideoPlayerController _controller;
//   DailyIntensionRecordController controller =Get.put(DailyIntensionRecordController());
//
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.file(widget.videoFile)
//       ..initialize().then((_) {
//         // Ensure the first frame is shown
//         print('initialize');
//         setState(() {});
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         height: getVerticalSize(79),
//         leadingWidth: 72,
//         leading: AppbarIconbutton(
//           onTap: () {
//             Get.back();
//           },
//           svgPath: ImageConstant.imgInfo,
//           margin: getMargin(left: 24, top: 4, bottom: 4),
//         ),
//       ),
//       body: Column(
//         children: [
//           _controller.value.isInitialized
//               ? Center(
//                 child: Container(
//             height: Get.height*0.5,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(13),
//                   //    color: Colors.deepOrange
//                   ),
//                   child: AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           ),
//                 ),
//               ) : Container(),
//           SizedBox(height: Get.height*0.05,),
//           InkWell(
//             onTap: (){
//              controller.uploadVideoToFirebaseStorage(widget.videoFile,context);
//
//
//             },
//             child: Container(
//               width: Get.width*0.9,
//               height: Get.height*0.075,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   color: Color(0xff04585a)),
//               child: Center(
//                 child: TextWidget(color: Colors.white, fsize: 20,font: FontWeight.w300,
//                   text: "Upload",),
//               ),
//             ),
//           ),
//           SizedBox(height: Get.height*0.02,),
//           InkWell(
//               onTap: (){
//                 Get.back();
//               },
//             child: Container(
//               width: Get.width*0.9,
//               height: Get.height*0.075,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   color: Colors.deepOrange),
//               child: Center(
//                 child: TextWidget(color: Colors.white, fsize: 20,font: FontWeight.w300,
//                   text: "End Intension",),
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.deepOrange,
//         onPressed: () {
//           if (_controller.value.isPlaying) {
//             _controller.pause();
//           } else {
//             _controller.play();
//           }
//         },
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }
//
//