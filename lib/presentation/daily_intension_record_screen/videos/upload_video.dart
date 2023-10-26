import 'dart:io';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/daily_intension_record_screen/controller/daily_intension_record_controller.dart';
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
      body: Column(
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
          SizedBox(height: Get.height * 0.05,),
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
                    // Set isUploading to true before starting the upload
                    setState(() {
                      isUploading = true;
                    });

                    controller.uploadVideoToFirebaseStorage(widget.videoFile, context).then((result) {
                      // Set isUploading to false after the upload is complete
                      setState(() {
                        isUploading = false;
                      });
                    });
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
                        font: FontWeight.w300,
                        text: "Upload",
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
                        font: FontWeight.w300,
                        text: "End Intension",
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
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
