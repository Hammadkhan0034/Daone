import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/presentation/visualization/visualization_controller/visualization_controller.dart';
import 'package:daone/presentation/visualization/visualization_view/videoplay/video_player_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../widgets/app_bar/appbar_iconbutton.dart';

class FavVideos extends StatelessWidget {
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
          title: Text(
            'Favorite Videos',
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
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser?.email)
              .collection('favVideos')
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
                      style: GoogleFonts.glassAntiqua(
                        fontSize: 30,
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
                  var videoTitle = vidData['date'];
                  var documentId = snapshot.data.docs[index].id;
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

                      return GestureDetector(
                        onTap: (){
                          Get.to(()=> VideoPlayerScreen(videoUrl: videoUrl));
                        },
                        onLongPress: (){
                          showDeleteConfirmationDialog(context, videoUrl,documentId);
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
  void showDeleteConfirmationDialog(BuildContext context, String videoUrl,documentId) {
    VisualizationController controller =Get.put(VisualizationController());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Video?'),
          content: Text('Are you sure you want to delete this video?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel',
                  style: TextStyle(color: Colors.deepOrange)
              ),
            ),
            TextButton(
              onPressed: () {

                controller.deleteFromFav(context,documentId:documentId);
                Navigator.pop(context);
              },
              child: Text('Delete',
                  style: TextStyle(color: Colors.deepOrange)
              ),
            ),
          ],
        );
      },
    );
  }
}
