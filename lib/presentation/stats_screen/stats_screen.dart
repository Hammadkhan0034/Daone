import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import '../badges/badgeslist.dart';
import 'controller/stats_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  StatsController  statsController = Get.put(StatsController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    statsController.fetchOwnAffirmationsForWeek();
    statsController.fetchBlogReadForWeek();
    statsController.fetchDailyIntentionsVideosForWeek();
    statsController.fetchTasksCompleteForWeek();
    print('init stats');
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final user =FirebaseAuth.instance.currentUser!.email;
    CollectionReference weeklyProgressCollection = FirebaseFirestore.instance.collection('users').doc(user).
    collection('OwnAffirmationList');
    StatsController statsController =Get.put(StatsController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: double.maxFinite,
            padding: getPadding(
              left: 28,
              top: 43,
              right: 28,
              bottom: 43,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "lbl_daily_affirmations_progress".tr,
                      color: Colors.black,
                      fsize: 16,
                      font: FontWeight.w600,
                    ),
                    Container(
                      width: Get.width * 0.17,
                      height: Get.height * 0.044,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [Color(0xfff36430), Color(0xffff7e67)],
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                              text: "Daily", color: Colors.white, fsize: 12),
                          Image.asset(
                            ImageConstant.arrowDown2,
                            scale: 1.4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height*0.05),
                Row(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(25.921112060546875),
                      elevation: 5,
                      child: Container(
                        width: Get.width * 0.35,
                        height: Get.height * 0.16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.921112060546875),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: Get.width * 0.4,
                              height: Get.height * 0.08,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.04,
                                  ),

                                  StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(user)
                                          .collection('OwnAffirmationList')
                                          .snapshots(),
                                      builder:(context,AsyncSnapshot snapshot){
                                        return  TextWidget(
                                          text: snapshot.hasData
                                              ? snapshot
                                              .data.docs.length
                                              .toString()
                                              : "0",
                                          color: Colors.black,
                                          fsize: 50,
                                          font: FontWeight.w600,
                                        );}),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5,top:3.0),
                                    child: Image.asset(
                                      ImageConstant.group10110,
                                      scale: 3.8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.02,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Center(
                                child: TextWidget(
                                  text: "lbl_affirmation_completed".tr,
                                  color: Colors.black54,
                                  fsize: 12,
                                  font: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: Get.width*0.13),
                    Material(
                      borderRadius: BorderRadius.circular(25.921112060546875),
                      elevation: 5,
                      child: Container(
                        width: Get.width * 0.35,
                        height: Get.height * 0.16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.921112060546875),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width * 0.4,
                              height: Get.height * 0.08,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.03,
                                  ),
                                  StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(user)
                                          .collection('VideosUrl')
                                          .snapshots(),
                                      builder:(context,AsyncSnapshot snapshot){
                                        return  TextWidget(
                                          text: snapshot.hasData
                                              ? snapshot
                                              .data.docs.length
                                              .toString()
                                              : "0",
                                          color: Colors.black,
                                          fsize: 50,
                                          font: FontWeight.w600,
                                        );}),

                                  SizedBox(
                                    width: Get.width * 0.01,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Image.asset(
                                      ImageConstant.camIcon,
                                      scale: 3.8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.03,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Center(
                                child: TextWidget(
                                  text: "lbl_intentions_completed".tr,
                                  color: Colors.black54,
                                  fsize: 12,
                                  font: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height*0.05),
                Row(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(25.921112060546875),
                      elevation: 5,
                      child: Container(
                        width: Get.width * 0.35,
                        height: Get.height * 0.16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.921112060546875),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width * 0.4,
                              height: Get.height * 0.08,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.04,
                                  ),
                                  StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(user)
                                          .collection('tasks')
                                          .snapshots(),
                                      builder:(context,AsyncSnapshot snapshot){
                                        return  TextWidget(
                                          text: snapshot.hasData
                                              ? snapshot
                                              .data.docs.length
                                              .toString()
                                              : "0",
                                          color: Colors.black,
                                          fsize: 50,
                                          font: FontWeight.w600,
                                        );}),
                                  Padding(
                                    padding: const EdgeInsets.only(left:3,top:8.0),
                                    child: Image.asset(
                                      ImageConstant.group10111,
                                      scale: 3.8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.02,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Center(
                                child: TextWidget(
                                  text: "lbl_tasks_completed".tr,
                                  color: Colors.black54,
                                  fsize: 12,
                                  font: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: Get.width*0.13),
                    Material(
                      borderRadius: BorderRadius.circular(25.921112060546875),
                      elevation: 5,
                      child: Container(
                        width: Get.width * 0.35,
                        height: Get.height * 0.16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.921112060546875),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width * 0.4,
                              height: Get.height * 0.08,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.03,
                                  ),
                                  StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(user)
                                          .collection('blogReadList')
                                          .snapshots(),
                                      builder:(context,AsyncSnapshot snapshot){
                                        return  TextWidget(
                                          text: snapshot.hasData
                                              ? snapshot
                                              .data.docs.length
                                              .toString()
                                              : "0",
                                          color: Colors.black,
                                          fsize: 50,
                                          font: FontWeight.w600,
                                        );}),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8,left: 5,right: 5),
                                    child: Image.asset(
                                      ImageConstant.msgIcon,
                                      scale: 3.8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Center(
                                child: TextWidget(
                                  text: "lbl_blog_read".tr,
                                  color: Colors.black54,
                                  fsize: 12,
                                  font: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: TextWidget(
                    text: "lbl_week_badges".tr,
                    color: Colors.black,
                    fsize: 16,
                    font: FontWeight.w600,
                  ),
                ),
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
                      int itemCount = (data / 100).ceil(); // Calculate the number of items to display

                      return Material(
                        color: Colors.white,
                        elevation: 2,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: double.infinity,
                          height: Get.height*0.13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
//                            color: Colors.teal,

                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal, // Set the scroll direction to horizontal
                            itemCount: itemCount,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: Get.width * 0.23,
                                  height: Get.height * 0.2,

                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage(badges[index % badges.length])),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                  child: TextWidget(text: 'Weekly Improvement Graph', color: Colors.black, fsize: 17,
                      font: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                      aspectRatio: 1.9,
                      child: ChartWidget()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class ChartWidget extends GetView<StatsController> {
  @override
  Widget build(BuildContext context) {
    StatsController statsController = Get.put(StatsController());
    return Obx(() {
      return LineChart(
        LineChartData(
          gridData: FlGridData(
            horizontalInterval: 1,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.black12,
                strokeWidth: 1,
              );
            },
            drawHorizontalLine: true,
            drawVerticalLine: false,
          ),
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.deepOrange,
              getTooltipItems: (List<LineBarSpot> touchedSpots) {
                List<LineTooltipItem> items = [];

                touchedSpots.forEach((LineBarSpot touchedSpot) {
                  items.add(LineTooltipItem(
                    'Value: ${touchedSpot.y.toStringAsFixed(2)}',
                    TextStyle(color: Colors.white),
                  ));
                });

                return items;
              },
            ),
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(),
            topTitles: AxisTitles(),
            leftTitles: AxisTitles(),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1,
                getTitlesWidget: rightTitleWidgets,
              ),
            ),
          ),
          borderData: FlBorderData(
            border: Border(bottom: BorderSide(color: Colors.black12), right: BorderSide(color: Colors.black12)),
          ),
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: statsController.weeklyData.reduce((value, element) => value > element ? value : element) + 3.0,
          lineBarsData: [
            LineChartBarData(
              spots: statsController.intentionWeeklyData
                  .asMap()
                  .entries
                  .map((entry) => FlSpot(entry.key.toDouble(), entry.value.toDouble()))
                  .toList(),
              isCurved: true,
              color: Colors.blue, // Set the color for the 'intentionWeeklyData' line
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
              barWidth: 3,
            ),
            LineChartBarData(
              spots: statsController.taskWeeklyData
                  .asMap()
                  .entries
                  .map((entry) => FlSpot(entry.key.toDouble(), entry.value.toDouble()))
                  .toList(),
              isCurved: true,
              color: Colors.purple, // Set the color for the 'taskWeeklyData' line
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
              barWidth: 3,
            ),
            LineChartBarData(
              spots: statsController.blogsWeeklyData
                  .asMap()
                  .entries
                  .map((entry) => FlSpot(entry.key.toDouble(), entry.value.toDouble()))
                  .toList(),
              isCurved: true,
              color: Colors.pink,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
              barWidth: 3,
            ),
            LineChartBarData(
              spots: statsController.weeklyData
                  .asMap()
                  .entries
                  .map((entry) => FlSpot(entry.key.toDouble(), entry.value.toDouble()))
                  .toList(),
              isCurved: true,
              color: Colors.deepOrange,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
              barWidth: 3,
            ),
          ],
        ),
      );
    });
  }

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('1%', style: style);
        break;
      case 2:
        text = const Text('2%', style: style);
        break;
      case 3:
        text = const Text('3%', style: style);
        break;
      case 4:
        text = const Text('4%', style: style);
        break;
        case 5:
        text = const Text('5%', style: style);
        break;
        case 10:
        text = const Text('10%', style: style);
        break;
        case 20:
        text = const Text('20%', style: style);
        break;
        case 30:
        text = const Text('30%', style: style);
        break;
        case 40:
        text = const Text('40%', style: style);
        break;
        case 50:
        text = const Text('50%', style: style);
        break;

      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }
}
