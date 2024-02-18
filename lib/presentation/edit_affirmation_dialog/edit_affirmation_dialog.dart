import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/widgets/text_widget.dart';

import '../own_affirmation_screen/own_affirmation_model.dart';
import 'controller/edit_affirmation_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:daone/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EditAffirmationScreen extends StatelessWidget {
  OwnAffirmationModel? ownAffirmationModel;
  EditAffirmationScreen(
    {
      this.ownAffirmationModel,
    Key? key,
  }) : super(
          key: key,
        ){
    controller=Get.put(EditAffirmationController());
    if(ownAffirmationModel!=null){
      controller.selectedBackground.value=ownAffirmationModel!.imageUrl;
      controller.displayText.value=ownAffirmationModel!.affirmation;
      controller.messageController.text=ownAffirmationModel!.affirmation;
      controller.selectedTime1.value=ownAffirmationModel!.dateStart;
      controller.selectedTime2.value=ownAffirmationModel!.dateEnd;
    }
  }

  late EditAffirmationController controller ;

  @override
  Widget build(BuildContext context) {

    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      appBar:AppBar(
        leading: InkWell(
          onTap: Get.back,
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.deepOrange,
          ),
        ),
        title: TextWidget(text: ownAffirmationModel==null?'Create Affirmation':'Edit Affirmation', color: Colors.black, fsize: 20),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(() =>            Container(
              height: getVerticalSize(
                209,
              ),
              width: Get.width,
              margin: getMargin(
                top: 12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black12,
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
                      Get.bottomSheet(
                        Obx(
                              () => Container(
                            height: Get.height,
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)

                            ),
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(width: 60,height: 5,
                                    margin: const EdgeInsets.only(top: 20),

                                    decoration: BoxDecoration(color: Colors.grey,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                  Container(

                                    margin: const EdgeInsets.only(top: 10, bottom:10,left: 10),
                                    child: TextWidget(text: "Choose Your  Background Image",fsize: 18,),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  Expanded(
                                    child: GridView.builder(
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3, // Number of columns
                                      ),
                                      itemCount:
                                      controller.availableBackgrounds.length,
                                      itemBuilder: (context, index) {
                                        final background =
                                        controller.availableBackgrounds[index];
                                        return InkWell(
                                          onTap: () {
                                            controller
                                                .setSelectedBackground(background);
                                            Get.back();
                                          },
                                          child: CachedNetworkImage(
                                            imageUrl:
                                            background, // Replace newBackgroundURL with the new image URL
                                            imageBuilder: (context, imageProvider) =>
                                                Container(
                                                  // height: Get.width * 0.3,
                                                  // width: Get.width * 0.3,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                            placeholder: (context, url) => Center(
                                                child: CircularProgressIndicator(
                                                  color: Colors.deepOrange,
                                                )), // You can customize the placeholder
                                            errorWidget: (context, url, error) =>
                                                Icon(Icons.error),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );




                      // Get.dialog(
                      //   Material(
                      //     type: MaterialType.transparency,
                      //     child: Center(
                      //       child: Container(
                      //         // margin: EdgeInsets.all(20),
                      //         // padding: EdgeInsets.all(16),
                      //         width: double.infinity,
                      //         decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           borderRadius: BorderRadius.circular(10),
                      //         ),
                      //         child: Column(
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: [
                      //             Text("Choose a Background"),
                      //             SizedBox(height: 10),
                      //             Obx(
                      //                   () => Expanded(
                      //                 child: GridView.builder(
                      //                   itemCount: controller.availableBackgrounds.length,
                      //                   itemBuilder: (context, index) {
                      //                     final background = controller.availableBackgrounds[index];
                      //                     return InkWell(
                      //                       onTap: () {
                      //                         controller.setSelectedBackground(background);
                      //                         Get.back();
                      //                       },
                      //                       child: Container(
                      //                         height: Get.height * 0.2,
                      //                         width: Get.width * 0.5,
                      //                         padding: EdgeInsets.symmetric(vertical: 10),
                      //                         decoration: BoxDecoration(
                      //                           borderRadius: BorderRadius.circular(12),
                      //                         ),
                      //                         child: ClipRRect(
                      //                           borderRadius: BorderRadius.circular(12),
                      //                           child: CachedNetworkImage(
                      //                             imageUrl: controller.availableBackgrounds[index],
                      //                             imageBuilder: (context, imageProvider) => Container(
                      //                               height: Get.height * 0.13,
                      //                               width: Get.width * 0.3,
                      //                               decoration: BoxDecoration(
                      //                                 borderRadius: BorderRadius.circular(12),
                      //                                 image: DecorationImage(
                      //                                   image: imageProvider,
                      //                                   fit: BoxFit.cover,
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                             placeholder: (context, url) => Center(
                      //                               child: CircularProgressIndicator(
                      //                                 color: Colors.deepOrange,
                      //                               ),
                      //                             ),
                      //                             errorWidget: (context, url, error) => Icon(Icons.error),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     );
                      //                   },
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // );















                      //old
                      // Get.dialog(
                      //
                      //   AlertDialog(
                      //     title: Text("Choose a Background"),
                      //     content: Obx(
                      //           () => FractionallySizedBox(
                      //             widthFactor: 1.0,
                      //             child: Expanded(
                      //                                           child: ListView.builder(
                      //             itemCount:
                      //             controller.availableBackgrounds.length,
                      //             itemBuilder: (context, index) {
                      //               final background =
                      //               controller.availableBackgrounds[index];
                      //               return InkWell(
                      //                 onTap: () {
                      //                   controller.setSelectedBackground(
                      //                       background);
                      //                   Get.back();
                      //                 },
                      //                 child: Container(
                      //                   height: Get.height * 0.2,
                      //                   width: Get.width * 0.5,
                      //                   padding: EdgeInsets.symmetric(vertical: 10),
                      //                   decoration: BoxDecoration(
                      //                     //color: Colors.blue,
                      //                     borderRadius: BorderRadius.circular(12),
                      //                     // image: DecorationImage(
                      //                     //     image: NetworkImage(
                      //                     //       controller.availableBackgrounds[
                      //                     //       index],
                      //                     //     ),
                      //                       //  fit: BoxFit.cover),
                      //                   ),
                      //                   child:ClipRRect(
                      //                     borderRadius: BorderRadius.circular(12),
                      //                     child: CachedNetworkImage(
                      //                       imageUrl: controller.availableBackgrounds[
                      //                       index],
                      //                       imageBuilder: (context, imageProvider) => Container(
                      //                         height: Get.height * 0.13,
                      //                         width: Get.width * 0.3,
                      //                         decoration: BoxDecoration(
                      //                           borderRadius: BorderRadius.circular(12),
                      //                           image: DecorationImage(
                      //                             image: imageProvider,
                      //                             fit: BoxFit.cover,
                      //                           ),
                      //                         ),
                      //                       ),
                      //                       placeholder: (context, url) => Center(child:
                      //                       CircularProgressIndicator(color: Colors.deepOrange,)), // You can customize the placeholder
                      //                       errorWidget: (context, url, error) => Icon(Icons.error),
                      //                     ),
                      //                   ),
                      //
                      //                 ),
                      //               );
                      //             },
                      //                                           ),
                      //                                         ),
                      //           ),
                      //     ),
                      //   ),
                      // );
                    },
                    child:Obx(() => Container(
                      height:Get.height*0.027,
                      width: Get.width*0.4,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image:
                          NetworkImage(controller.selectedBackground.value),fit: BoxFit.cover),),
                   child: controller.selectedBackground.value == "" ?
            Center(child: TextWidget(fsize: 10,color: Colors.white,text: "Add Background")): null,
                    ),
                    )
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
                Timestamp timeStamp=ownAffirmationModel==null?Timestamp.now():ownAffirmationModel!.date;

            controller.OwnAffirmationList(context,controller.displayText.value,controller.selectedBackground.value, controller.selectedTime1.value,
                controller.selectedTime2.value, timeStamp,controller.currentValue.value.toInt());
              },
              width: getHorizontalSize(
                252,
              ),
              height: getVerticalSize(
                45,
              ),
              text: ownAffirmationModel==null? "lbl_save".tr:"Update",
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
