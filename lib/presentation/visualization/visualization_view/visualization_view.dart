import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/presentation/visualization/visualization_view/daily_intentions_videos_screen.dart';
import 'package:daone/presentation/visualization/visualization_view/daone_videos_screen.dart';
import 'package:daone/presentation/visualization/visualization_view/videoplay/video_player_screen.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../widgets/app_bar/appbar_iconbutton.dart';

class VisualizationView extends StatelessWidget {
  const VisualizationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Visualization',style: GoogleFonts.glassAntiqua(
              fontSize: 35,color: Colors.black
            )),
    leadingWidth: 68,
    leading: AppbarIconbutton(
    onTap: (){
    Get.back();
    },

    svgPath: ImageConstant.imgInfo,
    margin: getMargin(
    left: 30,
    top: 10,
    bottom: 5,
    ),),
          ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: (){
                  Get.to(()=>DailyIntentionsVideoScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: Get.height*0.3,
                      width: Get.width*0.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(image:AssetImage('assets/images/videos.jpg'),fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13.0),
                          child: Text('Daily Intention Videos',style: GoogleFonts.glassAntiqua(
                              fontSize: 27,color: Colors.white,fontWeight: FontWeight.w600
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.to(()=>DaoneVideosScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(13),
                    child: Container(
                      height: Get.height*0.3,
                      width: Get.width*0.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(image:AssetImage('assets/images/videos2.jpg'),fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13.0),
                          child: Text('Daone Affirmation Videos',style: GoogleFonts.glassAntiqua(
                              fontSize:27,color: Colors.white,fontWeight: FontWeight.w600
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
            child: Text('Recent Videos',style: GoogleFonts.glassAntiqua(
                fontSize: 27,color: Colors.deepOrange,fontWeight: FontWeight.w700
            )),
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('daoneVideos')
                .snapshots(),
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
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
                      SizedBox(height: Get.height * 0.03),
                      Image.asset(
                        "assets/images/novideo.png",
                        scale: 3,
                      ),
                      Text(
                        'No videos Found',
                        style: GoogleFonts.glassAntiqua(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              }

              int itemCount = snapshot.data!.docs.length;

              return Container(
                height: Get.height * 0.46,
                child: ListView.builder(
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    var vidData = snapshot.data.docs[index].data();
                    var videoUrl = vidData['videoLink'];
                    var videoTitle = vidData['title'];
                    var videoDate = vidData['date'];

                    return FutureBuilder<String?>(
                      future: generateThumbnail(videoUrl),
                      builder: (context, thumbnailSnapshot) {
                        if (thumbnailSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            height: Get.height * 0.12,
                            width: Get.width * 0.8,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.deepOrange,
                              ),
                            ),
                          );
                        }

                        var thumbnailPath = thumbnailSnapshot.data;

                        return InkWell(
                          onTap: () {
                            Get.to(()=> VideoPlayerScreen(videoUrl: videoUrl));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18.0,
                              vertical: 10,
                            ),
                            child: Row(
                              children: [
                                Stack(
                                  children:[ Container(
                                    height: Get.height * 0.1,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(13),
                                      child: thumbnailPath != null
                                          ? Image.file(
                                        File(thumbnailPath),
                                        fit: BoxFit.cover,
                                      )
                                          : CachedNetworkImage(
                                        height: Get.height * 0.13,
                                        width: Get.width * 0.4,
                                        imageUrl:
                                        'https://images.unsplash.com/photo-1560785218-893cc779709b?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzZ8fGFmZmlybWF0aW9ucyUyMHZpZGVvc3xlbnwwfHwwfHx8MA%3D%3D',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                    Positioned.fill(child: Center(
                                      child: Icon(
                                        Icons.play_circle,
                                        color: Colors.grey,
                                        size: 40,
                                      ),
                                    ),),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: Get.height * 0.1,
                                      width:
                                      MediaQuery.of(context).size.width *
                                          0.48,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 13),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              videoTitle,
                                              maxLines: 3,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              videoDate,
                                              maxLines: 3,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
