import 'package:chewie/chewie.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/visualization/visualization_controller/visualization_controller.dart';
import 'package:daone/presentation/visualization/visualization_view/daily_intentions_videos_screen.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

import '../../../../widgets/app_bar/appbar_iconbutton.dart';
import '../../../daily_intension_record_screen/models/daily_intension_record_model.dart';
import '../fav_videos.dart';

class VideoPlayerScreen extends StatefulWidget {
  final DailyIntentionModel dailyIntentionModel;

  VideoPlayerScreen({required this.dailyIntentionModel});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  VisualizationController vController = Get.put(VisualizationController());

  @override
  void initState() {
    super.initState();
    // FlutterDownloader.initialize(
    //   debug: true, // Set to false for production
    // );
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.dailyIntentionModel.videoUrl))
      ..initialize().then((_) {
        // Fetch video metadata asynchronously and set aspect ratio
       double aspectRatio = _videoPlayerController.value.aspectRatio;
        _chewieController = ChewieController(
          customControls: CupertinoControls(
            showPlayButton: true,
            backgroundColor: Colors.grey,
            iconColor: Colors.white,),
          autoPlay: true,
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
          showOptions: true,
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
              left: 10,
              top: 10,
              bottom: 5,
            ),
          ),
          actions: [
            InkWell(
              onTap: (){
                Get.to(()=>FavVideos());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Icon(Icons.favorite,color: Colors.deepOrange,size: 30),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.height*0.32,
                child: Chewie(
                  controller: _chewieController,
                ),
              ),
              SizedBox(height: Get.height*0.01),
              TextWidget(text: "More Options"),
              SizedBox(height: Get.height*0.03),
              InkWell(
                onTap: (){
                  //   _downloadFile(widget.videoUrl);
                  vController.addToFav(context: context, dailyIntentionModel: widget.dailyIntentionModel);

                },
                child: Container(
                  height: Get.height*0.08,
                  width: Get.width*0.9,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Icon(Icons.favorite,color: Colors.white),
                        Spacer(),
                        TextWidget(text: 'Add to Favorite',color: Colors.white,fsize: 20,)
                        ,Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height*0.03),
              InkWell(
                onTap: (){
                  Share.share('www.daoneapk.com');
                },
                child: Container(
                  height: Get.height*0.08,
                   width: Get.width*0.9,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Icon(Icons.share_outlined,color: Colors.white),
                        Spacer(),
                        TextWidget(text: 'Share',color: Colors.white,fsize: 20,)
                      ,Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height*0.03),
              InkWell(
                onTap: (){
               //   _downloadFile(widget.videoUrl);
                  Get.to(()=>DailyIntentionsVideoScreen());
                },
                child: Container(
                  height: Get.height*0.08,
                   width: Get.width*0.9,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Icon(Icons.video_camera_back_outlined,color: Colors.white),
                        Spacer(),
                        TextWidget(text: 'Daily Intension Videos',color: Colors.white,fsize: 20,)
                      ,Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height*0.03),
              InkWell(
                onTap: (){
               //   _downloadFile(widget.videoUrl);
                  Get.to(()=>DailyIntentionsVideoScreen());
                },
                child: Container(
                  height: Get.height*0.08,
                   width: Get.width*0.9,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Icon(Icons.video_camera_back_outlined,color: Colors.white),
                        Spacer(),
                        TextWidget(text: 'Daone  Videos',color: Colors.white,fsize: 20,)
                      ,Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _downloadFile(String videoUrl) async {
    final taskId = await FlutterDownloader.enqueue(
      url: videoUrl,
      savedDir: '/path/to/download', // Replace with your desired download directory
      showNotification: true,
      openFileFromNotification: true,
    );

    // Handle the download task ID as needed
    print('Download task ID: $taskId');
  }

}
