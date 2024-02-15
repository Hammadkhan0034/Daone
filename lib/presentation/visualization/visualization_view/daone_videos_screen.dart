

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/daily_intension_record_screen/dailt_intention_list_widget.dart';
import 'package:daone/presentation/visualization/visualization_view/videoplay/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../widgets/app_bar/appbar_iconbutton.dart';
import '../../daily_intension_record_screen/models/daily_intension_record_model.dart';
import 'fav_videos.dart';

class DaoneVideosScreen extends StatelessWidget {
  const DaoneVideosScreen({Key? key}) : super(key: key);
  Future<String?> generateThumbnail(String videoUrl) async {
    Directory tempDir = await getTemporaryDirectory();

    return await VideoThumbnail.thumbnailFile(
      video: videoUrl,
      thumbnailPath: tempDir.path,
      imageFormat: ImageFormat.PNG,
      maxHeight: 200,
      quality: 100,
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Videos',
              style:
              TextStyle(
                  fontFamily: 'Gotham Light',
                  fontWeight: FontWeight.w800,
                  fontSize: 25, color: Colors.black)),
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
              onTap: () {
                Get.to(() => FavVideos());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Icon(Icons.favorite, color: Colors.deepOrange, size: 30),
              ),
            ),
          ],
        ),
        body: StreamBuilder<List<DailyIntentionModel>>(
          stream: FirebaseFirestore.instance
              .collection('daoneVideos')
              .snapshots().map((event) {
            List<DailyIntentionModel> list=[];
            for( var data in event.docs){
              list.add(DailyIntentionModel.fromMap(data.data()));
            }
            return list;
          }),
          builder: (BuildContext context, AsyncSnapshot<List<DailyIntentionModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.deepOrange,
                ),
              );
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/novideo.png",
                      scale: 2,
                    ),
                    Text(
                      'No videos Found',
                      style: TextStyle(
                        fontFamily: 'Gotham Light',
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            }

            int itemCount = snapshot.data!.length;

            return DailyIntentionListWidget(dailyIntentionList: snapshot.data!);
          },
        ),
      ),
    );
  }
}
