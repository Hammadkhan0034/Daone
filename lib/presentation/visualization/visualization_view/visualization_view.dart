import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/presentation/visualization/visualization_view/daone_videos_screen.dart';
import 'package:daone/presentation/visualization/visualization_view/fav_videos.dart';
import 'package:daone/presentation/visualization/visualization_view/videoplay/video_player_screen.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../widgets/app_bar/appbar_iconbutton.dart';
import '../../daily_intension_record_screen/models/daily_intension_record_model.dart';

class VisualizationView extends StatelessWidget {
  const VisualizationView({Key? key}) : super(key: key);

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
        title: Text('Visualization',
            style: TextStyle(
                fontFamily: 'Gotham Light',
                fontWeight: FontWeight.w800,
                fontSize: 25,
                color: Colors.black)),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // InkWell(
              //   onTap: () {
              //     Get.to(() => DailyIntentionsVideoScreen());
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.all(18.0),
              //     child: Material(
              //       elevation: 2,
              //       borderRadius: BorderRadius.circular(15),
              //       child: Container(
              //         height: Get.height * 0.3,
              //         width: Get.width * 0.4,
              //         decoration: BoxDecoration(
              //           image: DecorationImage(
              //               image: AssetImage('assets/images/videos.jpg'),
              //               fit: BoxFit.cover),
              //           borderRadius: BorderRadius.circular(15),
              //         ),
              //         child: Center(
              //           child: Padding(
              //             padding: const EdgeInsets.symmetric(horizontal: 13.0),
              //             child: Text('Daily Intention Videos',
              //                 style: GoogleFonts.glassAntiqua(
              //                     fontSize: 27,
              //                     color: Colors.white,
              //                     fontWeight: FontWeight.w600)),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              InkWell(
                onTap: () {
                  Get.to(() => DaoneVideosScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(13),
                    child: Container(
                      height: Get.height * 0.3,
                      width: Get.width * 0.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/videos2.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13.0),
                          child: Text('Daone Affirmation Videos',
                              style: TextStyle(
                                fontFamily: 'Gotham Light',
                                fontWeight: FontWeight.w800,
                                fontSize: Get.width * 0.056,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text('Recent Videos',
                style: TextStyle(
                  fontFamily: 'Gotham Light',
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                  color: Colors.deepOrange,
                )),
          ),
          StreamBuilder<List<DailyIntentionModel>>(
            stream: FirebaseFirestore.instance
                .collection('daoneVideos')
                .snapshots()
                .map((event) {
              List<DailyIntentionModel> list = [];
              for (var data in event.docs) {
                list.add(DailyIntentionModel.fromMap(data.data()));
              }
              return list;
            }),
            builder:
                (context, AsyncSnapshot<List<DailyIntentionModel>> snapshot) {
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
                      SizedBox(height: Get.height * 0.03),
                      Image.asset(
                        "assets/images/novideo.png",
                        scale: 3,
                      ),
                      Text(
                        'No videos Found',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Gotham Light',
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              }

              int itemCount = snapshot.data!.length;

              return Expanded(
                child: ListView.builder(
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    DailyIntentionModel dailyIntentionModel =
                        snapshot.data![index];

                    // Convert the Timestamp to a DateTime
                    DateTime dateTime = dailyIntentionModel.date.toDate();

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
                      future: generateThumbnail(dailyIntentionModel.videoUrl),
                      builder: (context, thumbnailSnapshot) {
                        if (thumbnailSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            height: 200,
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  stops: [0, 0.8],
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft,
                                  colors: [
                                    Colors.deepOrangeAccent,
                                    Colors.orange ?? Colors.orangeAccent
                                  ]),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(() => VideoPlayerScreen(
                                      dailyIntentionModel:
                                          dailyIntentionModel));
                                },
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0, vertical: 10),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(13),
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
                                        Positioned.fill(
                                          child: Center(
                                            child: Icon(
                                              Icons.play_circle,
                                              color: Colors.grey,
                                              size: 70,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: Get.width * 0.53,
                                    child: TextWidget(
                                      color: Colors.white,
                                      text: formattedDate == null
                                          ? 'null'
                                          : formattedDate,
                                      fsize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                      width: Get.width * 0.53,
                                      child: Text(
                                        dailyIntentionModel.title == null
                                            ? 'No Title'
                                            : dailyIntentionModel.title,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      )),
                                  SizedBox(height: 5),
                                  Container(
                                      width: Get.width * 0.50,
                                      child: Text(
                                        dailyIntentionModel.tags,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      )),
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
        ],
      ),
    ));
  }
}
