import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/create_images/controller/create_image_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import '../../../widgets/app_bar/appbar_iconbutton.dart';
import '../../../widgets/text_widget.dart';
import '../../save_or_edit_blog_dialog/controller/save_or_edit_blog_controller.dart';
import '../../save_or_edit_blog_dialog/save_or_edit_blog_dialog.dart';

class CreateImageView extends StatelessWidget {
  const CreateImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(CreateImageController());
    final user = FirebaseAuth.instance.currentUser;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    SaveOrEditBlogController controller2 = Get.put(SaveOrEditBlogController());
    Uint8List _imageFile;


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Images',
            style: GoogleFonts.playfairDisplay(fontSize: 30, color: Colors.black)),
        leadingWidth: 68,
        leading: AppbarIconbutton(
          onTap: () {
            Get.back();
          },
          svgPath: ImageConstant.imgInfo,
          margin: getMargin(
            left: 30,
            top: 10,
            bottom: 5,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user?.email) // Replace with the user's UID
            .collection('highlightList')
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading indicator while data is being fetched
            return Center(
              child: CircularProgressIndicator(
                color: Colors.deepOrange,
              ),
            );
          }

          if (snapshot.hasError) {
            // Handle errors here
            return Text('Error: ${snapshot.error}');
          }

          // Check if there are no tasks
          if (snapshot.data.docs.isEmpty) {
            return Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                //  color: Colors.teal
              ),
              child: Center(
                child: TextWidget(
                  text: "You don't have any Image",
                  color: Colors.black38,
                  fsize: 14,
                  font: FontWeight.w500,
                ),
              ),
            );
          }
          return Container(
            height: Get.height * 0.9,
            width: Get.width,
            child: ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                var highlightData = snapshot.data.docs[index].data();
                var docId = snapshot.data.docs[index].id;
                String hexColor = highlightData['textColor'];
                Color textColor = _hexToColor(hexColor);
                final ScreenshotController screenshotController = ScreenshotController();



                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width * 0.1,
                          ),
                          Container(
                            height: Get.height * 0.06,
                            width: Get.width * 0.13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: Colors.black,
                                width: 3.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          Container(
                            width: Get.width * 0.46,
                            height: Get.height * 0.065,
                            child: Text(
                              'You created an image for ${highlightData['title']}',
                              style: GoogleFonts.playfairDisplay(fontSize: 12),
                            ),
                          ),
                          Container(
                            width: Get.width * 0.17,
                            height: Get.height * 0.065,
                            child: Text(
                              highlightData['date'],
                              style: GoogleFonts.playfairDisplay(fontSize: 11),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Screenshot(
                      controller:screenshotController,
                      child: Container(
                        height: Get.height * 0.4,
                        width: Get.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: highlightData['imageUrl'],
                              imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  highlightData['selectedText'],
                                  style: GoogleFonts.getFont(
                                    highlightData['fontFamily']??'Roboto',
                                    fontSize: highlightData['fontSize'],
                                    color: textColor ,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width * 0.14,
                          ),
                          InkWell(
                            onTap: () {
                              controller.toggleHighlightStatus(docId);
                            },
                            child: highlightData['isHighlighted'] == false
                                ? Image.asset('assets/images/heart.png', scale: 5,)
                                : Image.asset('assets/images/hearted.png', scale: 17,),
                          ),
                          SizedBox(
                            width: Get.width * 0.1,
                          ),
                          InkWell(
                            onTap: () {
                              Get.bottomSheet(
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child:  SingleChildScrollView(
                                      child: Form(
                                        key: _formKey,
                                        child: Column(
                                          children: [

                                            StreamBuilder(
                                                stream: FirebaseFirestore.instance
                                                    .collection('users').doc(user!.email)
                                                    .collection('highlightList').doc(docId)
                                                    .collection('comment').snapshots(),


                                                builder:(context,AsyncSnapshot snapshot){
                                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                                    // Loading indicator while data is being fetched
                                                    return Center(
                                                      child: CircularProgressIndicator(
                                                        color: Colors.deepOrange,
                                                      ),
                                                    );
                                                  }
                                                  return  SizedBox(
                                                    height: Get.height*0.472,
                                                    width: Get.width,
                                                    child: ListView.builder(
                                                        itemCount: snapshot.data.docs.length,
                                                        itemBuilder: (context,index){

                                                          var commentData =snapshot.data.docs[index].data();
                                                          var formattedDate=DateFormat('d MMM, yyyy').format(commentData['date'].toDate());
                                                          return Container(
                                                            height: Get.height*0.1,
                                                            width: Get.width*1,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(100),
                                                              //    color: Colors.blue,
                                                            ),
                                                            child:  Padding(
                                                              padding: const EdgeInsets.all(12.0),
                                                              child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Container(
                                                                    height: Get.height * 0.05,
                                                                    width: Get.width * 0.1,
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(100),
                                                                      border: Border.all(
                                                                        color: Colors.black,
                                                                        width: 3.0, // Adjust the width as needed
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    children: [

                                                                      Row(
                                                                        children: [
                                                                          SizedBox(width: Get.width*0.02),
                                                                          TextWidget(text:'Moment', color: Colors.black, fsize:14,font: FontWeight.w500, ),
                                                                          SizedBox(width: Get.width*0.04),
                                                                          TextWidget(text:formattedDate, color: Colors.black45, fsize: 12),

                                                                        ],
                                                                      ),
                                                                      Expanded(child: Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 0),
                                                                        child: TextWidget(text:commentData['comment'], color:Colors.black, fsize: 13),
                                                                      )),
                                                                      Divider(color: Colors.black12),

                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  );
                                                }),



                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: Get.height * 0.05,
                                                    width: Get.width * 0.1,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(100),
                                                      border: Border.all(
                                                        color: Colors.black,
                                                        width: 3.0, // Adjust the width as needed
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox( width: Get.width*0.01,  ),
                                                  Container(
                                                    // color: Colors.yellow,
                                                    height: Get.height*0.09,
                                                    width: Get.width*0.7,
                                                    decoration: BoxDecoration(

                                                    ),
                                                    child: TextFormField(
                                                      onSaved: (value){
                                                        controller.createImageCommentController.text =value!;
                                                      },
                                                      controller: controller.createImageCommentController,
                                                      validator: (value) {
                                                        if (value == null || value.isEmpty) {
                                                          return 'Please enter a comment';
                                                        }
                                                        return null; // Return null to indicate no error
                                                      },
                                                      decoration: InputDecoration(
                                                        labelText: 'Type Something here...',
                                                        enabledBorder: InputBorder.none,
                                                        labelStyle: TextStyle(color: Colors.black),

                                                        border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(50.0),
                                                          borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                                        ),
                                                        // Custom border for the input field when focused
                                                        focusedBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(50.0),
                                                          borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                      onTap: (){
                                                        if (_formKey.currentState!.validate()) {
                                                          controller.imageCommentsSection(
                                                              context: context,postId: docId,
                                                              comment: controller.createImageCommentController.text
                                                          );
                                                        }
                                                      },
                                                      child: Image.asset('assets/images/send.png',scale: 2.4,)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                ),

                              );
                            },
                            child: Image.asset('assets/images/newcomment.png', scale: 17,),
                          ),
                          SizedBox(
                            width: Get.width * 0.42,
                          ),
                          buildPopupMenuButton(context: context,title: highlightData['title'],
                            description: highlightData['selectedText'],fontName: highlightData['fontFamily'],
                            imageShare: () async {
                              try {
                                Uint8List? imageUint8List = await screenshotController.capture();
                                if (imageUint8List != null) {
                                  final tempDir = await getTemporaryDirectory();
                                  final tempFile = File('${tempDir.path}/image.png');
                                  await tempFile.writeAsBytes(imageUint8List);

                                  Share.shareFiles([tempFile.path], text: 'Check out this image!');
                                } else {
                                  // Handle the case where imageUint8List is null
                                  print('Error capturing image. Image data is null.');
                                }
                              } catch (e) {
                                // Handle exceptions
                                print('Error sharing image: $e');
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildPopupMenuButton({required BuildContext context,var fontName,title,description,required var imageShare}) {
    return PopupMenuButton<String>(
      color: Colors.white,
      onSelected: (String value) {
        if (value == 'share') {
          // Handle share option
        } else if (value == 'createImage') {
          // Handle createImage option
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
         PopupMenuItem<String>(
           onTap: imageShare,
          value: 'share',
          child: Text('Share'),
        ),
        PopupMenuItem<String>(
          onTap: (){
            Get.dialog(
              AlertDialog(
                backgroundColor:
                Colors.transparent,
                contentPadding: EdgeInsets.zero,
                insetPadding:
                EdgeInsets.only(left: 0),
                content: SaveOrEditBlogDialog(
                  fontName:fontName,
                  title: title,
                  copyText: description,
                  controller: Get.put(
                      SaveOrEditBlogController()),
                ),
              ),
            );
          },
          value: 'createImage',
          child: Text('Create Image'),
        ),
      ],
    );
  }
  Color _hexToColor(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    int hexInt = int.parse(hexColor, radix: 16);
    return Color(hexInt).withOpacity(1.0);
  }

}
