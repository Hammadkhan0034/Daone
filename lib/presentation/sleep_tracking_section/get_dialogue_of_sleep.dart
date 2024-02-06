


import 'package:daone/presentation/sleep_tracking_section/controller/sleep_tracking_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/text_widget.dart';
import 'model/model.dart';

class SleepDialogue extends StatelessWidget {
  const SleepDialogue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SleepTrackingController controller =Get.put(SleepTrackingController());
    return Container(
      height: Get.height*0.7,
      width: Get.width*0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextWidget(text: "Add Sleep", color:Colors.black, fsize: 18,font: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Image.asset("assets/images/2 (1).png",scale: 2,),
          ),
          Padding(
            padding: getPadding(
              top: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: getPadding(
                    top: 5,
                    bottom: 0,
                    right: 5
                  ),
                  child: TextWidget(text:  "lbl_from".tr,color: Colors.black,fsize: 14,),
                ),
                SizedBox(
                  width: Get.width*0.004,
                ),
                Container(
                  width: getHorizontalSize(
                    80,
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
                        child: Center(
                          child: Text(
                             controller.selectedTime1.value.format(context),
                             overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.bodySmallGray9000311,
                          ),
                        ),
                      ),),
                  ),
                Padding(
                  padding: getPadding(
                    left: 12,
                    top: 5,
                    bottom: 0,
                  ),
                  child: TextWidget(text:"to",color: Colors.black,fsize: 13,),
                ),
                Container(
                  width: getHorizontalSize(
                    85,
                  ),
                  height: Get.height*0.03,
                  margin: getMargin(
                    left: 12,
                  ),
                  padding: getPadding(
                    left: 7,
                    top: 2,
                    right: 7,
                    bottom: 2,
                  ),
                  decoration: AppDecoration.txtOutline1.copyWith(
                    borderRadius: BorderRadiusStyle.txtRoundedBorder3,
                  ),
                  child:Obx(() =>InkWell(
                    onTap: ()=> controller.selectTime2(context),
                    child: Center(
                      child: Text(
                         controller.selectedTime2.value.format(context),
                         overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.bodySmallGray9000311,
                      ),
                    ),
                  ), ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Obx(() {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: TextWidget(text:"Select Weekday",color: Colors.black,fsize: 13,),
                ),
                DropdownButton<String>(
                  value: controller.selectedWeekday.value,
                  onChanged: (String? weekday) {
                    controller.setSelectedWeekday(weekday!);
                  },
                  items: [
                    'Monday',
                    'Tuesday',
                    'Wednesday',
                    'Thursday',
                    'Friday',
                    'Saturday',
                    'Sunday',
                  ].map((String weekday) {
                    return DropdownMenuItem<String>(
                      value: weekday,
                      child:TextWidget(text:weekday,color: Colors.black,fsize: 13,),
                    );
                  }).toList(),
                ),
              ],
            );
          }),
          Obx(() {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: TextWidget(text:"Sleep Quality",color: Colors.black,fsize: 13,),
                ),
                DropdownButton<String>(
                  value: controller.selectSleepQuality.value,
                  onChanged: (String? sleepQuality) {
                    controller.getSleepQuality(sleepQuality!);
                  },
                  items: [
                    'Fair',
                    'Good',
                    'Excellent',
                  ].map((String weekday) {
                    return DropdownMenuItem<String>(
                      value: weekday,
                      child:TextWidget(text:weekday,color: Colors.black,fsize: 13,),
                    );
                  }).toList(),
                ),
              ],
            );
          }),
    SizedBox(height: Get.height*0.02,),
    Obx(() {
      final sleepTimeOfDay = controller.selectedTime1.value;
      final wakeupTimeOfDay = controller.selectedTime2.value;

      // Convert TimeOfDay to DateTime with the current date
      final sleepTime = controller.convertTimeOfDayToDateTime(sleepTimeOfDay);
      final wakeupTime = controller.convertTimeOfDayToDateTime(wakeupTimeOfDay);

      final sleepingHours = controller.calculateSleepingHours(sleepTime, wakeupTime);
    return TextWidget(
    text: "Sleeping Hours:       ${sleepingHours.inHours} hours ${sleepingHours.inMinutes.remainder(60)} minutes",
    color: Colors.black,
    fsize: 13,
    );
    }),
          SizedBox(height: Get.height*0.02,),
          CustomElevatedButton(
            onTap: () async {

              final TimeOfDay sleepStartTime = controller.selectedTime1.value;
              final TimeOfDay sleepEndTime = controller.selectedTime2.value;

              String formattedSleepStartTime = DateFormat("h:mm a").format(DateTime(2023, 1, 1, sleepStartTime.hour, sleepStartTime.minute));
              String formattedSleepEndTime = DateFormat("h:mm a").format(DateTime(2023, 1, 1, sleepEndTime.hour, sleepEndTime.minute));




              final String selectedWeekday = controller.selectedWeekday.value;

              final sleepTimeOfDay = controller.selectedTime1.value;
              final wakeupTimeOfDay = controller.selectedTime2.value;

              final sleepTime = controller.convertTimeOfDayToDateTime(sleepTimeOfDay);
              final wakeupTime = controller.convertTimeOfDayToDateTime(wakeupTimeOfDay);

              // Create a map with the updated data
              final Map<String, dynamic> updatedData = {
                'start_time': formattedSleepStartTime,
                'end_time': formattedSleepEndTime,
                'duration':controller.calculateSleepingHours(sleepTime, wakeupTime).inHours,
                'quality':controller.selectSleepQuality.value,
              };

              await controller.updateDayData(selectedWeekday, updatedData);
              Center(
                child: Container(
                    width: 50,height: 50,
                    child: CircularProgressIndicator()),
              );
              // Close the dialog
              Get.offAndToNamed(AppRoutes.dashboardRoute);
            },
            width: getHorizontalSize(
              252,
            ),
            height: getVerticalSize(
              45,
            ),
            text: "lbl_save".tr,
            margin: getMargin(
              left: 15,
              top: 19,
              right: 2,
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
    );
  }
}
