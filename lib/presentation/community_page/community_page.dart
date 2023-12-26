import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/community_controller.dart';
import 'models/community_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  CommunityPage({Key? key}) : super(key: key);

  CommunityController controller =
  Get.put(CommunityController(CommunityModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: getVerticalSize(
            70,
          ),
          leadingWidth: 72,
          leading: AppbarIconbutton(
            onTap: (){
              Get.back();
            },
            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              left: 24,
              top: 4,
              bottom: 4,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Colors.deepOrange,
          child: Center(child: Icon(Icons.photo, color: Colors.white)),
          onPressed: () {
            Get.dialog(
              AlertDialog(
                backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
                insetPadding: const EdgeInsets.only(left: 0),
                content: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(controller.user)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator(color: Colors.deepOrange,));
                    }

                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (!snapshot.hasData || !snapshot.data!.exists) {
                      return Text('Document does not exist');
                    }

                    final userData = snapshot.data!.data() as Map<String, dynamic>?;
                    if (userData == null) {
                      return Center(child: CircularProgressIndicator(color: Colors.deepOrange,)); // Handle appropriately
                    }

                    final userName = userData['fullName'] ?? '';
                    final imageUrl = userData['imageUrl'] ?? '';

                    return Container(
                      height: Get.height * 0.54,
                      width: Get.width * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 15),
                            child: Row(
                              children: [
                                Icon(Icons.arrow_forward),
                                Spacer(),
                                TextWidget(
                                    text: 'Add Post',
                                    color: Colors.black,
                                    fsize: 18),
                                Spacer(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 8),
                            child: CustomTextFormField(
                              maxLines: 2,
                              function: (value) {
                                controller.postController.text = value;
                              },
                              controller: controller.postController,
                              margin: getMargin(
                                top: 30,
                              ),
                              contentPadding: getPadding(
                                top: 15,
                                right: 30,
                                bottom: 15,
                              ),
                              textStyle: CustomTextStyles.bodySmallGray50005,
                              hintText: "What's in your mind",
                              hintStyle: CustomTextStyles.bodySmallGray50005,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress,
                              prefix: Container(
                                  margin: getMargin(
                                    left: 15,
                                    top: 15,
                                    right: 10,
                                    bottom: 15,
                                  ),
                                  child: Icon(Icons.text_fields)),
                              prefixConstraints: BoxConstraints(
                                maxHeight: getVerticalSize(48),
                              ),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter valid email";
                                }
                                return null;
                              },
                              filled: true,
                              fillColor: appTheme.gray50,
                            ),
                          ),
                          Obx(() => InkWell(
                            onTap: () {
                              controller.getImage();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 4),
                              child: Container(
                                height: Get.height * 0.2,
                                width: Get.width * 0.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.black54,
                                  image: (controller.imagePath.isEmpty)
                                      ? DecorationImage(
                                    image: AssetImage(
                                        'assets/images/no-image.png'),
                                  )
                                      : DecorationImage(
                                    image: FileImage(
                                        File(controller.imagePath.value)),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          )),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 18.0, horizontal: 8),
                            child: InkWell(
                              onTap: () {
                                File? postImageFile =
                                controller.imagePath.value.isNotEmpty
                                    ? File(controller.imagePath.value)
                                    : null;
                                controller.postCollection(
                                  context,
                                  imageUrl,
                                  userName,
                                  controller.postController.text,
                                  postImageFile,
                                );
                              },
                              child: Container(
                                height: Get.height * 0.04,
                                width: Get.width * 0.3,
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: TextWidget(
                                    text: "Upload",
                                    color: Colors.white,
                                    fontFamily: 'Gotham Light',
                                    font: FontWeight.w400,
                                    fsize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: Get.width*0.1,),
                  TextWidget(text: 'Community', color:Colors.black,
                      fontFamily: 'Gotham Light',
                      font: FontWeight.w800,
                      fsize: 32,),
                ],
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('postCollection').snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator(color: Colors.deepOrange,));
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text('No posts found');
                  }
                  
                  
                  return Container(
                    height: Get.height * 0.8,
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final postData = snapshot.data?.docs[index].data() as Map<String, dynamic>;
                        final userName = postData['userName'];
                        final userProfile = postData['userProfilePic'];
                        final postPic = postData['postPic'];
                        final postTitle = postData['postTitle'];
                        final postLike = postData['postLike'];
                        final documentId = snapshot.data.docs[index].id;
                        Timestamp timestamp = postData['date'];
                        DateTime dateTime = timestamp.toDate();
                        String formattedDateTime = DateFormat('d-M-yyyy hh:mm a').format(dateTime);

                        bool isLiked = false; // Add this variable to track the like status
                        if (postData.containsKey('isLiked')) {
                          isLiked = postData['isLiked'];
                        }
                        // final comments= FirebaseFirestore.instance.collection('postCollection').doc(documentId)
                        // .collection('comment').get();
                        // comments.then((QuerySnapshot commentValues) {
                        //   controller.commentLength.value = commentValues.docs.length;
                        //
                        // });

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 4),
                          child: Container(
                            height: Get.height * 0.43,
                            width: Get.width * 0.9,
                            decoration: BoxDecoration(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.06,
                                      ),
                                      Container(
                                        height: Get.height * 0.05,
                                        width: Get.width * 0.1,
                                        decoration: BoxDecoration(
                                          color: Colors.black12,
                                          image: DecorationImage(
                                            image: NetworkImage(userProfile),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: TextWidget(text: userName,
                                                fontFamily: 'Gotham Light',
                                                font: FontWeight.w800,color: Colors.black, fsize: 12),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: TextWidget(text: formattedDateTime, color: Colors.black, fsize: 10),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Container(
                                    padding: EdgeInsets.all(2),
                                    width: Get.width * 0.7,
                                    child: TextWidget(text: postTitle, color: Colors.black, fsize: 12),
                                  ),
                                ),
                                Container(
                                  height: Get.height * 0.22,
                                  width: Get.width * 0.7,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: NetworkImage(postPic),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.1,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                        controller.likeFunction(controller.user,documentId);

                                        },
                                        child: Material(
                                          color: Colors.white,
                                          elevation: 2,
                                          borderRadius: BorderRadius.circular(100),
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Center(
                                              child: Image.asset('assets/images/like1.png', scale: 4),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: TextWidget(text: postLike.toString(), color: Colors.deepOrange, fsize: 16),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.1,
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Get.bottomSheet(
                                            StreamBuilder(
                                               stream: FirebaseFirestore.instance
                                                    .collection('users')
                                                    .doc(controller.user)
                                                    .snapshots(),
                                                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                                    return Center(child: CircularProgressIndicator(color: Colors.deepOrange));
                                                  }

                                                  if (snapshot.hasError) {
                                                    return Text('Error: ${snapshot.error}');
                                                  }

                                                  if (!snapshot.hasData || !snapshot.data!.exists) {
                                                    return Text('Document does not exist');
                                                  }

                                                  final userData = snapshot.data!.data() as Map<String, dynamic>?;

                                                  if (userData == null) {
                                                    return Center(child: CircularProgressIndicator(color: Colors.deepOrange));
                                                    // You can handle this case as needed
                                                  }

                                                  final userName = userData['fullName'] ?? '';
                                                  final imageUrl = userData['imageUrl'] ?? '';
                                                  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

                                                  return Container(
                                            color: Colors.white,

                                            child: SingleChildScrollView(
                                              child: Form(
                                                key: _formKey,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                                                          child: Container(
                                                              height: Get.height*0.007,
                                                              width: Get.width*0.5,
                                                              decoration: BoxDecoration(
                                                                color: Colors.deepOrange,
                                                                borderRadius: BorderRadius.circular(10),
                                                              )
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                                      child: TextWidget(text: 'Comments', color:Colors.black, fsize: 18),
                                                    ),
                                                    Divider(color: Colors.black12),
                                                    StreamBuilder(
                                                        stream:FirebaseFirestore.instance
                                                        .collection('postCollection')
                                                        .doc(documentId)
                                                        .collection('comment')
                                                        .orderBy('date', descending: true) // Order comments by date in descending order
                                                        .snapshots(),
                                                        builder: (context,AsyncSnapshot snapshot){
                                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                                            return Center(child: CircularProgressIndicator(color: Colors.deepOrange,)); // Loading indicator while fetching comments
                                                          }
                                                          if (snapshot.hasError) {
                                                            return Text('Error: ${snapshot.error}');
                                                          }
                                                          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                                                            return Text('No comments found'); // Display a message if there are no comments
                                                          }
                                                      return  Container(
                                                          height: Get.height*0.38,
                                                          width: Get.width*1,
                                                          child:ListView.builder(
                                                              itemCount: snapshot.data!.docs.length,
                                                              itemBuilder: (context,index){
                                                                final comment = snapshot.data!.docs[index];
                                                                final data = comment.data() as Map<String, dynamic>;
                                                                final profile = data['profile'];
                                                                final commentText = data['comment'];
                                                                final name = data['username'];
                                                                final date = data['date'] as Timestamp;
                                                                final formattedDate =
                                                                DateFormat('d-M-yyyy hh:mm a').format(date.toDate());
                                                                return Padding(
                                                                  padding: const EdgeInsets.all(5.0),
                                                                  child: Container(
                                                                    height: Get.height*0.1,
                                                                    width: Get.width*1,
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(100),
                                                                  //    color: Colors.blue,
                                                                    ),
                                                                    child:  Padding(
                                                                      padding: const EdgeInsets.all(1.0),
                                                                      child: Row(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                        children: [
                                                                          Container(
                                                                            height: Get.height * 0.07,
                                                                            width: Get.width * 0.15,
                                                                            decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(100),
                                                                              color: Colors.white,
                                                                              image: DecorationImage(
                                                                                image: NetworkImage(profile),
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                            children: [
                                                                              SizedBox(height: Get.height*0.01),
                                                                              Row(
                                                                                children: [
                                                                                  SizedBox(width: Get.width*0.02),
                                                                                  TextWidget(text: name, color: Colors.black, fsize:14,font: FontWeight.w500, ),
                                                                                  SizedBox(width: Get.width*0.04),
                                                                                  TextWidget(text: formattedDate.toString(), color: Colors.black45, fsize: 12),

                                                                                ],
                                                                              ),
                                                                              Expanded(child: Padding(
                                                                                padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 0),
                                                                                child: TextWidget(text:commentText??'', color:Colors.black, fsize: 13),
                                                                              )),
                                                                              Divider(color: Colors.black12),

                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              })
                                                      );

                                                    }),

                                                    Container(
                                                      //   color: Colors.purpleAccent,
                                                      height: Get.height*0.08,
                                                      width: Get.width*1,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(50),
                                                        // border: Border.all(
                                                        //   color: Colors.black, // Border color
                                                        //   width: 2.0, // Border width
                                                        // ),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(width: Get.width*0.05),
                                                          Container(
                                                            height: Get.height * 0.05,
                                                            width: Get.width * 0.11,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(100),
                                                              color: Colors.white,
                                                              image: DecorationImage(
                                                                image: NetworkImage(imageUrl),
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                          ),

                                                          SizedBox(
                                                            width: Get.width*0.01,

                                                          ),
                                                          Container(
                                                            // color: Colors.yellow,
                                                            height: Get.height*0.09,
                                                            width: Get.width*0.7,
                                                            decoration: BoxDecoration(

                                                            ),
                                                            child: TextFormField(
                                                              onSaved: (value){
                                                                controller.commentController.text =value!;
                                                              },
                                                              controller: controller.commentController ,
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
                                                                  // The form is valid, proceed with your action
                                                                  controller.commentsSection(
                                                                    name: userName,
                                                                    postId: documentId,
                                                                    comment: controller.commentController.text,
                                                                    profile: imageUrl,
                                                                    context: context
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
                                            ),
                                          );}));

                                        },
                                        child: Material(
                                          color: Colors.white,
                                          elevation: 2,
                                          borderRadius: BorderRadius.circular(100),
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Center(
                                              child: Image.asset('assets/images/comment.png', scale: 4),
                                            ),
                                          ),
                                        ),
                                      ),

                                      // Obx(()=>
                                      //    Padding(
                                      //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      //     child: TextWidget(text:controller.commentLength.value.toString(), color: Colors.deepOrange, fsize: 16),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
