import 'package:alarm/alarm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/select_task_screen/Alarm/AlarmController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../widgets/app_bar/appbar_iconbutton.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/text_widget.dart';
import '../models/select_task_model.dart';

class AlarmView extends StatefulWidget {
  const AlarmView({Key? key}) : super(key: key);

  @override
  State<AlarmView> createState() => _AlarmViewState();
}

class _AlarmViewState extends State<AlarmView> {
  AlarmController controller =Get.put(AlarmController());


  @override
  initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final user =FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: TextWidget(text: 'Alarm',fsize: 20,color: Colors.black,font: FontWeight.w700,),
        height: getVerticalSize(79),
        leadingWidth: 72,
        leading: AppbarIconbutton(
          onTap: () {
            Get.back();
          },
          svgPath: ImageConstant.imgInfo,
          margin: getMargin(left: 24, top: 4, bottom: 4),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          Get.defaultDialog(
            title: "Alarm",
                content:   Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: Container(
                          width:Get.width*0.5,
                          height: 30,
                          padding: getPadding(
                            left: 6,
                            top: 3,
                            right: 6,
                            bottom: 3,
                          ),
                          decoration: AppDecoration.txtOutline1.copyWith(
                            borderRadius: BorderRadiusStyle.txtRoundedBorder3,
                          ),
                          child:
                          Form(
                            key: _formKey,
                            child: TextFormField(
                              cursorColor: Colors.deepOrange,
                              controller: controller.alarmController,
                              obscureText: false,
                              autofocus: false,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: false,
                                hintText: 'Title',
                                hintStyle: TextStyle(fontSize: 12),
                                // Remove the blue underline
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a title'; // Return an error message if the title is empty
                                }
                                return null; // Return null if the title is valid
                              },
                            ),
                          ),

                        ),
                      ),
                      Container(
                        width: Get.width*0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(text:"Select Time",color: Colors.black,fsize: 13,),
                            Container(
                              width: getHorizontalSize(
                                67,
                              ),
                              padding: getPadding(
                                left: 6,
                                top: 3,
                                right: 6,
                                bottom: 3,
                              ),
                              decoration: AppDecoration.txtOutline1.copyWith(
                                borderRadius: BorderRadiusStyle.txtRoundedBorder3,
                              ),
                              child:Obx(() =>
                                  InkWell(
                                    onTap: () => controller.selectTime1(context),
                                    child: Text(
                                      controller.selectedTime1.value.format(context),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles.bodySmallGray9000311,
                                    ),
                                  ),

                              ),),
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height*0.02,),
                      CustomElevatedButton(
                        onTap: ()async {
                          TimeOfDay timeOfDay = controller.selectedTime1.value;
                          DateTime now = DateTime.now();
                          DateTime dateTime = DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
                          final id =controller.selectRandomNumber(controller.numbers);

                          await Alarm.set(alarmSettings: AlarmSettings(
                              id: id, dateTime:dateTime,
                              assetAudioPath: 'assets/sugar.mp3',
                              notificationBody: "Click here to Stop Alarm",
                              notificationTitle: controller.alarmController.text,
                              enableNotificationOnKill: true,
                              vibrate: true,
                              volumeMax: true,
                              stopOnNotificationOpen:true,
                              androidFullScreenIntent: true
                          ));

                          if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                            // Form is valid, proceed to save the alarm
                            TimeOfDay timeOfDay = controller.selectedTime1.value;
                            DateTime now = DateTime.now();
                            DateTime dateTime = DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
                            AlarmModel alarm = AlarmModel(
                              title: controller.alarmController.text,
                              dateTime: dateTime,
                            );

                            controller.saveAlarmToFirestore(controller.alarmController.text, dateTime,id);

                            Get.back();
                          }
                        },
                        width: getHorizontalSize(
                          150,
                        ),
                        height: getVerticalSize(
                          45,
                        ),
                        text: "lbl_save".tr,
                        margin: getMargin(
                            left: 10,
                            top: 10,
                            right: 10,
                            bottom: 10
                        ),
                        buttonStyle: CustomButtonStyles.outlineIndigoA1004cTL22.copyWith(
                            fixedSize: MaterialStateProperty.all<Size>(Size(
                              double.maxFinite,
                              getVerticalSize(
                                45,
                              ),
                            ))),
                        decoration: CustomButtonStyles.outlineIndigoA1004cTL22Decoration,
                        buttonTextStyle: CustomTextStyles.labelLargeWhiteA700_1,
                      ),
                    ],
                  ),
                ),
          );
        },
        child: Icon(
    Icons.alarm
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream:FirebaseFirestore.instance
                    .collection("users")
                    .doc(user?.email)
                    .collection('Alarm')
                    .snapshots(),
                builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Loading indicator while data is being fetched
                    return Center(
                      child: Container(
                          height: 100,
                          width: 100,
                          child: CircularProgressIndicator(
                            color: Colors.deepOrangeAccent,
                          )),
                    );
                  }

                  if (snapshot.hasError) {
                    // Handle errors here
                    return Text('Error: ${snapshot.error}');
                  }

                  // Check if there are no tasks
                  if (snapshot.data!.docs.isEmpty) {
                    return Container(
                      height: Get.height * 0.8,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: Get.height * 0.08),
                          Center(
                            child: Image.asset(
                              'assets/images/Sheets.png',
                              scale: 2,
                            ),
                          ),
                          SizedBox(height: Get.height * 0.04),
                          TextWidget(
                            text: "You don't have any Alarm",
                            color: Colors.black38,
                            fsize: 16,
                            font: FontWeight.w500,
                          ),
                        ],
                      ),
                    );
                  }
              return Container(
                height: Get.height*0.76,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                    itemBuilder:(context,index){
                      final alarmData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                      final alarmTitle = alarmData['title'].toString();
                      final alarmTime = alarmData['dateTime'].toDate();
                      final alarmid = alarmData['id'];
                      final formattedTime = DateFormat.jm().format(alarmTime);
                      final documentId = snapshot.data!.docs[index].id; // Get the document ID here



                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              child: Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  height: Get.height*0.09,
                                  width: Get.width*0.8,
                                  decoration: BoxDecoration(
                                    //color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(width: Get.width*0.02,),
                                        Image.asset('assets/images/alarm-clock.png',scale: 2.5,),
                                        SizedBox(width: Get.width*0.01,),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(child: TextWidget(text: alarmTitle, color: Colors.black, fsize: 20)),
                                              TextWidget(text: formattedTime, color: Colors.black, fsize: 12),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: Get.width*0.1,),
                                        InkWell(
                                            onTap: (){
                                              Get.defaultDialog(title:"Delete ?",
                                                content:Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap:(){
                                                        controller.deleteAlarm(documentId);
                                                        Alarm.stop(alarmid);
                                                        Get.back();
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
                                            child: Icon(Icons.delete_outline,size: 28,color: Colors.deepOrange,)),
                                          SizedBox(width: Get.width*0.02,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    } ),
              );
            }),
            // InkWell(
            //   onTap: ()async{
            //     await Alarm.stop(42);
            //   },
            //   child: Container(
            //     width: Get.width*0.16,height:Get.height*0.08,
            //     decoration: BoxDecoration(
            //       color: Colors.deepOrange,
            //          borderRadius: BorderRadius.circular(100),
            //     ),
            //     child: Center(child:TextWidget(text: "Stop",fsize: 14,color: Colors.white,)),
            //   ),
            // ),


          ],
        ),
      ),

    );
  }
}
