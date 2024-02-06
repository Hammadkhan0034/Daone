import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/presentation/visualization/visualization_view/videoplay/video_player_screen.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../widgets/app_bar/appbar_iconbutton.dart';
import 'fav_videos.dart';

class DailyIntentionsVideoScreen extends StatelessWidget {
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
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser?.email)
              .collection('VideosUrl')
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
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
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            }

            int itemCount = snapshot.data!.docs.length;

            return Container(
              height: Get.height * 0.85,
              child: ListView.builder(
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  var vidData = snapshot.data.docs[index].data();
                  var videoUrl = vidData['videoUrl'];
                  var videoTitle = vidData['title'];
                  var videoDate = vidData['date'];
                  var videoTag =  vidData['tags'];
                  // Convert the Timestamp to a DateTime
                  DateTime dateTime = videoDate.toDate();

// Calculate the difference between the current date and the video date
                  Duration difference = DateTime.now().difference(dateTime);

// Determine the time elapsed in days
                  int days = difference.inDays;

// Format the result based on the time elapsed
                  String formattedDate = '';

                  if (days == 0) {
                    formattedDate = 'Today';
                  } else if (days == 1) {
                    formattedDate = '1 day ago';
                  } else if (days < 7) {
                    formattedDate = '$days days ago';
                  } else {
                    // Format the date using intl package for more advanced formatting
                    formattedDate = DateFormat.yMMMd().format(dateTime);
                  }

                  return FutureBuilder<String?>(
                    future: generateThumbnail(videoUrl),
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

                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                        decoration: BoxDecoration(
                         // color: Colors.pinkAccent,
                          border: Border.all(color: Colors.grey)
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: (){
                              Get.to(()=> VideoPlayerScreen(videoUrl: videoUrl));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0, vertical: 10),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      height: Get.height * 0.18,
                                      width: Get.width * 0.3,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(13),
                                        child: thumbnailPath != null
                                            ? Image.file(
                                          File(thumbnailPath),
                                          fit: BoxFit.cover,
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
                                  size: 70,
                                ),
                                                      ),),
                                  ],
                                )
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: Get.height*0.02,),
                                Container(
                                  //color: Colors.deepOrange,
                                  height: Get.height*0.036,
                                  width: Get.width*0.54,
                                  child: TextWidget(text:formattedDate==null? 'null': formattedDate,fontFamily: 'Gotham Light',fsize: 12),
                                ),
                                Container(
                                  //color: Colors.pinkAccent,
                                  height: Get.height*0.09,
                                  width: Get.width*0.54,
                                  child: Text(videoTitle==null? 'null':videoTitle,
                                    overflow: TextOverflow.visible,
                                    style: TextStyle(
                                      fontSize: 14,
                                    fontFamily: 'Gotham Light',fontWeight: FontWeight.w800
                                  ),)
                                ),
                                Container(
                                 // color: Colors.green,
                                  height: Get.height*0.04,
                                  width: Get.width*0.54,
                                  child: Text(videoTag,style: TextStyle(
                                    fontFamily: 'Gotham Light',fontWeight: FontWeight.w800,fontSize: 12
                                  ),)
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
