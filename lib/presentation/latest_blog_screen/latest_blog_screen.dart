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
  @override
  void initState() {
    super.initState();
    _updateBlogRead(widget.blogId);
  }

  Future<void> _updateBlogRead(String blogId) async {
    DocumentReference documentReference = FirebaseFirestore.instance.collection('users').doc(
        FirebaseAuth.instance.currentUser!.email);
    await documentReference.collection('blogReadList').doc(widget.blogData['title']).set({
      'blogRead': blogId,
      'date':Timestamp.fromDate(DateTime.now()),
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
        appBar: CustomAppBar(
          height: getVerticalSize(
            97,
          ),
          leadingWidth: 77,
          leading: AppbarIconbutton(
            onTap: () {
              Get.back();
            },
            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              left: 29,
              top: 4,
              bottom: 4,
            ),
          ),
          centerTitle: true,
          title: AppbarSubtitle2(
            text: "latest Blogs",
          ),
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 18,
            ),
            child: Padding(
              padding: getPadding(
                left: 29,
                right: 29,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: Get.height * 0.25,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.blogData['imageUrl'] ??
                              'https://images.pexels.com/photos/1337382/pexels-photo-1337382.jpeg?auto=compress&cs=tinysrgb&w=400',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: getHorizontalSize(
                      299,
                    ),
                    margin: getMargin(
                      top: 12,
                      right: 18,
                    ),
                    child: Text(
                      widget.blogData['title'] ?? 'No title',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleMediumBlack900,
                    ),
                  ),
                  Container(
                    height: getVerticalSize(
                      360,
                    ),
                    width: getHorizontalSize(
                      311,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Selectable(
                            selectionColor: Colors.white60,
                          child:Text( widget.blogData['description'],),
                          popupMenuItems: [
                          // SelectableMenuItem(type: SelectableMenuItemType.copy),
                 SelectableMenuItem(
                          title: 'Open',
                          isEnabled: (controller) { return  controller!.isTextSelected;},
                          handler: (controller) {
                            Get.bottomSheet(
                                Container(
                              height:Get.height*0.2,
                                  color: Colors.white,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: Get.width*0.5,
                                      height: Get.height*0.005,
                                      decoration: BoxDecoration(
                                          color: Colors.deepOrange,
                                          borderRadius: BorderRadius.circular(15)),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 5,),
                                      TextWidget(text: widget.blogData['title'], color:Colors.black, fsize: 15,font: FontWeight.w700,),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
                                        child: InkWell(
                                          onTap: (){
                                            String selectedText =controller!.getSelection()!.text!;
                                            Share.share(selectedText);
                                          },
                                          child: Container(
                                            height:Get.height*0.06,
                                            width: Get.width*0.23,
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.black12),
                                            child: Center(child: TextWidget(text: "Share",color: Colors.black,fsize: 14,)),

                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.symmetric(horizontal:10,vertical: 20),
                                        child: InkWell(
                                          onTap: (){
                                            Get.dialog(
                                              AlertDialog(
                                                backgroundColor: Colors.transparent,
                                                contentPadding: EdgeInsets.zero,
                                                insetPadding:  EdgeInsets.only(left: 0),
                                                content: SaveOrEditBlogDialog(
                                                  title: widget.blogData['title'] ,
                                                  copyText:controller!.getSelection()!.text!,
                                                  controller:Get.put(SaveOrEditBlogController()),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height:Get.height*0.04,
                                            width: Get.width*0.23,
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.black12),
                                            child: Center(child: TextWidget(text: "Image",color: Colors.black,fsize: 14,)),

                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.symmetric(horizontal:10,vertical: 20),
                                        child: InkWell(
                                          onTap: (){
                                            Get.dialog(
                                              AlertDialog(
                                                backgroundColor: Colors.transparent,
                                                contentPadding: EdgeInsets.zero,
                                                insetPadding:  EdgeInsets.only(left: 0),
                                                content:Container(
                                                  height: Get.height*0.6,
                                                  width: Get.width*0.5,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(12)

                                                  ),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        SizedBox(height: 10,),
                                                        TextWidget(text:'Private Notes', color:Colors.black, fsize: 12),
                                                        Padding(
                                                          padding: const EdgeInsets.all(25.0),
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color: Colors.black,
                                                                  width: 1, // Adjust the width as needed
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(20.0),
                                                                child:
                                                                TextWidget(text: controller!.getSelection()!.text!, color:Colors.black, fsize: 12),
                                                              )),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                                          child: CustomTextFormField(
                                                            controller: noteController.noteTextController,
                                                            textStyle: CustomTextStyles.bodySmallGray50005,
                                                            hintText: "   Note",
                                                            hintStyle: CustomTextStyles.bodySmallGray50005,
                                                            textInputType: TextInputType.visiblePassword,
                                                            prefixConstraints: BoxConstraints(
                                                              maxHeight: getVerticalSize(
                                                                48,
                                                              ),
                                                            ),
                                                            suffixConstraints: BoxConstraints(
                                                              maxHeight: getVerticalSize(
                                                                48,
                                                              ),
                                                            ),
                                                            filled: true,
                                                            fillColor: appTheme.gray50,
                                                          ),
                                                        ),

                                                        InkWell(
                                                          onTap: (){
                                                            noteController.notesList(context: context,
                                                                selectedText:controller!.getSelection()!.text!,
                                                                noteComment: noteController.noteTextController.text, title:widget.blogData['title']);
                                                          },
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Container(
                                                              height: Get.height*0.05,
                                                              width: Get.width*0.2,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(12),
                                                                  color: Colors.deepOrange),
                                                              child: Center(
                                                                child: TextWidget(
                                                                  text: 'Saved',color: Colors.white,fsize: 14,
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
                                            height:Get.height*0.06,
                                            width: Get.width*0.23,
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.black12),
                                            child: Center(child: TextWidget(text: "Notes",color: Colors.black,fsize: 14,)),

                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),

                            ));

                  return true;
                  },
                  ),
                      // SelectableMenuItem(
                      //   title: 'Share',
                      //   isEnabled: (controller) => controller!.isTextSelected,
                      //   handler: (controller) {
                      //     String selectedText =controller!.getSelection()!.text!;
                      //     Share.share(selectedText);
                      //     return true;
                      //   },
                      // ),
                ],
              ),
                        ),
                        // Align(
                        //   alignment: Alignment.topRight,
                        //   child: SizedBox(
                        //     width: getHorizontalSize(
                        //       311,
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.symmetric(vertical: 8.0),
                        //       child: SelectableText(
                        //         widget.blogData['description'],
                        //         maxLines: 17,
                        //         textAlign: TextAlign.left,
                        //         style: CustomTextStyles.bodySmallBlack900,
                        //
                        //
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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

