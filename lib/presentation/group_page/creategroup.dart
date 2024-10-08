import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/group_page/controller/group_controller.dart';
import 'package:daone/presentation/group_page/models/group_model.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/custom_text_form_field.dart';

class CreateGroup extends StatelessWidget {
   CreateGroup({Key? key, this.isEdit=false,this.oldGroupModel}) {
     _controller = Get.put(GroupController());
     if(oldGroupModel!=null){
       _controller.oldGroupModel=oldGroupModel;
       _controller.groupName.text=oldGroupModel!.name;
       _controller.groupDes.text=oldGroupModel!.description;

     }
   }
   late GroupController _controller ;
   GlobalKey<FormState> _key = GlobalKey<FormState>();
  final bool isEdit;
  GroupModel? oldGroupModel;

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: PopScope(
        onPopInvoked: (value){
          _controller.oldGroupModel=null;
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(isEdit?"Update Group":'Add Details',
                style: TextStyle(
                    fontFamily: 'Gotham Light',
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                    color: Colors.black)),
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
                    child: Obx(
                      () => Container(
                        height: Get.height * 0.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            // color: Colors.green,
                            //   image: DecorationImage(image: AssetImage('assets/images/addimage.png',),scale: 5),
                            ),
                        child: InkWell(
                            onTap: () {
                              _controller.pickImage();
                            },
                            child:

                            _controller.selectedImage.value != null
                                ? Image.file(
                                    _controller.selectedImage.value!,
                                    height: Get.height * 0.3,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )
                                :
                            isEdit && oldGroupModel!.image.isNotEmpty?
                                CustomImageView(url: oldGroupModel!.image,
                                    height: Get.height * 0.3,
                                    width: double.infinity,
                                    fit: BoxFit.cover):
                            Image.asset(
                                    'assets/images/addimage.png',
                                    scale: 5,
                                  )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0, top: 20),
                    child: Row(
                      children: [
                        TextWidget(text: "Name"),
                        Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                          child: Icon(Icons.abc)),
                      prefixConstraints: BoxConstraints(
                        maxHeight: getVerticalSize(
                          48,
                        ),
                      ),
                      validator: (value) {
                        if (value == '') {
                          return "Please enter group name";
                        }
                        return null;
                      },
                      filled: true,
                      fillColor: appTheme.gray50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0, top: 20),
                    child: Row(
                      children: [
                        TextWidget(text: "Description"),
                        Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                          child: Icon(Icons.description)),
                      prefixConstraints: BoxConstraints(
                        maxHeight: getVerticalSize(
                          48,
                        ),
                      ),
                      validator: (value) {
                        if (value == '') {
                          return "Please enter group description";
                        }
                        return null;
                      },
                      filled: true,
                      fillColor: appTheme.gray50,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                  InkWell(
                    onTap: () async {
                      if (_key.currentState?.validate() ?? false ) {
                            _controller.createGroup();

                    }},
                    child: Container(
                      height: Get.height * 0.08,
                      width: Get.width * 0.7,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: TextWidget(
                        text: isEdit?"Update":"Create",
                        color: Colors.white,
                        fontFamily: "Gotham Light",
                        fontWeight: FontWeight.w800,
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
