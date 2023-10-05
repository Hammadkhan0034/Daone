import 'package:daone/widgets/text_widget.dart';

import 'controller/edit_affirmation_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:daone/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EditAffirmationDialog extends StatelessWidget {
  EditAffirmationDialog(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  EditAffirmationController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Container(
        width: getHorizontalSize(
          318,
        ),
        padding: getPadding(
          left: 24,
          top: 15,
          right: 24,
          bottom: 15,
        ),
        decoration: AppDecoration.fill.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder22,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Obx(() =>            Container(
              height: getVerticalSize(
                209,
              ),
              width: getHorizontalSize(
                269,
              ),
              margin: getMargin(
                top: 12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.cyan,
                image: DecorationImage(
                  image:
                  NetworkImage(controller.selectedBackground.value),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: getHorizontalSize(
                        219,
                      ),
                      margin: getMargin(
                        top: 30,
                      ),
                      child:Text(
                        controller.displayText.value,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ),
            CustomTextFormField(
              controller: controller.messageController,
              margin: getMargin(
                top: 34,
              ),
              contentPadding: getPadding(
                left: 5,
                right: 5,
              ),
              textStyle: CustomTextStyles.bodySmallGray9000310,
              hintText: "Write Your Affirmation Here",
              hintStyle: CustomTextStyles.bodySmallGray9000310,
              defaultBorderDecoration:
                  TextFormFieldStyleHelper.underLineGray30003,
              enabledBorderDecoration:
                  TextFormFieldStyleHelper.underLineGray30003,
              focusedBorderDecoration:
                  TextFormFieldStyleHelper.underLineGray30003,
              disabledBorderDecoration:
                  TextFormFieldStyleHelper.underLineGray30003,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your affirmation';
                }
                // Add any additional validation logic here if needed
                return null; // Return null if the input is valid
              },
            ),
            Padding(
              padding: getPadding(
                top: 26,
                right: 1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 5,
                      bottom: 3,
                    ),
                    child: Text(
                      "Choose background",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.bodySmallGray9000311_1,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.dialog(

                        AlertDialog(
                          title: Text("Choose a Background"),
                          content: Obx(
                                () => Expanded(
                              child: ListView.builder(
                                itemCount:
                                controller.availableBackgrounds.length,
                                itemBuilder: (context, index) {
                                  final background =
                                  controller.availableBackgrounds[index];
                                  return InkWell(
                                    onTap: () {
                                      controller.setSelectedBackground(
                                          background);
                                      Get.back();
                                    },
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text("Background ${index + 1}"),

                                        ),
                                        Container(
                                          height: Get.height * 0.05,
                                          width: Get.width * 0.5,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  controller.availableBackgrounds[
                                                  index],
                                                ),
                                                fit: BoxFit.cover),
                                                
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child:Obx(() => Container(
                      height:Get.height*0.027,
                      width: Get.width*0.4,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image:
                          NetworkImage(controller.selectedBackground.value),fit: BoxFit.cover),),
                    ),)
                  ),
                ],
              ),
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
                      bottom: 3,
                    ),
                    child: Text(
                      "lbl_from".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.bodySmallGray9000311_1,
                    ),
                  ),
                  Spacer(),
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
                  Padding(
                    padding: getPadding(
                      left: 12,
                      top: 5,
                      bottom: 5,
                    ),
                    child: Text(
                      "lbl_to".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.bodySmallGray9000310,
                    ),
                  ),
                  Container(
                    width: getHorizontalSize(
                      67,
                    ),
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
                    child: Obx(() => InkWell(
                      onTap: ()=> controller.selectTime2(context),
                      child: Text(
                        controller.selectedTime2.value.format(context),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.bodySmallGray9000311,
                      ),
                    ),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                top: 18,
              ),
              child: Obx(() =>
                  Container(
                child: Stack(
                  children:[ Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(
                            top: 12,
                            bottom: 14,
                          ),
                          child: TextWidget(text: "lbl_how_many2".tr,
                              color: Colors.black, fsize: 11)
                      ),
                      Expanded(
                          child: Slider(
                              min: 0.0,
                              max: 20,
                              label: controller.currentValue.value.toString(),
                              inactiveColor: Colors.deepOrangeAccent,
                              activeColor: Colors.deepOrange,
                              value:controller.currentValue.value, onChanged:(value){
                            controller.currentValue.value =value;
                          }),
                        ),
                    ],
                  ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextWidget(text: '${controller.currentValue.value.toInt().toString()}x', color:Colors.black,
                          fsize: 12),
                    ),
                  ],
                ),
              ),
              )
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: Get.width*0.2),
                TextWidget(text: '0', color:Colors.black, fsize: 12),
                SizedBox(width: Get.width*0.42),
                TextWidget(text: '20', color:Colors.black, fsize: 12),
              ],
            ),
            CustomElevatedButton(
              onTap: (){
            controller.OwnAffirmationList(context,controller.displayText.value,controller.selectedBackground.value, controller.selectedTime1.value.toString(),
                controller.selectedTime2.toString(), controller.currentValue.value.toInt());
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
      ),
    );
  }
}
