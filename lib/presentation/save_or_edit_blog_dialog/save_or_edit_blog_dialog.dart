import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/text_widget.dart';
import 'colorPickerClass.dart';
import 'controller/save_or_edit_blog_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SaveOrEditBlogScreen extends StatelessWidget {
  SaveOrEditBlogController controller;
  String? copyText, title, fontName;

  SaveOrEditBlogScreen(
      {required this.controller,
      required this.copyText,
      required this.title,
      required this.fontName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:InkWell(
          onTap: Get.back,
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.deepOrange,
          ),
        ),
        title: TextWidget(text: 'Create Image', color: Colors.black, fsize: 24),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: getPadding(left: 20, top: 22, right: 20, bottom: 22),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: getVerticalSize(209),
                width: Get.width,
                margin: getMargin(left: 2, top: 6),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Obx(
                      () => Container(
                        height: getVerticalSize(209),
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(15),
                          ),
                          image: controller.selectedBackground.value != ''
                              ? DecorationImage(
                                  image: NetworkImage(
                                    controller.selectedBackground.value,
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Text(
                              copyText!,
                              style: GoogleFonts.getFont(
                                controller.selectedFontFamily.value,
                                fontSize: controller.selectedFontSize.value,
                                color: Color(int.parse(
                                    '0xFF${controller.selectedTextColor.value.substring(1)}')),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Obx(
                () => ColorPickerButton(
                  color: Color(int.parse(
                      '0xFF${controller.selectedTextColor.value.substring(1)}')),
                  onColorChanged: (color) {
                    controller.updateSelectedTextColor(color);
                  },
                ),
              ),
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextWidget(
                          text: 'Font Family',
                          color: Colors.white,
                          fsize: 12,
                        ),
                      )),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: DropdownButton<String>(
                        value: controller.selectedFontFamily.value,
                        onChanged: (value) {
                          controller.updateSelectedFontFamily(value!);
                        },
                        items: controller.fontFamilies.map((String fontFamily) {
                          return DropdownMenuItem<String>(
                            value: fontFamily,
                            child: TextWidget(
                                text: fontFamily,
                                color: Colors.black,
                                fsize: 12),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextWidget(
                          text: 'Font Size',
                          color: Colors.white,
                          fsize: 12,
                        ),
                      )),
                  Obx(
                    () => Container(
                      width: Get.width * 0.4,
                      child: Slider(
                        value: controller.selectedFontSize.value,
                        activeColor: Colors.deepOrange,
                        inactiveColor: Colors.deepOrange,
                        min: 8.0,
                        max: 19.0,
                        onChanged: (value) {
                          controller.updateSelectedFontSize(value);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              CustomElevatedButton(
                onTap: () {
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
                },
                text: "Choose your Background Image",
                margin: getMargin(
                  left: 2,
                  top: 24,
                  right: 7,
                ),
                buttonStyle: CustomButtonStyles.fillDeeporangeA20001.copyWith(
                    fixedSize: MaterialStateProperty.all<Size>(Size(
                  double.maxFinite,
                  getVerticalSize(
                    46,
                  ),
                ))),
                buttonTextStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              CustomElevatedButton(
                onTap: () {
                  controller.higlightslist(
                      context: context,
                      fontSize: controller.selectedFontSize.value,
                      selectedText: copyText!,
                      color: controller.selectedTextColor.value,
                      imageUrl: controller.selectedBackground.value,
                      fontFamily: controller.selectedFontFamily.value,
                      title: title!);
                  //context,controller.displayText.value,controller.selectedBackground.value,
                },
                text: "lbl_save_to_profile".tr,
                margin: getMargin(
                  left: 2,
                  top: 24,
                  right: 7,
                ),
                buttonStyle: CustomButtonStyles.fillDeeporangeA20001.copyWith(
                    fixedSize: MaterialStateProperty.all<Size>(Size(
                  double.maxFinite,
                  getVerticalSize(
                    46,
                  ),
                ))),
                buttonTextStyle: CustomTextStyles.titleMediumWhiteA700Medium_2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class SaveOrEditBlogDialog extends StatelessWidget {
//   String? copyText;
//
//   SaveOrEditBlogDialog(
//     this.controller, { required this.copyText,
//     Key? key,
//   }) : super(
//           key: key,
//         );
//
//   SaveOrEditBlogController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);
//     return Container(
//       width: getHorizontalSize(
//         318,
//       ),
//       padding: getPadding(
//         left: 20,
//         top: 22,
//         right: 20,
//         bottom: 22,
//       ),
//       decoration: AppDecoration.fill.copyWith(
//         borderRadius: BorderRadiusStyle.roundedBorder22,
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             TextWidget(text: 'Create Image', color:Colors.black, fsize: 14),
//             Container(
//               height: getVerticalSize(
//                 209,
//               ),
//               width: getHorizontalSize(
//                 269,
//               ),
//               margin: getMargin(
//                 left: 2,
//                 top: 6,
//               ),
//               child: Stack(
//                 alignment: Alignment.topCenter,
//                 children: [
//                   Obx(
//                     () => Container(
//                       height: getVerticalSize(
//                         209,
//                       ),
//                       width: getHorizontalSize(
//                         269,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.black12,
//                         borderRadius: BorderRadius.circular(
//                           getHorizontalSize(
//                             15,
//                           ),
//                         ),
//                         image:controller.selectedBackground.value != '' ?
//                         DecorationImage(image: NetworkImage(controller.selectedBackground.value), fit: BoxFit.cover,)
//                             : null,
//                       ),
//                       child: Center(child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 18.0),
//                         child: TextWidget(text:copyText, color:Colors.white, fsize: 12),
//                       ))),
//                   ),
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: Container(
//                       width: getHorizontalSize(
//                         219,
//                       ),
//                       margin: getMargin(top: 20, bottom: 20),
//                       child: Obx(
//                         () => SingleChildScrollView(
//                           child: Text(controller.displayText.value,
//                             style: GoogleFonts.getFont(
//                               controller.selectedFontFamily.value,
//                               fontSize: controller.selectedFontSize.value,
//                               fontWeight: controller.selectedFontWeight.value,
//                               color: Color(int.parse('#${controller.selectedTextColor.value}')
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: 16.0),
//
//             // Font Size
//             Text('Font Size: ${controller.selectedFontSize}'),
//             Slider(
//               value: controller.selectedFontSize.value,
//               min: 10.0,
//               max: 40.0,
//               onChanged: (value) {
//                 controller.updateSelectedFontSize(value);
//               },
//             ),
//             SizedBox(height: 16.0),
//
//             // Font Weight
//             Text('Font Weight:'),

//             SizedBox(height: 16.0),
//
//             // Text Color

//
//
//             // Padding(
//             //   padding: getPadding(
//             //     top: 26,
//             //     right: 1,
//             //   ),
//             //   child: Row(
//             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //     children: [
//             //       Padding(
//             //         padding: getPadding(
//             //           top: 5,
//             //           bottom: 3,
//             //         ),
//             //         child: Text(
//             //           "Choose your background Image",
//             //           overflow: TextOverflow.ellipsis,
//             //           textAlign: TextAlign.left,
//             //           style: CustomTextStyles.bodySmallGray9000311_1,
//             //         ),
//             //       ),
//             //       InkWell(
//             //           onTap: (){
//             //             Get.dialog(
//             //
//             //               AlertDialog(
//             //                 title: Text("Choose a Background"),
//             //                 content: Obx(
//             //                       () => Expanded(
//             //                     child: ListView.builder(
//             //                       itemCount:
//             //                       controller.availableBackgrounds.length,
//             //                       itemBuilder: (context, index) {
//             //                         final background =
//             //                         controller.availableBackgrounds[index];
//             //                         return InkWell(
//             //                           onTap: () {
//             //                             controller.setSelectedBackground(
//             //                                 background);
//             //                             Get.back();
//             //                           },
//             //                           child: Column(
//             //                             children: [
//             //                               ListTile(
//             //                                 title: Text("Background ${index + 1}"),
//             //
//             //                               ),
//             //                               Container(
//             //                                 height: Get.height * 0.05,
//             //                                 width: Get.width * 0.5,
//             //                                 decoration: BoxDecoration(
//             //                                   borderRadius: BorderRadius.circular(12),
//             //                                   image: DecorationImage(
//             //                                       image: NetworkImage(
//             //                                         controller.availableBackgrounds[
//             //                                         index],
//             //                                       ),
//             //                                       fit: BoxFit.cover),
//             //
//             //                                 ),
//             //                               ),
//             //                             ],
//             //                           ),
//             //                         );
//             //                       },
//             //                     ),
//             //                   ),
//             //                 ),
//             //               ),
//             //             );
//             //           },
//             //           child:Obx(() => Container(
//             //             height:Get.height*0.1,
//             //             width: Get.width*0.2,
//             //             decoration: BoxDecoration(
//             //               color: Colors.teal,
//             //               borderRadius: BorderRadius.circular(12),
//             //               image: DecorationImage(
//             //                   image:
//             //                   NetworkImage(controller.selectedBackground.value),fit: BoxFit.cover),),
//             //           ),)
//             //       ),
//             //     ],
//             //   ),
//             // ),

//           ],
//         ),
//       ),
//     );
//   }
// }
