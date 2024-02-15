import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../core/app_export.dart';
import '../../widgets/text_widget.dart';
import '../visualization/visualization_view/videoplay/video_player_screen.dart';
import 'models/daily_intension_record_model.dart';

class DailyIntentionListWidget extends StatelessWidget {
  const DailyIntentionListWidget({super.key,required this.dailyIntentionList});
final List<DailyIntentionModel> dailyIntentionList;
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
    return Expanded(
      child: ListView.builder(
        itemCount: dailyIntentionList.length,
        itemBuilder: (context, index) {
          DailyIntentionModel dailyIntentionModel = dailyIntentionList[index];

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
                            child: Text(dailyIntentionModel.title==null? 'No Title':dailyIntentionModel.title,
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

  }
}
