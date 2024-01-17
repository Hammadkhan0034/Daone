
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/group_page/controller/group_controller.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/custom_text_form_field.dart';

class CreateGroup extends StatelessWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GroupController _controller =Get.put(GroupController());
    GlobalKey<FormState> _key = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text('Add Details',
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
        body: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                Material(
                  elevation: 4,
                  child:Obx(()=> Container(
                    height: Get.height*0.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: Colors.green,
                    //   image: DecorationImage(image: AssetImage('assets/images/addimage.png',),scale: 5),
                    ),
                    child: InkWell(
                        onTap: (){
                          _controller.pickImage();
                        },
                        child: _controller.selectedImage.value != null ?
                            Image.file(
                              _controller.selectedImage.value!,
                              height: Get.height*0.3,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ):Image.asset('assets/images/addimage.png',scale: 5,)),
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0,top: 20),
                  child: Row(
                    children: [
                      TextWidget(text:"Name"),
                      Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: CustomTextFormField(
                    function: (value) {
                     _controller.groupName.text = value;
                    },
                   controller: _controller.groupName,
                    margin: getMargin(
                      top: 30,
                    ),
                    contentPadding: getPadding(
                      top: 15,
                      right: 30,
                      bottom: 15,
                    ),
                    textStyle: CustomTextStyles.bodySmallGray50005,
                    hintText: "Group Name",
                    hintStyle: CustomTextStyles.bodySmallGray50005,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                    prefix: Container(
                      margin: getMargin(
                        left: 15,
                        top: 15,
                        right: 10,
                        bottom: 15,
                      ),
                      child: Icon(Icons.abc)
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(
                        48,
                      ),
                    ),
                    validator: (value) {
                      if (value == '' ) {
                        return "Please enter group name";
                      }
                      return null;
                    },
                    filled: true,
                    fillColor: appTheme.gray50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0,top: 20),
                  child: Row(
                    children: [
                      TextWidget(text:"Description"),
                      Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: CustomTextFormField(
                    function: (value) {
                     _controller.groupDes.text = value;
                    },
                    controller: _controller.groupDes,
                    margin: getMargin(
                      top: 30,
                    ),
                    contentPadding: getPadding(
                      top: 15,
                      right: 30,
                      bottom: 15,
                    ),
                    textStyle: CustomTextStyles.bodySmallGray50005,
                    hintText: "    Group Description",
                    hintStyle: CustomTextStyles.bodySmallGray50005,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                    maxLines: 3,
                    prefix: Container(
                      margin: getMargin(
                        left: 15,
                        top: 15,
                        right: 10,
                        bottom: 15,
                      ),
                      child: Icon(Icons.description)
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(
                        48,
                      ),
                    ),
                    validator: (value) {
                      if (value=='') {
                        return "Please enter group description";
                      }
                      return null;
                    },
                    filled: true,
                    fillColor: appTheme.gray50,
                  ),
                ),
                SizedBox(
                  height: Get.height*0.1,
                ),
              InkWell(
                  onTap: () async {
    if (_key.currentState?.validate() ?? false) {
    String? userEmail = FirebaseAuth.instance.currentUser?.email;

    if (userEmail != null) {
    String? imageUrl = await getImageUrl(userEmail);

    if (imageUrl != null) {
    _controller.createGroup(context, imageUrl);
    } else {
    // Handle the case where imageUrl is null
    Get.snackbar('App Info', 'Image URL not available.');
    }
    } else {
    // Handle the case where userEmail is null
    Get.snackbar('App Info', 'User email not available.');
    }
    } else {
    Get.snackbar('App Info', 'Form is not valid.');
    }
                    },
                  child: Container(
                    height: Get.height * 0.08,
                    width: Get.width * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: TextWidget(
                          text: "Create",
                          color: Colors.white,
                          fontFamily: "Gotham Light",
                          font: FontWeight.w800,
                        )),
                  ),
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<String?> getImageUrl(String userEmail) async {
    try {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userEmail)
          .get();

      // Ensure that 'imageUrl' is a String field in the document
      String? imageUrl = userSnapshot.get('imageUrl');

      // Ensure imageUrl is not null before using it
      return imageUrl;
    } catch (e) {
      // Handle any potential errors
      print('Error fetching user profile: $e');
      return null; // Return null on error
    }
  }
}
