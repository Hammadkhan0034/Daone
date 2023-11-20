import 'package:chewie/chewie.dart';
import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../../../widgets/app_bar/appbar_iconbutton.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  VideoPlayerScreen({required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        // Fetch video metadata asynchronously and set aspect ratio
       double aspectRatio = _videoPlayerController.value.aspectRatio;
        _chewieController = ChewieController(
          customControls: CupertinoControls(backgroundColor: Colors.grey, iconColor: Colors.white,),
          autoPlay: false,

          materialProgressColors: ChewieProgressColors(
            playedColor: Colors.deepOrange,
            handleColor: Colors.deepOrange,
            backgroundColor: Colors.grey,
            bufferedColor: Colors.grey,
          ),
          cupertinoProgressColors: ChewieProgressColors(
            playedColor: Colors.deepOrange,
            handleColor: Colors.deepOrange,
            backgroundColor: Colors.grey,
            bufferedColor: Colors.grey,
          ),
          //showOptions: true,
          videoPlayerController: _videoPlayerController,
          aspectRatio: aspectRatio,
          autoInitialize: true,
          looping: true,
          errorBuilder: (context, errorMessage) {
            return Center(
              child: Text(errorMessage),
            );
          },
        );
        if (mounted) {
          setState(() {});
        }
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_videoPlayerController.value.isInitialized) {
      // Show loading indicator or placeholder until ChewieController is fully initialized
      return SafeArea(
        child: Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ),
          ),
        ),
      );
    }


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Videos',
            style: GoogleFonts.glassAntiqua(fontSize: 35, color: Colors.black),
          ),
          leadingWidth: 68,
          leading: AppbarIconbutton(
            onTap: () {
              Get.back();
            },
            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              left: 30,
              top: 10,
              bottom: 5,
            ),
          ),
        ),
        body: Center(
          child: Container(
            height: Get.height*0.8,
            child: Chewie(
              controller: _chewieController,
            ),
          ),
        ),
      ),
    );
  }
}
