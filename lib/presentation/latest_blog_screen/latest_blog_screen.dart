import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/presentation/latest_blog_screen/controller/latest_blog_controller.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:selectable/selectable.dart';
import 'package:share_plus/share_plus.dart';

import '../../widgets/custom_text_form_field.dart';
import '../save_or_edit_blog_dialog/controller/save_or_edit_blog_controller.dart';
import '../save_or_edit_blog_dialog/save_or_edit_blog_dialog.dart';

class LatestBlogScreen extends StatefulWidget {
  final Map<String, dynamic> blogData;
  final String blogId;

  LatestBlogScreen({required this.blogId, required this.blogData});

  @override
  _LatestBlogScreenState createState() => _LatestBlogScreenState();
}

class _LatestBlogScreenState extends State<LatestBlogScreen> {
  LatestBlogController latestBlogController = Get.put(LatestBlogController());

  @override
  void initState() {
    super.initState();
    _updateBlogRead(widget.blogId);
  }

  Future<void> _updateBlogRead(String blogId) async {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email);
    await documentReference
        .collection('blogReadList')
        .doc(widget.blogData['title'])
        .set({
      'blogRead': blogId,
      'date': Timestamp.fromDate(DateTime.now()),
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    SaveOrEditBlogController controller2 = Get.put(SaveOrEditBlogController());
    LatestBlogController noteController = LatestBlogController();

    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: SizedBox(
        //   height: Get.height * 0.11,
        //   width: Get.width * 0.8,
        //   child: Row(
        //     children: [
        //       SizedBox(width: Get.width * 0.1),
        //       Material(
        //         borderRadius: BorderRadius.circular(50),
        //         elevation: 3,
        //         child: Container(
        //           height: Get.height * 0.09,
        //           width: Get.width * 0.8,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(50),
        //           ),
        //           child: Row(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Spacer(),
        //               InkWell(
        //                 onTap: () {
        //                   Get.dialog(
        //                     AlertDialog(
        //                       backgroundColor: Colors.transparent,
        //                       contentPadding: EdgeInsets.zero,
        //                       insetPadding: const EdgeInsets.only(left: 0),
        //                       content: SaveOrEditBlogDialog(
        //                         Get.put(SaveOrEditBlogController()),
        //                       ),
        //                     ),
        //                   );
        //                 },
        //                 child: Image.asset(ImageConstant.imageBlog1, scale: 3.1),
        //               ),
        //               Spacer(),
        //             ],
        //           ),
        //         ),
        //       ),
        //       SizedBox(width: Get.width * 0.02),
        //     ],
        //   ),
        // ),
        backgroundColor: appTheme.whiteA700,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Latest Blogs',
              style:
              TextStyle(
                  fontFamily: 'Gotham Light',
                  fontWeight: FontWeight.w800,
                  fontSize: 25, color: Colors.black)),
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
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: getPadding(
                  left: 29,
                  right: 29,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          height: Get.height * 0.2,
                          width: double.infinity,
                          imageUrl: widget.blogData['imageUrl'] ??
                              'https://images.pexels.com/photos/1337382/pexels-photo-1337382.jpeg?auto=compress&cs=tinysrgb&w=400',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(child: CircularProgressIndicator()), // You can customize the placeholder
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                      Container(
                        //color: Colors.orangeAccent,
                        width: getHorizontalSize(
                          299,
                        ),
                        margin: getMargin(
                          top: 12,
                          bottom: 12,
                        ),
                        child: Column(
                          children: [
                            Text(
                              widget.blogData['title'] ?? 'No title',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style:TextStyle(
                                fontFamily: 'Gotham Light',
                                fontSize: 18,fontWeight: FontWeight.w800
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: getVerticalSize(
                          420,
                        ),
                        width: getHorizontalSize(
                          311,
                        ),
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Obx(() {
                              return Theme(
                                data: ThemeData(
                                    textSelectionTheme: TextSelectionThemeData(
                                      cursorColor: Colors.yellow,
                                      selectionColor:
                                      latestBlogController.selectedColor,
                                      selectionHandleColor: Colors.red,
                                    )),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SelectableText(
                                        widget.blogData['description'],
                                        textAlign: TextAlign.justify,
                                  
                                        style: TextStyle(
                                          fontFamily: 'Gotham Light',
                                          fontWeight: FontWeight.w400,
                                          color:Colors.black,
                                          fontSize: 16
                                        ),
                                        cursorColor: Colors.red,
                                        onSelectionChanged: (selection, cause) {
                                          latestBlogController.selectedText =
                                              selection.textInside(
                                                  widget.blogData['description']);
                                          if (latestBlogController
                                              .selectedText.isEmpty) {
                                            latestBlogController
                                                .shouldShowBottomMenu = false;
                                          } else {
                                            latestBlogController
                                                .shouldShowBottomMenu = true;
                                          }
                                  
                                          print(latestBlogController.selectedText);
                                        },
                                      ),
                                      Obx(() {
                                        return latestBlogController.shouldShowBottomMenu
                                            ? Container(
                                            //  color: Colors.pink,
                                              height: Get.height * 0.3,
                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                            )
                                            : SizedBox.shrink();
                                      })
                                  
                                    ],
                                  ),
                                ),
                              );
                            })),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() {
                return latestBlogController.shouldShowBottomMenu
                    ? Positioned(
                    bottom: 0,
                    child: Container(
                      color: Colors.white,
                      height: Get.height * 0.3,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        color: Colors.white,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(12),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: Get.width * 0.5,
                              height: Get.height * 0.005,
                              margin: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                TextWidget(
                                  text: widget.blogData['title'],
                                  color: Colors.black,
                                  fontFamily: 'Gotham Light',
                                  fsize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 20),
                                  child: InkWell(
                                    onTap: () {
                                      String selectedText =
                                          latestBlogController.selectedText;
                                      Share.share(selectedText);
                                    },
                                    child: Container(
                                      height: Get.height * 0.06,
                                      width: Get.width * 0.23,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(25),
                                          color: Colors.black12),
                                      child: Center(
                                          child: TextWidget(
                                            text: "Share",
                                            fontFamily: 'Gotham Light',
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black,
                                            fsize: 14,
                                          )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(()=>SaveOrEditBlogScreen(
                                        fontName:controller2.selectedFontFamily.value,
                                        title: widget.blogData['title'],
                                        copyText: latestBlogController
                                            .selectedText,
                                        controller: Get.put(
                                            SaveOrEditBlogController()),
                                      ),

                                      );
                                    },
                                    child: Container(
                                      height: Get.height * 0.06,
                                      width: Get.width * 0.23,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(25),
                                          color: Colors.black12),
                                      child: Center(
                                          child: TextWidget(
                                            text: "Image",
                                            fontFamily: 'Gotham Light',
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black,
                                            fsize: 14,
                                          )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  child: InkWell(
                                    onTap: () {
                                      Get.dialog(
                                        AlertDialog(
                                          backgroundColor:
                                          Colors.transparent,
                                          contentPadding: EdgeInsets.zero,
                                          insetPadding:
                                          EdgeInsets.only(left: 0),
                                          content: Container(
                                            height: Get.height * 0.6,
                                            width: Get.width * 0.5,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    12)),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextWidget(
                                                      text: 'Private Notes',
                                                      fontFamily: 'Gotham Light',
                                                      fontWeight: FontWeight.w800,
                                                      color: Colors.black,
                                                      fsize: 12),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(25.0),
                                                    child: Container(
                                                        decoration:
                                                        BoxDecoration(
                                                          border:
                                                          Border.all(
                                                            color: Colors
                                                                .black,
                                                            width:
                                                            1, // Adjust the width as needed
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .all(
                                                              20.0),
                                                          child: TextWidget(
                                                              text: latestBlogController
                                                                  .selectedText,
                                                              color: Colors
                                                                  .black,
                                                              fsize: 12),
                                                        )),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .symmetric(
                                                        horizontal:
                                                        18.0),
                                                    child:
                                                    CustomTextFormField(
                                                      controller: noteController
                                                          .noteTextController,
                                                      textStyle:
                                                      CustomTextStyles
                                                          .bodySmallGray50005,
                                                      hintText: "   Note",
                                                      hintStyle:
                                                      CustomTextStyles
                                                          .bodySmallGray50005,
                                                      textInputType:
                                                      TextInputType
                                                          .visiblePassword,
                                                      prefixConstraints:
                                                      BoxConstraints(
                                                        maxHeight:
                                                        getVerticalSize(
                                                          48,
                                                        ),
                                                      ),
                                                      suffixConstraints:
                                                      BoxConstraints(
                                                        maxHeight:
                                                        getVerticalSize(
                                                          48,
                                                        ),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                      appTheme.gray50,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      noteController.notesList(
                                                          context: context,
                                                          selectedText:
                                                          latestBlogController
                                                              .selectedText,
                                                          noteComment:
                                                          noteController
                                                              .noteTextController
                                                              .text,
                                                          title: widget
                                                              .blogData[
                                                          'title']);
                                                    },
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(8.0),
                                                      child: Container(
                                                        height: Get.height *
                                                            0.05,
                                                        width:
                                                        Get.width * 0.2,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                12),
                                                            color: Colors
                                                                .deepOrange),
                                                        child: Center(
                                                          child: TextWidget(
                                                            text: 'Saved',
                                                            color: Colors
                                                                .white,
                                                            fsize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: Get.height * 0.06,
                                      width: Get.width * 0.23,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(25),
                                          color: Colors.black12),
                                      child: Center(
                                          child: TextWidget(
                                            text: "Notes",
                                            color: Colors.black,
                                            fsize: 14,
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              width: Get.width,
                              height: 50,
                              child: ListView.builder(
                                  itemCount: latestBlogController
                                      .colorsList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        latestBlogController.selectedColor =
                                        latestBlogController
                                            .colorsList[index];
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5),
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: latestBlogController
                                                .colorsList[index],
                                            borderRadius:
                                            BorderRadius.circular(50)),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ))
                    : SizedBox.shrink();
              })
            ],
          ),
        ),
        // floatingActionButton: InkWell(
        //   onTap: () {
        //     // Handle FAB tap action here
        //   },
        //   child: Container(
        //     height: Get.height * 0.09,
        //     width: Get.width * 0.16,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(100),
        //       image: DecorationImage(
        //         image: AssetImage("assets/images/unlike.png"),
        //       ),
        //     ),
        //     child: Align(
        //       alignment: Alignment.bottomCenter,
        //       child: Text("0"),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
