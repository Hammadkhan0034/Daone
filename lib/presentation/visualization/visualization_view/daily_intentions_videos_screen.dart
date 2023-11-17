


import 'package:cached_network_image/cached_network_image.dart';
import 'package:daone/presentation/visualization/visualization_view/videoplay/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../widgets/app_bar/appbar_iconbutton.dart';

class DailyIntentionsVideoScreen extends StatelessWidget {
  const DailyIntentionsVideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Videos',style: GoogleFonts.glassAntiqua(
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
        body: VideoPlayerScreen(videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
        // body:Container(
        //   color: Colors.deepOrange,
        //   height: Get.height*0.85,
        //   child: ListView.builder(
        //       itemCount: 12,
        //       itemBuilder: (context,index){
        //         return Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10 ),
        //           child: Row(
        //             children: [
        //               Container(
        //                 //  color: Colors.purple,
        //                 height: Get.height*0.1,
        //                 child: ClipRRect(
        //                   borderRadius: BorderRadius.circular(13),
        //                   child: CachedNetworkImage(
        //                     height: Get.height*0.13,
        //                     width: Get.width*0.4,
        //                     imageUrl: 'https://images.unsplash.com/photo-1560785218-893cc779709b?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzZ8fGFmZmlybWF0aW9ucyUyMHZpZGVvc3xlbnwwfHwwfHx8MA%3D%3D',
        //                     fit: BoxFit.cover,
        //                   ),
        //                 ),
        //               ),
        //               Column(
        //                 children: [
        //                   Container(
        //                     // color: Colors.orange,
        //                     height: Get.height*0.1,
        //                     width: MediaQuery.of(context).size.width*0.48,
        //                     child: Padding(
        //                       padding: const EdgeInsets.only( left: 13),
        //                       child: Column(
        //                         children: [
        //                           Text(
        //                             'How to make Affirmation Videos',
        //                             maxLines: 3,
        //                             softWrap: true,
        //                             overflow: TextOverflow.ellipsis,
        //                             style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14),
        //                           ),
        //                           Row(
        //                             children: [
        //                               Text(
        //                                 '12',
        //                                 maxLines: 3,
        //                                 softWrap: true,
        //                                 overflow: TextOverflow.ellipsis,
        //                                 style: TextStyle(fontWeight: FontWeight.w400,fontSize: 11),
        //                               ),
        //                               SizedBox(width: Get.width*0.02,height: Get.height*0.02,),
        //                               Text(
        //                                 'Views',
        //                                 maxLines: 3,
        //                                 softWrap: true,
        //                                 overflow: TextOverflow.ellipsis,
        //                                 style: TextStyle(fontWeight: FontWeight.w400,fontSize: 11),
        //                               ),
        //                               SizedBox(width: Get.width*0.02,height: Get.height*0.02,),
        //                               Text(
        //                                 '12-3-2023',
        //                                 maxLines: 3,
        //                                 softWrap: true,
        //                                 overflow: TextOverflow.ellipsis,
        //                                 style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),
        //                               ),
        //
        //                             ],
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   ),
        //
        //                 ],
        //               ),
        //             ],
        //           ),
        //         );
        //
        //       }),
        // ),
      ),
    );
  }
}
