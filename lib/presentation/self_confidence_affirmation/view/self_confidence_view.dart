import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/self_confidence_affirmation/controller/self_confidence_controller.dart';
import 'package:daone/presentation/self_confidence_affirmation/view/self_confidence_getdialogue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../widgets/app_bar/appbar_iconbutton.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/text_widget.dart';

class SelfConfidenceAffirmationView extends StatelessWidget {
  const SelfConfidenceAffirmationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        height: getVerticalSize(79),
        leadingWidth: 72,
        leading: AppbarIconbutton(
          onTap: () {
            Get.back();
          },
          svgPath: ImageConstant.imgInfo,
          margin: getMargin(left: 24, top: 4, bottom: 4),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          height: Get.height * 0.82,
          width: double.infinity,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('selfConfidenceAffirmations')
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Loading indicator while data is being fetched
                return Center(
                  child: Container(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(
                        color: Colors.deepOrangeAccent,
                      )),
                );
              }
              if (snapshot.hasError) {
                // Handle errors here
                return Text('Error: ${snapshot.error}');
              }
              if (snapshot.data == null) {
                // Handle the case where data is null
                return Text('No data available');
              }



              // Check if there are no tasks
              if (snapshot.data.docs.isEmpty) {
                return Container(
                  height: Get.height * 0.3,
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      SizedBox(height: Get.height * 0.08),
                      Center(
                        child: Image.asset(
                          ImageConstant.vector21,
                          scale: 4,
                        ),
                      ),
                      SizedBox(height: Get.height * 0.04),
                      TextWidget(
                        text: "You don't have any affirmation",
                        color: Colors.black38,
                        fsize: 14,
                        font: FontWeight.w500,
                      ),
                    ],
                  ),
                );
              }


              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Set the number of columns here
                  crossAxisSpacing: 8.0, // Adjust spacing as needed
                  mainAxisSpacing: 8.0, // Adjust spacing as needed
                ),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  final selfAffirmationData = snapshot.data.docs[index].data();
                  final selfaffirmationText = selfAffirmationData['confidenceAffirmation'];
                  final documentId = snapshot.data.docs[index].id;
                  final imageUrl = selfAffirmationData['imageUrl'];
                  final affirmationCount = selfAffirmationData['affirmationCount'];


                  return InkWell(
                    onTap: (){
                      Get.dialog(
                        AlertDialog(backgroundColor: Colors.transparent,
                          contentPadding: EdgeInsets.zero,
                          insetPadding: const EdgeInsets.only(left: 0),
                          content: SelfConfidenceAffirmationBlastEffectDialog(Get.put(SelfConfidenceController()),
                              currentAffirmationCount: affirmationCount,
                              documentId: documentId,
                              decorationImage: DecorationImage(
                                  image: selfAffirmationData['imageUrl'] == null
                                      ? NetworkImage(
                                      "https://images.unsplash.com/photo-1483197452165-7abc4b248905?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60")
                                      : NetworkImage(selfAffirmationData!['imageUrl']),fit: BoxFit.cover
                              ),selfConfidenceaffirmationText: selfAffirmationData!['confidenceAffirmation']),),
                      );
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  height: Get.height*0.12,
                                  child: Text(
                                    selfaffirmationText ?? '',
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(fontSize: 12,
                                      color:Color(0xff5E4646),fontWeight:FontWeight.w500,),
                                  ),
                                ),
                              ),
                              Container(
                                height: Get.height*0.03,
                                width: Get.width*0.1,
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: TextWidget(text:affirmationCount.toString(),color: Colors.white,fsize: 10),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
