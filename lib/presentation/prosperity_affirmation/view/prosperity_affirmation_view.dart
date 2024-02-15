

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/prosperity_affirmation/controller/prosperity_affirmation_controller.dart';
import 'package:daone/presentation/prosperity_affirmation/view/prosperity_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/app_bar/appbar_iconbutton.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/text_widget.dart';

class ProsperityAffirmationView extends StatefulWidget {
  const ProsperityAffirmationView({Key? key}) : super(key: key);

  @override
  State<ProsperityAffirmationView> createState() => _ProsperityAffirmationViewState();
}

class _ProsperityAffirmationViewState extends State<ProsperityAffirmationView> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final GlobalKey key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000), // Adjust the duration as needed
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Prosperity',
            style: TextStyle(
                fontSize: 25,fontWeight: FontWeight.w800,fontFamily: 'Gotham Light'
            ),
          ),
          leadingWidth: 68,
          leading: AppbarIconbutton(
            onTap: () {
              Get.back();
            },
            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              top: 10,
            ),
          ),
        ),
      
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.02),
              Container(
                height: Get.height * 0.82,
                width: double.infinity,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('prosperityAffirmations')
                      .snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Loading indicator while data is being fetched
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepOrangeAccent,
                        ),
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
                              fontWeight: FontWeight.w500,
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
                        final prosperityAffirmationData = snapshot.data.docs[index].data();
                        final prosperityaffirmationText = prosperityAffirmationData['prosperityAffirmation'];
                        final documentId = snapshot.data.docs[index].id;
                        final imageUrl = prosperityAffirmationData['imageUrl'];
                        final affirmationCount = prosperityAffirmationData['affirmationCount'];
      
      
                        return FadeTransition(
                          opacity: _animationController.drive(CurveTween(curve: Curves.easeInOut)),
                          child: InkWell(
                            onTap: (){
                              Get.dialog(
                                AlertDialog(backgroundColor: Colors.transparent,
                                  contentPadding: EdgeInsets.zero,
                                  insetPadding: const EdgeInsets.only(left: 0),
                                  content: ProsperityAffirmationBlastEffectDialog(Get.put(ProsperityController()),
                                      currentAffirmationCount: affirmationCount,
                                      documentId: documentId,
                                      decorationImage: DecorationImage(
                                          image: prosperityAffirmationData['imageUrl'] == null
                                              ? CachedNetworkImageProvider(
                                              "https://images.unsplash.com/photo-1483197452165-7abc4b248905?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60")
                                              : CachedNetworkImageProvider(
                                              prosperityAffirmationData['imageUrl']),fit: BoxFit.cover
                                      ),loveaffirmationText: prosperityAffirmationData['prosperityAffirmation']),),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(imageUrl),
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
                                            prosperityaffirmationText!,
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
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
