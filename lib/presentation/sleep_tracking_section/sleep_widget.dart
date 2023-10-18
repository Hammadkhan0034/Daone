

import 'package:daone/core/app_export.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

Widget sleepFloatingButton(){
  return Container(
    decoration: BoxDecoration(
      color: Colors.deepOrange,
      borderRadius: BorderRadius.circular(100),
    ),
    height: Get.height*0.07,
    width: Get.width*0.14,
    child: Center(child: Icon(Icons.add,color: Colors.white),),
  );
}


