import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/presentation/community_page/community_page.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../badges/badgeslist.dart';
import 'controller/account_setting_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class AccountSettingScreen extends GetWidget<AccountSettingController> {
  const AccountSettingScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final user =FirebaseAuth.instance.currentUser!.email;


    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            40,
          ),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: AppbarSubtitle2(
              text: "lbl_profile".tr,
            ),
          ),
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 32,
            ),
            child: Padding(
              padding: getPadding(
                left: 22,
                right: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('users').doc(user).collection('OwnAffirmationList').snapshots(),
                        builder: (context, AsyncSnapshot snapshot) {
                         final data = snapshot.data?.docs.length == 0 ? 1 : snapshot.data?.docs.length;

                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(
                              child: Container(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(
                                  color: Colors.deepOrangeAccent,
                                ),
                              ),
                            );
                          } else {
                            List<int> createNumberList(int n) {
                              List<int> result = List<int>.generate(n, (index) => index + 1);
                              return result;
                            }
                            int itemCount = (data / 100).ceil(); // Calculate the number of grid items
                           List<int> numberList = createNumberList(itemCount);
                           final newNum =numberList.last;

                            return Container(
                              //color: Colors.deepOrange,
                              width: Get.width*0.2,
                              height:Get.height*0.09,
                              child: ListView.builder(
                                itemCount:1,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Center(
                                      child: Container(
                                        width: Get.width*0.2,
                                        height:Get.height*0.08,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage(badges[newNum % badges.length - 1]),fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        },
                      ),
                      Padding(
                        padding: getPadding(
                          top: 12,
                          bottom: 21,
                        ),
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.email).snapshots(),
                          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              // While the data is being fetched, you can return a loading indicator or an empty widget.
                              return CircularProgressIndicator(); // Replace with your loading indicator widget
                            }

                            if (snapshot.hasError) {
                              // Handle errors here
                              return Text('Error: ${snapshot.error}');
                            }

                            if (!snapshot.hasData || !snapshot.data!.exists) {
                              // Handle the case where the document doesn't exist
                              return Text('Document not found');
                            }

                            // Access the 'fullName' field from the document data
                            String fullName = snapshot.data!['fullName'];

                            return Padding(
                              padding: getPadding(
                                top: 1,
                              ),
                              child:TextWidget(text: fullName,color: Colors.black,fsize: 20),
                            );
                          },
                        ),
                      ),
                      Spacer(),
                      CustomElevatedButton(
                        onTap: (){
                          Get.toNamed(AppRoutes.personalDataUpdateTwoScreen);
                        },
                        width: getHorizontalSize(
                          83,
                        ),
                        height: getVerticalSize(
                          30,
                        ),
                        text: "lbl_edit".tr,
                        margin: getMargin(
                          top: 20,
                          bottom: 28,
                        ),
                        buttonStyle: CustomButtonStyles
                            .gradientnamedeeporangeA20006nameprimaryTL15
                            .copyWith(
                                fixedSize: MaterialStateProperty.all<Size>(Size(
                          getHorizontalSize(
                            83,
                          ),
                          getVerticalSize(
                            30,
                          ),
                        ))),
                        decoration: CustomButtonStyles
                            .gradientnamedeeporangeA20006nameprimaryTL15Decoration,
                        buttonTextStyle:
                            CustomTextStyles.labelLargeWhiteA700Medium,
                      ),
                    ],
                  ),
                  Container(
                    margin: getMargin(
                      left: 8,
                      top: 7,
                    ),
                    padding: getPadding(
                      left: 15,
                      top: 20,
                      right: 15,
                      bottom: 20,
                    ),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(
                            left: 5,
                          ),
                          child: Text(
                            "lbl_account".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.titleLarge,
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.personalDataUpdateScreen);
                          },
                          child: Padding(
                            padding: getPadding(
                              left: 5,
                              top: 10,
                            ),
                            child: Row(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgIconlylightdocument,
                                  height: getSize(
                                    20,
                                  ),
                                  width: getSize(
                                    20,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 10,
                                    bottom: 1,
                                  ),
                                  child: TextWidget(text:  "lbl_achievement".tr, color:Colors.black54, fsize: 14),
                                ),
                                Spacer(),
                                CustomImageView(
                                  svgPath: ImageConstant.imgArrowrightGray60005,
                                  height: getSize(
                                    18,
                                  ),
                                  width: getSize(
                                    18,
                                  ),
                                  margin: getMargin(
                                    top: 1,
                                    bottom: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.personalDataUpdateOneScreen);
                          },
                          child: Padding(
                            padding: getPadding(
                              left: 7,
                              top: 11,
                            ),
                            child: Row(
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.imgClock,
                                  height: getSize(
                                    16,
                                  ),
                                  width: getSize(
                                    16,
                                  ),
                                  margin: getMargin(
                                    top: 1,
                                    bottom: 1,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 11,
                                    top: 1,
                                  ),
                                  child: TextWidget(text:  "lbl_highlights".tr, color:Colors.black54, fsize: 14),
                                ),
                                Spacer(),
                               CustomImageView(
                                  svgPath: ImageConstant.imgArrowrightGray60005,
                                  height: getSize(
                                    18,
                                  ),
                                  width: getSize(
                                    18,
                                  ),
                                  margin: getMargin(
                                    bottom: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.blogScreen);
                          },
                          child: Padding(
                            padding: getPadding(
                              left: 5,
                              top: 9,
                            ),
                            child: Row(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgIconlylightchart,
                                  height: getSize(
                                    20,
                                  ),
                                  width: getSize(
                                    20,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 10,
                                    bottom: 1,
                                  ),
                                  child:TextWidget(text:  "lbl_notes".tr, color:Colors.black54, fsize: 14),
                                ),
                                Spacer(),
                                CustomImageView(
                                  svgPath: ImageConstant.imgArrowrightGray60005,
                                  height: getSize(
                                    18,
                                  ),
                                  width: getSize(
                                    18,
                                  ),
                                  margin: getMargin(
                                    top: 1,
                                    bottom: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.to(()=>CommunityPage());
                          },
                          child: Padding(
                            padding: getPadding(
                              left: 6,
                              top: 11,
                            ),
                            child: Row(
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.imgLocation,
                                  height: getSize(
                                    18,
                                  ),
                                  width: getSize(
                                    18,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 11,
                                  ),
                                  child:TextWidget(text:  "lbl_community".tr, color:Colors.black54, fsize: 14),
                                ),
                                Spacer(),
                                CustomImageView(
                                  svgPath: ImageConstant.imgArrowrightGray60005,
                                  height: getSize(
                                    18,
                                  ),
                                  width: getSize(
                                    18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.viewFriendsTabContainerScreen);
                          },
                          child: Padding(
                            padding: getPadding(
                              left: 6,
                              top: 10,
                            ),
                            child: Row(
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.imgIconworkout,
                                  height: getVerticalSize(
                                    16,
                                  ),
                                  width: getHorizontalSize(
                                    18,
                                  ),
                                  margin: getMargin(
                                    top: 1,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 11,
                                  ),
                                  child:TextWidget(text:  "lbl_friends".tr, color:Colors.black54, fsize: 14),
                                ),
                                Spacer(),
                                CustomImageView(
                                  svgPath: ImageConstant.imgArrowrightGray60005,
                                  height: getSize(
                                    18,
                                  ),
                                  width: getSize(
                                    18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 5,
                            top: 14,
                          ),
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath:
                                ImageConstant.imgIconlylightmessage20x20,
                                height: getSize(
                                  20,
                                ),
                                width: getSize(
                                  20,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 10,
                                  bottom: 1,
                                ),
                                child:TextWidget(text:  "lbl_contact_us".tr, color:Colors.black54, fsize: 14),
                              ),
                              Spacer(),
                              CustomImageView(
                                svgPath: ImageConstant.imgArrowrightGray60005,
                                height: getSize(
                                  18,
                                ),
                                width: getSize(
                                  18,
                                ),
                                margin: getMargin(
                                  top: 1,
                                  bottom: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 5,
                            top: 9,
                          ),
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgIconlylightshield,
                                height: getSize(
                                  20,
                                ),
                                width: getSize(
                                  20,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 10,
                                  top: 2,
                                ),
                                child: TextWidget(text:  "lbl_privacy_policy".tr, color:Colors.black54, fsize: 14),
                              ),
                              Spacer(),
                              CustomImageView(
                                svgPath: ImageConstant.imgArrowrightGray60005,
                                height: getSize(
                                  18,
                                ),
                                width: getSize(
                                  18,
                                ),
                                margin: getMargin(
                                  top: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.changePasswordRoute);
                          },
                          child: Padding(
                            padding: getPadding(
                              left: 5,
                              top: 10,
                            ),
                            child: Row(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgIconlylightsetting,
                                  height: getSize(
                                    20,
                                  ),
                                  width: getSize(
                                    20,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 10,
                                    top: 2,
                                  ),
                                  child: TextWidget(text: "Change Password", color:Colors.black54, fsize: 14),
                                ),
                                Spacer(),
                                CustomImageView(
                                  svgPath: ImageConstant.imgArrowrightGray60005,
                                  height: getSize(
                                    18,
                                  ),
                                  width: getSize(
                                    18,
                                  ),
                                  margin: getMargin(
                                    top: 1,
                                    bottom: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.defaultDialog(title:"LOGOUT ?",
                                content:Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap:(){
                                     controller.signOut();
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Center(child: TextWidget(color: Colors.white,text: "Yes",fsize: 12),),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    InkWell(
                                      onTap: (){
                                        Get.back();
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.deepOrangeAccent,
                                            borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Center(child: TextWidget(color: Colors.white,text: "No",fsize: 12),)
                                      ),
                                    )
                                  ],

                                ), );
                          },
                          child: Padding(
                            padding: getPadding(
                              left: 5,
                              top: 14,
                            ),
                            child: Row(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgIconlylightprofile,
                                  height: getSize(
                                    20,
                                  ),
                                  width: getSize(
                                    20,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 10,
                                    bottom: 1,
                                  ),
                                  child:  TextWidget(text:  "Logout", color:Colors.black54, fsize: 14),
                                ),
                                Spacer(),
                                CustomImageView(
                                  svgPath: ImageConstant.imgArrowrightGray60005,
                                  height: getSize(
                                    25,
                                  ),
                                  width: getSize(
                                    25,
                                  ),
                                  margin: getMargin(
                                    top: 1,
                                    bottom: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
