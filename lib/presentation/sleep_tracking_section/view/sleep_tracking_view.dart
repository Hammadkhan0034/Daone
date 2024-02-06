

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/sleep_tracking_section/controller/sleep_tracking_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../widgets/app_bar/appbar_iconbutton.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/text_widget.dart';
import '../get_dialogue_of_sleep.dart';
import '../sleep_widget.dart';

class SleepTrackingView extends StatefulWidget {
  const SleepTrackingView({Key? key}) : super(key: key);

  @override
  State<SleepTrackingView> createState() => _SleepTrackingViewState();
}

class _SleepTrackingViewState extends State<SleepTrackingView> {
  SleepTrackingController sleepTrackingController =Get.put(SleepTrackingController());

  @override
  void initState() {
    super.initState();
    sleepTrackingController.getPreviousWeekdayValue();
    sleepTrackingController.getBarGroupsData();
    sleepTrackingController.fetchBarGroups();

  }


  @override
  Widget build(BuildContext context) {


    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('users').doc(sleepTrackingController.user!.email).collection('sleepData').get(),
        builder:(context,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
                body:  Center(
              child: Container(
                  height: 50, width: 50,
                  child: CircularProgressIndicator(color: Colors.deepOrange,)),
            )
            );
          } else if (snapshot.hasError) {
            return TextWidget(text: "Error", color: Colors.red, fsize: 17);
            return Text('Error: ${snapshot.error}');
          }else if (!snapshot.hasData || snapshot.data!.docs.isEmpty){
           return Scaffold(
             body:Container(
             height: double.infinity,
             width: double.infinity,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 15.0),
                   child: Image.asset("assets/images/2 (1).png",scale: 1,),
                 ),
                 SizedBox(height: Get.height*0.06,),
                 InkWell(
                   onTap: (){
                     Get.offAndToNamed(AppRoutes.sleepTrackerScreen);
                   },
                   child: Container(
                     height: Get.height*0.07,
                     width: Get.width*0.8,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15),
                         color: Colors.deepOrange),
                     child: Center(child: TextWidget(text: "Track Your Sleep with Daone",color: Colors.white,fsize: 15)),

                   ),
                 ),
               ],
             ),
           ),);
          }
          else {
            return FutureBuilder(
                future: FirebaseFirestore.instance.collection('users').doc(sleepTrackingController.user!.email)
                    .collection('sleepData').doc('week').get(),
                builder: (context,AsyncSnapshot<DocumentSnapshot> snapshot2){
                  if (snapshot2.connectionState == ConnectionState.waiting) {
                    return Scaffold(body: Center(
                      child: Container(
                          height: 50, width: 50,
                          child: CircularProgressIndicator(color: Colors.deepOrange,)),
                    ));
                  }
                  final sleepData = snapshot2.data;
                  if (sleepData == null) {
                    // Handle the case where sleepData is null
                    return Text('Sleep data is null');
                  }else
                 final sleepData=snapshot2.data!;
                 final data = snapshot2.data!.data() as Map<String, dynamic>;
                 final todayData = data[sleepTrackingController.currentDayOfWeek.value.toString()]; // Access data for Friday
                 final startTime = todayData['start_time'];
                 final duration = todayData['duration'];


                  return Scaffold(
                appBar: CustomAppBar(
                  height: getVerticalSize(
                    69,
                  ),
                  leadingWidth: 78,
                  leading: AppbarIconbutton(
                    onTap: (){
                      Get.offAndToNamed(AppRoutes.dashboardRoute);
                    },

                    svgPath: ImageConstant.imgInfo,
                    margin: getMargin(
                      left: 30,
                      top: 10,
                      bottom: 5,
                    ),
                  ),
                  centerTitle: true,
                  title:TextWidget(text:"lbl_sleep_tracker".tr, color:Colors.black, fsize: 18,font:FontWeight.bold),
                ),
                floatingActionButton:InkWell(
                    onTap: (){
                      Get.dialog(
                        AlertDialog(
                          backgroundColor: Colors.transparent,
                          contentPadding: EdgeInsets.zero,
                          insetPadding: const EdgeInsets.only(left: 0),
                          content:SleepDialogue(),
                        ),
                      );
                    },
                    child: sleepFloatingButton()),
                body: GetBuilder<SleepTrackingController>(
                  init: SleepTrackingController(), // Initialize GetX controller
                  builder: (controller) {
                    return  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Get.height*0.025,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextWidget(text: "${sleepTrackingController.currentDayOfWeek} Analysis", color: Colors.black, fsize: 18),
                        ),
                        SizedBox(height: Get.height*0.025,),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              height: Get.height*0.09,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 15),
                                    child: Image.asset("assets/images/bed.png",scale: 1.5),
                                  ),
                                  SizedBox(width: Get.width*0.06,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              TextWidget(text: "${sleepTrackingController.currentDayOfWeek} Bedtime, ", color:Colors.black, fsize:12,font: FontWeight.w600),
                                              TextWidget(text:startTime.toString(), color:Colors.black, fsize:12),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              TextWidget(text: "Duration ", color:Colors.black, fsize:12,font: FontWeight.w600),
                                              TextWidget(text: '${duration.toString()} Hours', color:Colors.black, fsize:14),
                                            ],
                                          ),

                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height*0.01,),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              height: Get.height*0.09,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 15),
                                    child: Image.asset("assets/images/alarm-clock.png",scale: 2.4),
                                  ),
                                  SizedBox(width: Get.width*0.06,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              TextWidget(text: "Wake-up Time, ", color:Colors.black, fsize:12,font: FontWeight.w600),
                                              TextWidget(text: todayData['end_time'].toString(), color:Colors.black, fsize:12),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              TextWidget(text: "Sleep Quality: ", color:Colors.black, fsize:12,font: FontWeight.w600),
                                              TextWidget(text: todayData['quality'], color:Colors.black, fsize:12),
                                            ],
                                          ),

                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height*0.07,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextWidget(text: "Sleep Analysis", color: Colors.black, fsize: 18),
                        ),
                        SizedBox(height: Get.height*0.03,),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(13),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: AspectRatio(
                                aspectRatio: 1.9,
                                child: _BarChart(),
                              ),
                            ),
                          ),
                        ),

                      ],
                    );
                  },
                ),
              );
            });
          }
        });}}

class _BarChart extends StatelessWidget {
  const _BarChart();


  @override
  Widget build(BuildContext context) {
    SleepTrackingController controller = Get.find<SleepTrackingController>();
    return BarChart(
      BarChartData(
        barTouchData: BarTouchData(
          enabled: false,
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.transparent,
            tooltipPadding: EdgeInsets.zero,
            tooltipMargin: 8,
            getTooltipItem: (BarChartGroupData group,
                int groupIndex,
                BarChartRodData rod,
                int rodIndex,) {
              return BarTooltipItem(
                rod.toY.round().toString() + "hr",
                const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: getTitles,
            ),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        barGroups: controller.barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      ),
    );
  }


  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tue';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thu';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

}