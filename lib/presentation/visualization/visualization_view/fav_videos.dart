import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/presentation/visualization/visualization_controller/visualization_controller.dart';
import 'package:daone/presentation/visualization/visualization_view/videoplay/video_player_screen.dart';
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
import '../../../widgets/text_widget.dart';
import '../../daily_intension_record_screen/models/daily_intension_record_model.dart';

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
          title: Text('Favourite Videos',
              style:
              TextStyle(
                  fontFamily: 'Gotham Light',
                  fontWeight: FontWeight.w800,
                  fontSize: 23, color: Colors.black)),
          leadingWidth: 68,
          leading: AppbarIconbutton(
            onTap: () {
              Get.back();
            },
            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              left: 10,
              top: 10,
              bottom: 8,
            ),
          ),
        ),

        body: StreamBuilder< List<DailyIntentionModel> >(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser?.email)
              .collection('favVideos')
              .snapshots().map((event) {
            List<DailyIntentionModel> list=[];
            for( var data in event.docs){
              list.add(DailyIntentionModel.fromMap(data.data()));
            }
            return list;
          }),
          builder: (BuildContext context, AsyncSnapshot< List<DailyIntentionModel> > snapshot) {
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
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            }

            int itemCount = snapshot.data!.length;

            return Container(
              child: ListView.builder(
                itemCount: itemCount,
                itemBuilder: (context, index) {
                 DailyIntentionModel dailyIntentionModel=snapshot.data![index];
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
                        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        decoration: BoxDecoration(
                            gradient:LinearGradient(stops: [0,0.8], begin: Alignment.bottomRight, end: Alignment.topLeft, colors: [Colors.deepOrangeAccent,Colors.orange??Colors.orangeAccent]) ,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                                        height: 100,
                                        width:100,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: Get.width*0.54,
                                  child: TextWidget(
                                    color: Colors.white,
                                    text:formattedDate==null? 'null': formattedDate,fsize: 14,fontWeight: FontWeight.w600,),
                                ),
                                SizedBox(height: 5),

                                Container(
                                    width: Get.width*0.54,
                                    child: Text(dailyIntentionModel.title==null? '"No Title"':dailyIntentionModel.title,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700
                                      ),)
                                ),
                                SizedBox(height: 5),

                                Container(
                                    width: Get.width*0.54,
                                    child: Text(dailyIntentionModel.tags,style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,fontSize: 14
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
          },        ),
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
