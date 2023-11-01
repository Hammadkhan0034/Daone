import 'package:daone/presentation/view_all_task_tab_container_screen/widgets/all_tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/text_widget.dart';
import 'controller/calender_controller.dart';
import 'controller/view_all_task_tab_container_controller.dart';

class ViewAllTaskTabContainerScreen extends GetWidget<ViewAllTaskTabContainerController> {
  const ViewAllTaskTabContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ViewAllTaskTabContainerController controller1 = Get.put(ViewAllTaskTabContainerController());
    final CalendarController calenderController = Get.put(CalendarController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar(
          elevation: 1.8,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: TextWidget(text:"lbl_tasks".tr,color: Colors.black,fsize: 24,font: FontWeight.w600,
          ),
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 6, // Limit the list to 5 items
                  itemBuilder: (BuildContext context, int index) {
                    final DateTime currentDate = DateTime.now();
                    final DateTime date = currentDate.add(Duration(days: index)); // Add days to get next dates

                    return GestureDetector(
                      onTap: () {
                        // Handle date selection here
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          color: date.day == currentDate.day
                              ? Colors.deepOrange // Current date container color
                              : Colors.white, // Default container color
                          borderRadius: BorderRadius.circular(10.0),
                          elevation: 2,
                          child: Container(
                            width: Get.width * 0.12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: date.day == currentDate.day
                                  ? Colors.deepOrange // Current date container color
                                  : Colors.white, // Default container color
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  // TextWidget(
                                  //   text: date.year.toString(),
                                  //   color: date.day == currentDate.day
                                  //       ? Colors.white // Current date text color
                                  //       : Colors.black, // Default container text color
                                  //   fsize: 0.2,
                                  // ),
                                  TextWidget(
                                    text: date.month.toString(),
                                    color: date.day == currentDate.day
                                        ? Colors.white // Current date text color
                                        : Colors.black, // Default container text color
                                    fsize: 0.0008,
                                    font: FontWeight.bold,
                                  ),
                                  TextWidget(
                                    text: date.day.toString(),
                                    color: date.day == currentDate.day
                                        ? Colors.white // Current date text color
                                        : Colors.black, // Default container text color
                                    fsize: 16,
                                  ),
                                  TextWidget(
                                    text: calenderController.getMonthName(date.month),
                                    color: date.day == currentDate.day
                                        ? Colors.white // Current date text color
                                        : Colors.black, // Default container text color
                                    fsize: 12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 2),
                child: SizedBox(
                  height: Get.height * 0.04,
                  width: Get.width,
                  child: TabBar(
                    controller: controller1.tabviewController,
                    labelColor: appTheme.whiteA700,
                    labelStyle: TextStyle(),
                    unselectedLabelColor: appTheme.deepOrangeA20002,
                    unselectedLabelStyle: TextStyle(),
                    indicator: BoxDecoration(
                      color: appTheme.deepOrangeA20002,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    tabs: [
                      Tab(
                        child: Text(
                          "lbl_all".tr,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Tab(
                        child: Text(
                          "lbl_to_do".tr,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Tab(
                        child: Text(
                          "lbl_complete".tr,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getVerticalSize(470),
                child: TabBarView(
                  controller: controller1.tabviewController,
                  children: [
                    allTaskList(context),
                    todoListWdiget(context),
                   completeListWdiget(context),
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
















// import 'package:daone/presentation/view_all_task_tab_container_screen/widgets/all_tasks_list.dart';
// import 'package:intl/intl.dart';
// import '../../widgets/text_widget.dart';
// import 'controller/calender_controller.dart';
// import 'controller/view_all_task_tab_container_controller.dart';
// import 'package:daone/core/app_export.dart';
// import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
// import 'package:daone/widgets/app_bar/appbar_subtitle.dart';
// import 'package:daone/widgets/app_bar/custom_app_bar.dart';
// import 'package:flutter/material.dart';
//
// // ignore_for_file: must_be_immutable
// class ViewAllTaskTabContainerScreen
//     extends GetWidget<ViewAllTaskTabContainerController> {
//   const ViewAllTaskTabContainerScreen({Key? key})
//       : super(
//           key: key,
//         );
//
//   @override
//   Widget build(BuildContext context) {
//     final ViewAllTaskTabContainerController controller1 =
//         Get.put(ViewAllTaskTabContainerController());
//     final CalendarController calenderController = Get.put(CalendarController());
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: CustomAppBar(
//           height: getVerticalSize(
//             79,
//           ),
//           leadingWidth: 72,
//           leading: AppbarIconbutton(
//             svgPath: ImageConstant.imgInfo,
//             margin: getMargin(
//               left: 24,
//               top: 4,
//               bottom: 4,
//             ),
//           ),
//           centerTitle: true,
//           title: AppbarSubtitle(
//             text: "lbl_tasks".tr,
//           ),
//         ),
//         body: SizedBox(
//           width: double.maxFinite,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [Expanded(
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     shrinkWrap: true,
//                     itemCount: calenderController.currentMonthList.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Padding(
//                           padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
//                           child: GetBuilder<CalendarController>(
//                             builder: (calender) {
//                               final DateTime date =
//                               calenderController.currentMonthList[index];
//                               final weekday = DateFormat.E().format(date);
//
//                               return GestureDetector(
//                                 onTap: () {
//
//                                   // Save the information from this container
//                                   // controller.savedContainerInfo[0] = controller.getMonthName(date.month);
//                                   // controller.savedContainerInfo[1] = date.day.toString();
//                                   // controller.savedContainerInfo[2] = weekday;
//                                 },
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Material(
//                                     color: Colors.white, // Use the methodtainer color
//                                     borderRadius: BorderRadius.circular(10.0),
//                                     elevation: 2,
//                                     child: Container(
//                                       width: Get.width * 0.12,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                      color: Colors.white,// Use the methodcontainer color
//                                       ),
//                                       child: Center(
//                                         child: Column(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                           children: <Widget>[
//                                             TextWidget(
//                                                 text:calenderController
//                                                     .getMonthName(date.month),
//                                                 color: Colors.black,
//                                                 fsize: 12),
//                                             TextWidget(
//                                                 text: date.day.toString(),
//                                                 color: Colors.black,
//                                                 fsize: 15,
//                                                 font: FontWeight.bold),
//                                             TextWidget(
//                                               text: weekday,
//                                               color: Colors.black,
//                                               fsize: 12,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ));
//                     },
//                   ),
//                 ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 18.0, horizontal: 2),
//                 child: SizedBox(
//                   height: Get.height * 0.04,
//                   width: Get.width,
//                   child: TabBar(
//                     controller: controller1.tabviewController,
//                     labelColor: appTheme.whiteA700,
//                     labelStyle: TextStyle(),
//                     unselectedLabelColor: appTheme.deepOrangeA20002,
//                     unselectedLabelStyle: TextStyle(),
//                     indicator: BoxDecoration(
//                       color: appTheme.deepOrangeA20002,
//                       borderRadius: BorderRadius.circular(50),
//                     ),
//                     tabs: [
//                       Tab(
//                         child: Text(
//                           "lbl_all".tr,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       Tab(
//                         child: Text(
//                           "lbl_to_do".tr,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       Tab(
//                         child: Text(
//                           "lbl_complete".tr,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: getVerticalSize(
//                   440,
//                 ),
//                 child: TabBarView(
//                   controller: controller1.tabviewController,
//                   children: [
//                     allTaskList(context),
//                     allTaskList(context),
//                     allTaskList(context),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
