

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
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

            return Column(
              children: [
                SizedBox(height: Get.height*0.03),
                Container(
                  height: Get.height * 0.84,
                  child: ListView.builder(
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      DailyIntentionModel dailyIntentionModel=snapshot.data![index];

                      return FutureBuilder<String?>(
                        future: generateThumbnail(dailyIntentionModel.videoUrl),
                        builder: (context, thumbnailSnapshot) {
                          if (thumbnailSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              height: Get.height * 0.25,
                              width: Get.width * 0.8,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.deepOrange,
                                ),
                              ),
                            );
                          }

                          var thumbnailPath = thumbnailSnapshot.data;

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: Get.width*0.9,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                                  child: Text(dailyIntentionModel.title,style: TextStyle(
                                      fontFamily: 'Gotham Light',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15,color: Colors.black
                                  )),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Get.to(()=> VideoPlayerScreen(dailyIntentionModel: dailyIntentionModel));
                                },
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0, vertical: 10),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: Get.height * 0.25,
                                          width: Get.width * 0.8,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(13),
                                            child: thumbnailPath != null
                                                ? Image.file(
                                              File(thumbnailPath),
                                              fit: BoxFit.contain,
                                            )
                                                : Image.asset(
                                              "assets/images/novideo.png",
                                              scale: 2,
                                            ),
                                          ),
                                        ),
                                        Positioned.fill(child: Center(
                                          child: Icon(
                                            Icons.play_circle,
                                            color: Colors.grey,
                                            size: 100,
                                          ),
                                        ),),
                                      ],
                                    )
                                ),
                              ),
                              Divider(),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
