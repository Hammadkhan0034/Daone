import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_2.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../add_new_friends_dialog/add_new_friends_dialog.dart';
import '../add_new_friends_dialog/controller/add_new_friends_controller.dart';
import 'controller/view_friend_full_profile_controller.dart';
import 'models/view_friend_full_profile_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_drop_down.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

class ViewFriendFullProfilePage extends StatelessWidget {
  late String userName;
  var affirmationCount,taskCount,intenseCompleted,blogReadCount,number;
  late String userProfile;
late String name,email;
  ViewFriendFullProfilePage(this.controller,{Key? key,
    required this.email,required this.name,required this.number,
    required this.affirmationCount,required this.blogReadCount,required this.userProfile,
    required this.intenseCompleted,required this.taskCount,required this.userName})
      : super(
          key: key,
        );
  //
  // ViewFriendFullProfileController controller = Get.put(
  //     ViewFriendFullProfileController(ViewFriendFullProfileModel().obs));
  //
  ViewFriendFullProfileController controller;

   @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: mediaQueryData.size.width,
      decoration: BoxDecoration(      color: Colors.white,
borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: getPadding(
            left: 29,
            top: 35,
            right: 29,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: getVerticalSize(
                  460,
                ),
                width: getHorizontalSize(
                  317,
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        elevation:5,
                        margin: EdgeInsets.all(0),
                        color: appTheme.whiteA700,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: appTheme.indigo100,
                            width: getHorizontalSize(
                              1,
                            ),
                          ),
                          borderRadius:
                          BorderRadiusStyle.roundedBorder14,
                        ),
                        child: Container(
                          height: getVerticalSize(
                            420,
                          ),
                          width: getHorizontalSize(
                            317,
                          ),
                          padding: getPadding(
                            left: 17,
                            top: 47,
                            right: 17,
                            bottom: 47,
                          ),
                          decoration: AppDecoration.outline13.copyWith(
                            borderRadius:
                            BorderRadiusStyle.roundedBorder14,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: getVerticalSize(
                                    132,
                                  ),
                                  width: getHorizontalSize(
                                    127,
                                  ),
                                  margin: getMargin(
                                    top: 45,
                                  ),
                                  decoration: BoxDecoration(
                                    color: appTheme.whiteA700,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        14,
                                      ),
                                    ),
                                    border: Border.all(
                                      color: appTheme.deepOrangeA20006,
                                      width: getHorizontalSize(
                                        1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  height: getVerticalSize(
                                    132,
                                  ),
                                  width: getHorizontalSize(
                                    127,
                                  ),
                                  decoration: BoxDecoration(
                                    color: appTheme.whiteA700,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        14,
                                      ),
                                    ),
                                    border: Border.all(
                                      color: appTheme.deepOrangeA20006,
                                      width: getHorizontalSize(
                                        1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: getVerticalSize(
                                    132,
                                  ),
                                  width: getHorizontalSize(
                                    127,
                                  ),
                                  margin: getMargin(
                                    top: 45,
                                    right: 1,
                                  ),
                                  decoration: BoxDecoration(
                                    color: appTheme.whiteA700,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        14,
                                      ),
                                    ),
                                    border: Border.all(
                                      color: appTheme.deepOrangeA20006,
                                      width: getHorizontalSize(
                                        1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  height: getVerticalSize(
                                    132,
                                  ),
                                  width: getHorizontalSize(
                                    127,
                                  ),
                                  margin: getMargin(
                                    right: 1,
                                  ),
                                  decoration: BoxDecoration(
                                    color: appTheme.whiteA700,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        14,
                                      ),
                                    ),
                                    border: Border.all(
                                      color: appTheme.deepOrangeA20006,
                                      width: getHorizontalSize(
                                        1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: getSize(
                                    69,
                                  ),
                                  width: getSize(
                                    69,
                                  ),
                                  margin: getMargin(
                                    left: 29,
                                    top: 76,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        34,
                                      ),
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment(
                                        1,
                                        1,
                                      ),
                                      end: Alignment(
                                        -0.24,
                                        -0.31,
                                      ),
                                      colors: [
                                        appTheme.deepOrangeA20006,
                                        theme.colorScheme.primary,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: getMargin(
                                    left: 76,
                                    top: 73,
                                  ),
                                  padding: getPadding(
                                    left: 6,
                                    top: 3,
                                    right: 6,
                                    bottom: 3,
                                  ),
                                  decoration:
                                  AppDecoration.outline13.copyWith(
                                    borderRadius: BorderRadiusStyle
                                        .roundedBorder11,
                                  ),
                                  child: Text(
                                    affirmationCount.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles
                                        .labelMediumSemiBold,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  height: getSize(
                                    69,
                                  ),
                                  width: getSize(
                                    69,
                                  ),
                                  margin: getMargin(
                                    left: 29,
                                    bottom: 30,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        34,
                                      ),
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment(
                                        1,
                                        1,
                                      ),
                                      end: Alignment(
                                        -0.24,
                                        -0.31,
                                      ),
                                      colors: [
                                        appTheme.deepOrangeA20006,
                                        theme.colorScheme.primary,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  height: getSize(
                                    69,
                                  ),
                                  width: getSize(
                                    69,
                                  ),
                                  margin: getMargin(
                                    right: 29,
                                    bottom: 30,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        34,
                                      ),
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment(
                                        1,
                                        1,
                                      ),
                                      end: Alignment(
                                        -0.24,
                                        -0.31,
                                      ),
                                      colors: [
                                        appTheme.deepOrangeA20006,
                                        theme.colorScheme.primary,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: getSize(
                                    69,
                                  ),
                                  width: getSize(
                                    69,
                                  ),
                                  margin: getMargin(
                                    top: 77,
                                    right: 30,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        34,
                                      ),
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment(
                                        1,
                                        1,
                                      ),
                                      end: Alignment(
                                        -0.24,
                                        -0.31,
                                      ),
                                      colors: [
                                        appTheme.deepOrangeA20006,
                                        theme.colorScheme.primary,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  margin: getMargin(
                                    top: 73,
                                    right: 27,
                                  ),
                                  padding: getPadding(
                                    left: 8,
                                    top: 3,
                                    right: 8,
                                    bottom: 3,
                                  ),
                                  decoration:
                                  AppDecoration.outline13.copyWith(
                                    borderRadius: BorderRadiusStyle
                                        .roundedBorder11,
                                  ),
                                  child: Text(
                                    intenseCompleted.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles
                                        .labelMediumSemiBold,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  margin: getMargin(
                                    right: 26,
                                    bottom: 76,
                                  ),
                                  padding: getPadding(
                                    left: 6,
                                    top: 3,
                                    right: 6,
                                    bottom: 3,
                                  ),
                                  decoration:
                                  AppDecoration.outline13.copyWith(
                                    borderRadius: BorderRadiusStyle
                                        .roundedBorder11,
                                  ),
                                  child: Text(
                                    blogReadCount.toString()??'0',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles
                                        .labelMediumSemiBold,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  margin: getMargin(
                                    left: 79,
                                    bottom: 76,
                                  ),
                                  padding: getPadding(
                                    left: 6,
                                    top: 3,
                                    right: 6,
                                    bottom: 3,
                                  ),
                                  decoration:
                                  AppDecoration.outline13.copyWith(
                                    borderRadius: BorderRadiusStyle
                                        .roundedBorder11,
                                  ),
                                  child: Text(
                                    taskCount.toString()??'0', //correct
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles
                                        .labelMediumSemiBold,
                                  ),
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgVideolesson,
                                height: getSize(
                                  37,
                                ),
                                width: getSize(
                                  37,
                                ),
                                alignment: Alignment.bottomRight,
                                margin: getMargin(
                                  right: 45,
                                  bottom: 45,
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgIdea,
                                height: getSize(
                                  42,
                                ),
                                width: getSize(
                                  42,
                                ),
                                alignment: Alignment.bottomLeft,
                                margin: getMargin(
                                  left: 42,
                                  bottom: 43,
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgFire,
                                height: getSize(
                                  42,
                                ),
                                width: getSize(
                                  42,
                                ),
                                alignment: Alignment.topRight,
                                margin: getMargin(
                                  top: 90,
                                  right: 43,
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgYes,
                                height: getSize(
                                  43,
                                ),
                                width: getSize(
                                  43,
                                ),
                                alignment: Alignment.topLeft,
                                margin: getMargin(
                                  left: 42,
                                  top: 89,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomImageView(
                      url: userProfile??'https://img.icons8.com/?size=50&id=14736&format=png',fit: BoxFit.cover,
                      height: getSize(
                        81,
                      ),
                      width: getSize(
                        81,
                      ),
                      radius: BorderRadius.circular(
                        getHorizontalSize(
                          40,
                        ),
                      ),
                      alignment: Alignment.topCenter,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: getPadding(
                          top: 88,
                        ),
                        child: Text(
                          userName??'No Name',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: CustomTextStyles.titleLargeBluegray700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomElevatedButton(
                onTap: (){
                  controller.addFriendList(context, name, email, userProfile,number as String?);

                  // controller.copyDataToFriendList(email??'', name??'');
                  // print(email+ name );
                },
                width: getHorizontalSize(
                  307,
                ),
                height: getVerticalSize(
                  60,
                ),
                text: "lbl_add_friends".tr,
                margin: getMargin(
                  left: 5,
                  top: 34,
                  right: 5,
                ),
                buttonStyle:
                CustomButtonStyles.outlineIndigoA1004c.copyWith(
                    fixedSize: MaterialStateProperty.all<Size>(Size(
                      double.maxFinite,
                      getVerticalSize(
                        60,
                      ),
                    ))),
                decoration:
                CustomButtonStyles.outlineIndigoA1004cDecoration,
                buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
