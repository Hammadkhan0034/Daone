import 'controller/app_navigation_controller.dart';import 'package:daone/core/app_export.dart';import 'package:flutter/material.dart';import 'package:daone/presentation/grade_yourself_dialog/grade_yourself_dialog.dart';import 'package:daone/presentation/grade_yourself_dialog/controller/grade_yourself_controller.dart';import 'package:daone/presentation/affirmation_blast_dialog/affirmation_blast_dialog.dart';import 'package:daone/presentation/affirmation_blast_dialog/controller/affirmation_blast_controller.dart';import 'package:daone/presentation/affirmation_blast_effect_dialog/affirmation_blast_effect_dialog.dart';import 'package:daone/presentation/affirmation_blast_effect_dialog/controller/affirmation_blast_effect_controller.dart';import 'package:daone/presentation/edit_affirmation_dialog/edit_affirmation_dialog.dart';import 'package:daone/presentation/edit_affirmation_dialog/controller/edit_affirmation_controller.dart';import 'package:daone/presentation/add_task_pop_up_calender_dialog/add_task_pop_up_calender_dialog.dart';import 'package:daone/presentation/add_task_pop_up_calender_dialog/controller/add_task_pop_up_calender_controller.dart';import 'package:daone/presentation/save_or_edit_blog_dialog/save_or_edit_blog_dialog.dart';import 'package:daone/presentation/save_or_edit_blog_dialog/controller/save_or_edit_blog_controller.dart';import 'package:daone/presentation/comment_section_one_dialog/comment_section_one_dialog.dart';import 'package:daone/presentation/comment_section_one_dialog/controller/comment_section_one_controller.dart';import 'package:daone/presentation/add_new_friends_dialog/add_new_friends_dialog.dart';import 'package:daone/presentation/add_new_friends_dialog/controller/add_new_friends_controller.dart';class AppNavigationScreen extends GetWidget<AppNavigationController> {const AppNavigationScreen({Key? key}) : super(key: key);

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context);
 return SafeArea(child: Scaffold(backgroundColor: appTheme.whiteA700,
     body: SizedBox(width: double.maxFinite, child: Column(mainAxisAlignment:
     MainAxisAlignment.start, children: [Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_app_navigation".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20), child: Text("msg_check_your_app_s".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.blueGray40002, fontSize: getFontSize(16), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.black900))])), Expanded(child: SingleChildScrollView(child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [GestureDetector(onTap: () {onTapWelcomeScreenOne();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_welcome_screen".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapOnboardingOne();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_onboarding_one".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapOnboardingTwo();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_onboarding_two".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapOnboardingThree();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_onboarding_three".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapOnboardingFour();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_onboarding_four".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapRegisterPageOne();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_register_page".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapSuccessRegistration();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_success_registration".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapLoginPage();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_login_page".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapHome();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_home".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapDailyIntensionRecord();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_daily_intension".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapRecording();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_recording".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapReminders();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_reminders".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapDailyIntensionRecordOne();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_daily_intension2".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapUpdateReminders();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_update_reminders".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapComplete();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_complete".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapGradeyourself();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_grade_yourself".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapHomeOne();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_home_one".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapAffirmationBlast();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_affirmation_blast".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapAffirmationBlasteffect();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_affirmation_blast2".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapSelectAffirmation();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_select_affirmation".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapEditAffirmation();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_edit_affirmation".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapHomenotask();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_home_no_task".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapSelectTask();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_select_task".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapAddTask();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_add_task".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapAddTaskPopUpCalender();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_add_task_pop_up".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapViewalltaskTabContainer();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_view_all_task".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapTaskEmpty();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_task_empty".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapCongratulationsPage();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_congratulations".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapStats();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_stats".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapSleepTracker();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_sleep_tracker".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapBlog();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_blog".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapLatestBlog();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_latest_blog".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapLatestBlogOne();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_latest_blog_one".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapSaveorEditBlog();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_save_or_edit_blog".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapCommunityTabContainer();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_community_tab".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapCommentSection();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_comment_section".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapCommentSectionOne();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_comment_section".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapAddfriends();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_add_friends2".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapViewFriendsTabContainer();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_view_friends_tab".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapAddnewfriends();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_add_new_friends".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapAccountsetting();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_account_setting".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapPersonalDataUpdateTwo();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_personal_data_update".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapPersonalDataUpdate();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_personal_data_update2".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))]))), GestureDetector(onTap: () {onTapPersonalDataUpdateOne();}, child: Container(decoration: AppDecoration.fill, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_personal_data_update3".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray40002))])))]))))])))); }
/// Navigates to the welcomeScreenOneScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the welcomeScreenOneScreen.
onTapWelcomeScreenOne() { Get.toNamed(AppRoutes.welcomeScreenOneScreen, ); } 
/// Navigates to the onboardingOneScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the onboardingOneScreen.
onTapOnboardingOne() { Get.toNamed(AppRoutes.onboardingOneScreen, ); } 
/// Navigates to the onboardingTwoScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the onboardingTwoScreen.
onTapOnboardingTwo() { Get.toNamed(AppRoutes.onboardingTwoScreen, ); } 
/// Navigates to the onboardingThreeScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the onboardingThreeScreen.
onTapOnboardingThree() { Get.toNamed(AppRoutes.onboardingThreeScreen, ); } 
/// Navigates to the onboardingFourScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the onboardingFourScreen.
onTapOnboardingFour() { Get.toNamed(AppRoutes.onboardingFourScreen, ); } 
/// Navigates to the registerPageOneScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the registerPageOneScreen.
onTapRegisterPageOne() { Get.toNamed(AppRoutes.registerPageOneScreen, ); } 
/// Navigates to the successRegistrationScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the successRegistrationScreen.
onTapSuccessRegistration() { Get.toNamed(AppRoutes.successRegistrationScreen, ); } 
/// Navigates to the loginPageScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the loginPageScreen.
onTapLoginPage() { Get.toNamed(AppRoutes.loginPageScreen, ); } 
/// Navigates to the homeScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the homeScreen.
onTapHome() { Get.toNamed(AppRoutes.homeScreen, ); } 
/// Navigates to the dailyIntensionRecordScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the dailyIntensionRecordScreen.
onTapDailyIntensionRecord() { Get.toNamed(AppRoutes.dailyIntensionRecordScreen, ); } 
/// Navigates to the recordingScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the recordingScreen.
onTapRecording() { Get.toNamed(AppRoutes.recordingScreen, ); } 
/// Navigates to the remindersScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the remindersScreen.
onTapReminders() { Get.toNamed(AppRoutes.remindersScreen, ); } 
/// Navigates to the dailyIntensionRecordOneScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the dailyIntensionRecordOneScreen.
onTapDailyIntensionRecordOne() { Get.toNamed(AppRoutes.dailyIntensionRecordOneScreen, ); } 
/// Navigates to the updateRemindersScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the updateRemindersScreen.
onTapUpdateReminders() { Get.toNamed(AppRoutes.updateRemindersScreen, ); } 
/// Navigates to the completeScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the completeScreen.
onTapComplete() { Get.toNamed(AppRoutes.completeScreen, ); } 


/// Displays a dialog with the [GradeYourselfDialog] content.
///
/// The [GradeYourselfDialog] widget is created with a new 
/// instance of the [GradeYourselfController],
/// which is obtained using the Get.put() method.
onTapGradeyourself() { Get.dialog(AlertDialog(backgroundColor: Colors.transparent,
 contentPadding: EdgeInsets.zero,
 insetPadding: const EdgeInsets.only(left: 0),
 content:GradeYourselfDialog(Get.put(GradeYourselfController(),),),)); }
/// Navigates to the homeOneScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the homeOneScreen.
onTapHomeOne() { Get.toNamed(AppRoutes.homeOneScreen, ); } 


/// Displays a dialog with the [AffirmationBlastDialog] content.
///
/// The [AffirmationBlastDialog] widget is created with a new 
/// instance of the [AffirmationBlastController],
/// which is obtained using the Get.put() method.
onTapAffirmationBlast() { Get.dialog(AlertDialog(backgroundColor: Colors.transparent, contentPadding: EdgeInsets.zero, insetPadding: const EdgeInsets.only(left: 0), content:AffirmationBlastDialog(Get.put(AffirmationBlastController(),),),)); } 


/// Displays a dialog with the [AffirmationBlastEffectDialog] content.
///
/// The [AffirmationBlastEffectDialog] widget is created with a new 
/// instance of the [AffirmationBlastEffectController],
/// which is obtained using the Get.put() method.
onTapAffirmationBlasteffect() { Get.dialog(AlertDialog(backgroundColor: Colors.transparent, contentPadding: EdgeInsets.zero, insetPadding: const EdgeInsets.only(left: 0), content:AffirmationBlastEffectDialog(Get.put(AffirmationBlastEffectController(),),),)); } 
/// Navigates to the selectAffirmationScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the selectAffirmationScreen.
onTapSelectAffirmation() { Get.toNamed(AppRoutes.selectAffirmationScreen, ); } 


/// Displays a dialog with the [EditAffirmationDialog] content.
///
/// The [EditAffirmationDialog] widget is created with a new 
/// instance of the [EditAffirmationController],
/// which is obtained using the Get.put() method.
onTapEditAffirmation() { Get.dialog(AlertDialog(backgroundColor: Colors.transparent, contentPadding: EdgeInsets.zero, insetPadding: const EdgeInsets.only(left: 0), content:EditAffirmationDialog(Get.put(EditAffirmationController(),),),)); } 
/// Navigates to the homeNoTaskScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the homeNoTaskScreen.
onTapHomenotask() { Get.toNamed(AppRoutes.homeNoTaskScreen, ); } 
/// Navigates to the selectTaskScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the selectTaskScreen.
onTapSelectTask() { Get.toNamed(AppRoutes.selectTaskScreen, ); } 
/// Navigates to the addTaskScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the addTaskScreen.
onTapAddTask() { Get.toNamed(AppRoutes.addTaskScreen, ); } 


/// Displays a dialog with the [AddTaskPopUpCalenderDialog] content.
///
/// The [AddTaskPopUpCalenderDialog] widget is created with a new 
/// instance of the [AddTaskPopUpCalenderController],
/// which is obtained using the Get.put() method.
onTapAddTaskPopUpCalender() {
 Get.dialog(AlertDialog(backgroundColor: Colors.transparent,
  contentPadding: EdgeInsets.zero, insetPadding: const EdgeInsets.only(left: 0), content:AddTaskPopUpCalenderDialog(Get.put(AddTaskPopUpCalenderController(),),),)); }
/// Navigates to the viewAllTaskTabContainerScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the viewAllTaskTabContainerScreen.
onTapViewalltaskTabContainer() { Get.toNamed(AppRoutes.viewAllTaskTabContainerScreen, ); } 
/// Navigates to the taskEmptyScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the taskEmptyScreen.
onTapTaskEmpty() { Get.toNamed(AppRoutes.taskEmptyScreen, ); } 
/// Navigates to the congratulationsPageScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the congratulationsPageScreen.
onTapCongratulationsPage() { Get.toNamed(AppRoutes.congratulationsPageScreen, ); } 
/// Navigates to the statsScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the statsScreen.
onTapStats() { Get.toNamed(AppRoutes.statsScreen, ); } 
/// Navigates to the sleepTrackerScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the sleepTrackerScreen.
onTapSleepTracker() { Get.toNamed(AppRoutes.sleepTrackerScreen, ); } 
/// Navigates to the blogScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the blogScreen.
onTapBlog() { Get.toNamed(AppRoutes.blogScreen, ); } 
/// Navigates to the latestBlogScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the latestBlogScreen.
onTapLatestBlog() { Get.toNamed(AppRoutes.latestBlogScreen, ); } 
/// Navigates to the latestBlogOneScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the latestBlogOneScreen.
onTapLatestBlogOne() { Get.toNamed(AppRoutes.latestBlogOneScreen, ); } 


/// Displays a dialog with the [SaveOrEditBlogDialog] content.
///
/// The [SaveOrEditBlogDialog] widget is created with a new 
/// instance of the [SaveOrEditBlogController],
/// which is obtained using the Get.put() method.
onTapSaveorEditBlog() { Get.dialog(AlertDialog(backgroundColor: Colors.transparent,
 contentPadding: EdgeInsets.zero, insetPadding: const EdgeInsets.only(left: 0), content:SaveOrEditBlogDialog(Get.put(SaveOrEditBlogController(),),),)); }
/// Navigates to the communityTabContainerScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the communityTabContainerScreen.
onTapCommunityTabContainer() { Get.toNamed(AppRoutes.communityTabContainerScreen, ); } 
/// Navigates to the commentSectionScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the commentSectionScreen.
onTapCommentSection() { Get.toNamed(AppRoutes.commentSectionScreen, ); } 


/// Displays a dialog with the [CommentSectionOneDialog] content.
///
/// The [CommentSectionOneDialog] widget is created with a new 
/// instance of the [CommentSectionOneController],
/// which is obtained using the Get.put() method.
onTapCommentSectionOne() { Get.dialog(AlertDialog(backgroundColor: Colors.transparent, contentPadding: EdgeInsets.zero, insetPadding: const EdgeInsets.only(left: 0),
 content:CommentSectionOneDialog(Get.put(CommentSectionOneController(),),),)); }
/// Navigates to the addFriendsScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the addFriendsScreen.
onTapAddfriends() { Get.toNamed(AppRoutes.addFriendsScreen, ); } 
/// Navigates to the viewFriendsTabContainerScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the viewFriendsTabContainerScreen.
onTapViewFriendsTabContainer() { Get.toNamed(AppRoutes.viewFriendsTabContainerScreen, ); } 


/// Displays a dialog with the [AddNewFriendsDialog] content.
///
/// The [AddNewFriendsDialog] widget is created with a new 
/// instance of the [AddNewFriendsController],
/// which is obtained using the Get.put() method.
onTapAddnewfriends() { Get.dialog(AlertDialog(backgroundColor: Colors.transparent, contentPadding: EdgeInsets.zero,
 insetPadding: const EdgeInsets.only(left: 0), content:AddNewFriendsDialog(Get.put(AddNewFriendsController(),),),)); }
/// Navigates to the accountSettingScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the accountSettingScreen.
onTapAccountsetting() { Get.toNamed(AppRoutes.accountSettingScreen, ); } 
/// Navigates to the personalDataUpdateTwoScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the personalDataUpdateTwoScreen.
onTapPersonalDataUpdateTwo() { Get.toNamed(AppRoutes.personalDataUpdateTwoScreen, ); } 
/// Navigates to the personalDataUpdateScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the personalDataUpdateScreen.
onTapPersonalDataUpdate() { Get.toNamed(AppRoutes.personalDataUpdateScreen, ); } 
/// Navigates to the personalDataUpdateOneScreen when the action is triggered.

/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the personalDataUpdateOneScreen.
onTapPersonalDataUpdateOne() { Get.toNamed(AppRoutes.personalDataUpdateOneScreen, ); } 
 }
