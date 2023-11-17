import 'package:cached_network_image/cached_network_image.dart';
import 'package:daone/presentation/visualization/visualization_view/daily_intentions_videos_screen.dart';
import 'package:daone/presentation/visualization/visualization_view/daone_videos_screen.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../widgets/app_bar/appbar_iconbutton.dart';

class VisualizationView extends StatelessWidget {
  const VisualizationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Container(
           // color: Colors.deepOrange,
            height: Get.height*0.46,
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10 ),
                child: Row(
                  children: [
                    Container(
                    //  color: Colors.purple,
                      height: Get.height*0.1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: CachedNetworkImage(
                          height: Get.height*0.13,
                          width: Get.width*0.4,
                          imageUrl: 'https://images.unsplash.com/photo-1560785218-893cc779709b?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzZ8fGFmZmlybWF0aW9ucyUyMHZpZGVvc3xlbnwwfHwwfHx8MA%3D%3D',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                        // color: Colors.orange,
                          height: Get.height*0.1,
                          width: MediaQuery.of(context).size.width*0.48,
                          child: Padding(
                            padding: const EdgeInsets.only( left: 13),
                            child: Column(
                              children: [
                                Text(
                                  'How to make Affirmation Videos',
                                  maxLines: 3,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '12',
                                      maxLines: 3,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 11),
                                    ),
                                    SizedBox(width: Get.width*0.02,height: Get.height*0.02,),
                                    Text(
                                      'Views',
                                      maxLines: 3,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 11),
                                    ),
                                    SizedBox(width: Get.width*0.02,height: Get.height*0.02,),
                                    Text(
                                      '12-3-2023',
                                      maxLines: 3,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              );

            }),
          )




        ],
      ),
    ));
  }
}
