import '../../widgets/custom_elevated_button.dart';
import '../../widgets/text_widget.dart';
import 'controller/view_friends_tab_container_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/view_friend_full_profile_page/view_friend_full_profile_page.dart';
import 'package:daone/presentation/view_friends_page/view_friends_page.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ViewFriendsTabContainerScreen
    extends GetWidget<ViewFriendsTabContainerController> {
  const ViewFriendsTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,

        appBar: CustomAppBar(
          height: getVerticalSize(
            97,
          ),
          leadingWidth: 77,
          leading: AppbarIconbutton(
            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              left: 29,
              top: 4,
              bottom: 4,
            ),
          ),
          centerTitle: true,
          title: AppbarSubtitle2(
            text: "lbl_profile".tr,
          ),
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: getVerticalSize(
                  40,
                ),
                width: getHorizontalSize(
                  305,
                ),
                margin: getMargin(
                  top: 42,
                ),
                decoration: BoxDecoration(
                  color: appTheme.gray20001,
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      20,
                    ),
                  ),
                ),
                child: TabBar(
                  controller: controller.tabviewController,
                  labelColor: appTheme.whiteA700,
                  labelStyle: TextStyle(),
                  unselectedLabelColor: theme.colorScheme.primaryContainer,
                  unselectedLabelStyle: TextStyle(),
                  indicatorPadding: getPadding(
                    all: 2.0,
                  ),
                  indicator: BoxDecoration(
                    color: appTheme.deepOrangeA20005,
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        18,
                      ),
                    ),
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        "lbl_friends".tr,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "lbl_groups".tr,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getVerticalSize(
                  633,
                ),
                child: TabBarView(
                  controller: controller.tabviewController,
                  children: [
                    Container(
                            height: Get.height * 0.3,
                            width: Get.width * 0.9,
                            decoration: BoxDecoration(
                            ),
                            child: ListView.builder(
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: Get.height * 0.11,
                                      width: Get.width * 0.9,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white24,
                                        border: Border.all(
                                          color: Colors.black12,
                                          // color:Color(0xffF46837),// Border color
                                          width: 2.0, // Border width
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white, // Shadow color
                                            offset: Offset(0, 2), // Specify the offset of the shadow
                                            blurRadius: 6.0, // Specify the blur radius
                                            spreadRadius: 2.0, // Specify the spread radius
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(11.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(ImageConstant.profile2,scale: 4,),
                                                Spacer(),
                                                TextWidget(text:"Smith", color:Colors.black , fsize: 15,font: FontWeight.w400),
                                                Spacer(),
                                                Column(
                                                  children: [
                                                    TextWidget(text:"90%", color:Color(0xffF46635) , fsize: 18,font: FontWeight.bold),
                                                    TextWidget(text:"Average", color:Colors.black38 , fsize: 15),
                                                  ],
                                                ),
                                                Spacer(),
                                                InkWell(
                                                  onTap: (){
                                                 Get.toNamed(AppRoutes.viewFriendFullProfilePage);
                                                  },
                                                  child: Container(
                                                    width: Get.width*0.21,
                                                    height:Get.height*0.04,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(31.000001907348633),
                                                        color: Color(0xff048c44)),
                                                    child: Center(
                                                      child: TextWidget(text: "View More",color: Colors.white,fsize: 11,font: FontWeight.w500),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                    //ViewFriendFullProfilePage(),
                    ViewFriendsPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
