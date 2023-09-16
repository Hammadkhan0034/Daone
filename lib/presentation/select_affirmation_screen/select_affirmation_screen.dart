import '../select_affirmation_screen/widgets/select_item_widget.dart';
import 'controller/select_affirmation_controller.dart';
import 'models/select_item_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/appbar_image.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_bottom_bar.dart';
import 'package:daone/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class SelectAffirmationScreen extends GetWidget<SelectAffirmationController> {
  const SelectAffirmationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            79,
          ),
          leadingWidth: 72,
          leading: AppbarIconbutton(
            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              left: 24,
              top: 4,
              bottom: 4,
            ),
          ),
          actions: [
            AppbarImage(
              height: getSize(
                40,
              ),
              width: getSize(
                40,
              ),
              svgPath: ImageConstant.imgFolder,
              margin: getMargin(
                left: 30,
                top: 4,
                right: 30,
                bottom: 12,
              ),
            ),
          ],
        ),
        body: SizedBox(
          height: getVerticalSize(
            623,
          ),
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Opacity(
                opacity: 0.15,
                child: CustomImageView(
                  imagePath: ImageConstant.imgEllipse255305x204,
                  height: getVerticalSize(
                    305,
                  ),
                  width: getHorizontalSize(
                    204,
                  ),
                  alignment: Alignment.bottomRight,
                ),
              ),
              Opacity(
                opacity: 0.15,
                child: CustomImageView(
                  imagePath: ImageConstant.imgEllipse254283x223,
                  height: getVerticalSize(
                    283,
                  ),
                  width: getHorizontalSize(
                    223,
                  ),
                  alignment: Alignment.topLeft,
                  margin: getMargin(
                    top: 144,
                  ),
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: getPadding(
                      left: 28,
                      right: 29,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Obx(
                            () => GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: getVerticalSize(
                                  202,
                                ),
                                crossAxisCount: 2,
                                mainAxisSpacing: getHorizontalSize(
                                  18,
                                ),
                                crossAxisSpacing: getHorizontalSize(
                                  18,
                                ),
                              ),
                              physics: BouncingScrollPhysics(),
                              itemCount: controller.selectAffirmationModelObj
                                  .value.selectItemList.value.length,
                              itemBuilder: (context, index) {
                                SelectItemModel model = controller
                                    .selectAffirmationModelObj
                                    .value
                                    .selectItemList
                                    .value[index];
                                return SelectItemWidget(
                                  model,
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: getVerticalSize(
                            419,
                          ),
                          width: getHorizontalSize(
                            317,
                          ),
                          margin: getMargin(
                            top: 17,
                          ),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              // Align(
                              //   alignment: Alignment.bottomLeft,
                              //   child: Container(
                              //     padding: getPadding(
                              //       left: 12,
                              //       top: 11,
                              //       right: 12,
                              //       bottom: 11,
                              //     ),
                              //     decoration: AppDecoration.outline4.copyWith(
                              //       borderRadius:
                              //           BorderRadiusStyle.roundedBorder14,
                              //     ),
                              //     child: Column(
                              //       mainAxisSize: MainAxisSize.min,
                              //       mainAxisAlignment: MainAxisAlignment.start,
                              //       children: [
                              //         CustomImageView(
                              //           imagePath:
                              //               ImageConstant.imgRectangle5912,
                              //           height: getSize(
                              //             123,
                              //           ),
                              //           width: getSize(
                              //             123,
                              //           ),
                              //           radius: BorderRadius.circular(
                              //             getHorizontalSize(
                              //               8,
                              //             ),
                              //           ),
                              //         ),
                              //         Container(
                              //           width: getHorizontalSize(
                              //             123,
                              //           ),
                              //           margin: getMargin(
                              //             top: 11,
                              //           ),
                              //           child: Text(
                              //             "msg_health_and_well".tr,
                              //             maxLines: null,
                              //             overflow: TextOverflow.ellipsis,
                              //             textAlign: TextAlign.left,
                              //             style: CustomTextStyles
                              //                 .labelLargeGray80001,
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  padding: getPadding(
                                    left: 12,
                                    top: 11,
                                    right: 12,
                                    bottom: 11,
                                  ),
                                  decoration: AppDecoration.outline4.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder14,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                        imagePath:
                                            ImageConstant.imgRectangle5912,
                                        height: getSize(
                                          123,
                                        ),
                                        width: getSize(
                                          123,
                                        ),
                                        radius: BorderRadius.circular(
                                          getHorizontalSize(
                                            8,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: getHorizontalSize(
                                          123,
                                        ),
                                        margin: getMargin(
                                          top: 11,
                                        ),
                                        child: Text(
                                          "msg_fitness_and_workout".tr,
                                          maxLines: null,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles
                                              .labelLargeGray80001,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Align(
                              //   alignment: Alignment.bottomRight,
                              //   child: Container(
                              //     padding: getPadding(
                              //       left: 12,
                              //       top: 11,
                              //       right: 12,
                              //       bottom: 11,
                              //     ),
                              //     decoration: AppDecoration.outline4.copyWith(
                              //       borderRadius:
                              //           BorderRadiusStyle.roundedBorder14,
                              //     ),
                              //     child: Column(
                              //       mainAxisSize: MainAxisSize.min,
                              //       mainAxisAlignment: MainAxisAlignment.start,
                              //       children: [
                              //         CustomImageView(
                              //           imagePath:
                              //               ImageConstant.imgRectangle5912,
                              //           height: getSize(
                              //             123,
                              //           ),
                              //           width: getSize(
                              //             123,
                              //           ),
                              //           radius: BorderRadius.circular(
                              //             getHorizontalSize(
                              //               8,
                              //             ),
                              //           ),
                              //         ),
                              //         Container(
                              //           width: getHorizontalSize(
                              //             123,
                              //           ),
                              //           margin: getMargin(
                              //             top: 11,
                              //           ),
                              //           child: Text(
                              //             "lbl_self_care".tr,
                              //             maxLines: null,
                              //             overflow: TextOverflow.ellipsis,
                              //             textAlign: TextAlign.left,
                              //             style: CustomTextStyles
                              //                 .labelLargeGray80001,
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  padding: getPadding(
                                    left: 12,
                                    top: 11,
                                    right: 12,
                                    bottom: 11,
                                  ),
                                  decoration: AppDecoration.outline4.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder14,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: getSize(
                                          124,
                                        ),
                                        width: getSize(
                                          124,
                                        ),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                height: getSize(
                                                  123,
                                                ),
                                                width: getSize(
                                                  123,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: appTheme.pink50,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    getHorizontalSize(
                                                      8,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgGroup10030,
                                              height: getSize(
                                                124,
                                              ),
                                              width: getSize(
                                                124,
                                              ),
                                              alignment: Alignment.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: getHorizontalSize(
                                          123,
                                        ),
                                        margin: getMargin(
                                          top: 11,
                                        ),
                                        child: Text(
                                          "lbl_self_love".tr,
                                          maxLines: null,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles
                                              .labelLargeGray80001,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Align(
                              //   alignment: Alignment.bottomCenter,
                              //   child: Padding(
                              //     padding: getPadding(
                              //       left: 2,
                              //       bottom: 49,
                              //     ),
                              //     child: Column(
                              //       mainAxisSize: MainAxisSize.min,
                              //       mainAxisAlignment: MainAxisAlignment.start,
                              //       children: [
                              //         Row(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.spaceBetween,
                              //           children: [
                              //             Padding(
                              //               padding: getPadding(
                              //                 top: 3,
                              //                 bottom: 3,
                              //               ),
                              //               child: Text(
                              //                 "msg_workout_progress".tr,
                              //                 overflow: TextOverflow.ellipsis,
                              //                 textAlign: TextAlign.left,
                              //                 style:
                              //                     theme.textTheme.titleMedium,
                              //               ),
                              //             ),
                              //             // CustomDropDown(
                              //             //   width: getHorizontalSize(
                              //             //     76,
                              //             //   ),
                              //             //   icon: Container(
                              //             //     margin: getMargin(
                              //             //       left: 5,
                              //             //       right: 10,
                              //             //     ),
                              //             //     child: CustomImageView(
                              //             //       svgPath:
                              //             //           ImageConstant.imgArrowdown,
                              //             //     ),
                              //             //   ),
                              //             //   hintText: "lbl_weekly".tr,
                              //             //   textStyle: CustomTextStyles
                              //             //       .bodySmallWhiteA70010,
                              //             //   items: controller
                              //             //       .selectAffirmationModelObj
                              //             //       .value
                              //             //       .dropdownItemList
                              //             //       .value,
                              //             //   contentPadding: getPadding(
                              //             //     left: 10,
                              //             //     top: 7,
                              //             //     bottom: 7,
                              //             //   ),
                              //             //   onChanged: (value) {
                              //             //     controller.onSelected(value);
                              //             //   },
                              //             // ),
                              //           ],
                              //         ),
                              //         // Container(
                              //         //   height: getVerticalSize(
                              //         //     182,
                              //         //   ),
                              //         //   width: getHorizontalSize(
                              //         //     315,
                              //         //   ),
                              //         //   margin: getMargin(
                              //         //     top: 5,
                              //         //   ),
                              //         //   child: Stack(
                              //         //     alignment: Alignment.topCenter,
                              //         //     children: [
                              //         //       // Align(
                              //         //       //   alignment: Alignment.bottomCenter,
                              //         //       //   child: Row(
                              //         //       //     mainAxisAlignment:
                              //         //       //         MainAxisAlignment.center,
                              //         //       //     crossAxisAlignment:
                              //         //       //         CrossAxisAlignment.start,
                              //         //       //     children: [
                              //         //       //       Container(
                              //         //       //         height: getVerticalSize(
                              //         //       //           164,
                              //         //       //         ),
                              //         //       //         width: getHorizontalSize(
                              //         //       //           283,
                              //         //       //         ),
                              //         //       //         margin: getMargin(
                              //         //       //           top: 8,
                              //         //       //         ),
                              //         //       //         child: Stack(
                              //         //       //           alignment: Alignment
                              //         //       //               .bottomCenter,
                              //         //       //           children: [
                              //         //       //             Align(
                              //         //       //               alignment: Alignment
                              //         //       //                   .topCenter,
                              //         //       //               child: Container(
                              //         //       //                 height:
                              //         //       //                     getVerticalSize(
                              //         //       //                   137,
                              //         //       //                 ),
                              //         //       //                 width:
                              //         //       //                     getHorizontalSize(
                              //         //       //                   283,
                              //         //       //                 ),
                              //         //       //                 padding: getPadding(
                              //         //       //                   top: 11,
                              //         //       //                   bottom: 11,
                              //         //       //                 ),
                              //         //       //                 decoration:
                              //         //       //                     BoxDecoration(
                              //         //       //                   image:
                              //         //       //                       DecorationImage(
                              //         //       //                     image: fs.Svg(
                              //         //       //                       ImageConstant
                              //         //       //                           .imgGroup116,
                              //         //       //                     ),
                              //         //       //                     fit: BoxFit
                              //         //       //                         .cover,
                              //         //       //                   ),
                              //         //       //                 ),
                              //         //       //                 child: Stack(
                              //         //       //                   children: [
                              //         //       //                     CustomImageView(
                              //         //       //                       imagePath:
                              //         //       //                           ImageConstant
                              //         //       //                               .imgLinegraph,
                              //         //       //                       height:
                              //         //       //                           getVerticalSize(
                              //         //       //                         110,
                              //         //       //                       ),
                              //         //       //                       width:
                              //         //       //                           getHorizontalSize(
                              //         //       //                         282,
                              //         //       //                       ),
                              //         //       //                       alignment:
                              //         //       //                           Alignment
                              //         //       //                               .center,
                              //         //       //                     ),
                              //         //       //                   ],
                              //         //       //                 ),
                              //         //       //               ),
                              //         //       //             ),
                              //         //       //             Align(
                              //         //       //               alignment: Alignment
                              //         //       //                   .bottomCenter,
                              //         //       //               child: Container(
                              //         //       //                 width:
                              //         //       //                     getHorizontalSize(
                              //         //       //                   275,
                              //         //       //                 ),
                              //         //       //                 margin: getMargin(
                              //         //       //                   left: 4,
                              //         //       //                   top: 146,
                              //         //       //                   right: 4,
                              //         //       //                 ),
                              //         //       //                 child: Row(
                              //         //       //                   mainAxisAlignment:
                              //         //       //                       MainAxisAlignment
                              //         //       //                           .spaceBetween,
                              //         //       //                   children: [
                              //         //       //                     Text(
                              //         //       //                       "lbl_sun".tr,
                              //         //       //                       overflow:
                              //         //       //                           TextOverflow
                              //         //       //                               .ellipsis,
                              //         //       //                       textAlign:
                              //         //       //                           TextAlign
                              //         //       //                               .left,
                              //         //       //                       style: theme
                              //         //       //                           .textTheme
                              //         //       //                           .bodySmall,
                              //         //       //                     ),
                              //         //       //                     Text(
                              //         //       //                       "lbl_mon".tr,
                              //         //       //                       overflow:
                              //         //       //                           TextOverflow
                              //         //       //                               .ellipsis,
                              //         //       //                       textAlign:
                              //         //       //                           TextAlign
                              //         //       //                               .left,
                              //         //       //                       style: theme
                              //         //       //                           .textTheme
                              //         //       //                           .bodySmall,
                              //         //       //                     ),
                              //         //       //                     Text(
                              //         //       //                       "lbl_tue".tr,
                              //         //       //                       overflow:
                              //         //       //                           TextOverflow
                              //         //       //                               .ellipsis,
                              //         //       //                       textAlign:
                              //         //       //                           TextAlign
                              //         //       //                               .left,
                              //         //       //                       style: theme
                              //         //       //                           .textTheme
                              //         //       //                           .bodySmall,
                              //         //       //                     ),
                              //         //       //                     Text(
                              //         //       //                       "lbl_wed".tr,
                              //         //       //                       overflow:
                              //         //       //                           TextOverflow
                              //         //       //                               .ellipsis,
                              //         //       //                       textAlign:
                              //         //       //                           TextAlign
                              //         //       //                               .left,
                              //         //       //                       style: theme
                              //         //       //                           .textTheme
                              //         //       //                           .bodySmall,
                              //         //       //                     ),
                              //         //       //                     Text(
                              //         //       //                       "lbl_thu".tr,
                              //         //       //                       overflow:
                              //         //       //                           TextOverflow
                              //         //       //                               .ellipsis,
                              //         //       //                       textAlign:
                              //         //       //                           TextAlign
                              //         //       //                               .left,
                              //         //       //                       style: theme
                              //         //       //                           .textTheme
                              //         //       //                           .bodySmall,
                              //         //       //                     ),
                              //         //       //                     Text(
                              //         //       //                       "lbl_fri".tr,
                              //         //       //                       overflow:
                              //         //       //                           TextOverflow
                              //         //       //                               .ellipsis,
                              //         //       //                       textAlign:
                              //         //       //                           TextAlign
                              //         //       //                               .left,
                              //         //       //                       style: theme
                              //         //       //                           .textTheme
                              //         //       //                           .labelLarge,
                              //         //       //                     ),
                              //         //       //                     Text(
                              //         //       //                       "lbl_sat".tr,
                              //         //       //                       overflow:
                              //         //       //                           TextOverflow
                              //         //       //                               .ellipsis,
                              //         //       //                       textAlign:
                              //         //       //                           TextAlign
                              //         //       //                               .left,
                              //         //       //                       style: theme
                              //         //       //                           .textTheme
                              //         //       //                           .bodySmall,
                              //         //       //                     ),
                              //         //       //                   ],
                              //         //       //                 ),
                              //         //       //               ),
                              //         //       //             ),
                              //         //       //             CustomImageView(
                              //         //       //               imagePath: ImageConstant
                              //         //       //                   .imgActivegraph,
                              //         //       //               height:
                              //         //       //                   getVerticalSize(
                              //         //       //                 121,
                              //         //       //               ),
                              //         //       //               width:
                              //         //       //                   getHorizontalSize(
                              //         //       //                 25,
                              //         //       //               ),
                              //         //       //               alignment: Alignment
                              //         //       //                   .bottomRight,
                              //         //       //               margin: getMargin(
                              //         //       //                 right: 39,
                              //         //       //                 bottom: 5,
                              //         //       //               ),
                              //         //       //             ),
                              //         //       //           ],
                              //         //       //         ),
                              //         //       //       ),
                              //         //       //       Padding(
                              //         //       //         padding: getPadding(
                              //         //       //           left: 3,
                              //         //       //           bottom: 18,
                              //         //       //         ),
                              //         //       //         child: Column(
                              //         //       //           crossAxisAlignment:
                              //         //       //               CrossAxisAlignment
                              //         //       //                   .start,
                              //         //       //           mainAxisAlignment:
                              //         //       //               MainAxisAlignment
                              //         //       //                   .start,
                              //         //       //           children: [
                              //         //       //             Align(
                              //         //       //               alignment: Alignment
                              //         //       //                   .centerRight,
                              //         //       //               child: Text(
                              //         //       //                 "lbl_100".tr,
                              //         //       //                 overflow:
                              //         //       //                     TextOverflow
                              //         //       //                         .ellipsis,
                              //         //       //                 textAlign:
                              //         //       //                     TextAlign.right,
                              //         //       //                 style:
                              //         //       //                     CustomTextStyles
                              //         //       //                         .bodySmall10,
                              //         //       //               ),
                              //         //       //             ),
                              //         //       //             Padding(
                              //         //       //               padding: getPadding(
                              //         //       //                 left: 2,
                              //         //       //                 top: 12,
                              //         //       //               ),
                              //         //       //               child: Text(
                              //         //       //                 "lbl_80".tr,
                              //         //       //                 overflow:
                              //         //       //                     TextOverflow
                              //         //       //                         .ellipsis,
                              //         //       //                 textAlign:
                              //         //       //                     TextAlign.right,
                              //         //       //                 style:
                              //         //       //                     CustomTextStyles
                              //         //       //                         .bodySmall10,
                              //         //       //               ),
                              //         //       //             ),
                              //         //       //             Padding(
                              //         //       //               padding: getPadding(
                              //         //       //                 left: 2,
                              //         //       //                 top: 11,
                              //         //       //               ),
                              //         //       //               child: Text(
                              //         //       //                 "lbl_60".tr,
                              //         //       //                 overflow:
                              //         //       //                     TextOverflow
                              //         //       //                         .ellipsis,
                              //         //       //                 textAlign:
                              //         //       //                     TextAlign.right,
                              //         //       //                 style:
                              //         //       //                     CustomTextStyles
                              //         //       //                         .bodySmall10,
                              //         //       //               ),
                              //         //       //             ),
                              //         //       //             Padding(
                              //         //       //               padding: getPadding(
                              //         //       //                 top: 12,
                              //         //       //               ),
                              //         //       //               child: Text(
                              //         //       //                 "lbl_40".tr,
                              //         //       //                 overflow:
                              //         //       //                     TextOverflow
                              //         //       //                         .ellipsis,
                              //         //       //                 textAlign:
                              //         //       //                     TextAlign.right,
                              //         //       //                 style: theme
                              //         //       //                     .textTheme
                              //         //       //                     .labelMedium,
                              //         //       //               ),
                              //         //       //             ),
                              //         //       //             Padding(
                              //         //       //               padding: getPadding(
                              //         //       //                 left: 3,
                              //         //       //                 top: 11,
                              //         //       //               ),
                              //         //       //               child: Text(
                              //         //       //                 "lbl_20".tr,
                              //         //       //                 overflow:
                              //         //       //                     TextOverflow
                              //         //       //                         .ellipsis,
                              //         //       //                 textAlign:
                              //         //       //                     TextAlign.right,
                              //         //       //                 style:
                              //         //       //                     CustomTextStyles
                              //         //       //                         .bodySmall10,
                              //         //       //               ),
                              //         //       //             ),
                              //         //       //             Padding(
                              //         //       //               padding: getPadding(
                              //         //       //                 left: 3,
                              //         //       //                 top: 12,
                              //         //       //               ),
                              //         //       //               child: Text(
                              //         //       //                 "lbl_0".tr,
                              //         //       //                 overflow:
                              //         //       //                     TextOverflow
                              //         //       //                         .ellipsis,
                              //         //       //                 textAlign:
                              //         //       //                     TextAlign.right,
                              //         //       //                 style:
                              //         //       //                     CustomTextStyles
                              //         //       //                         .bodySmall10,
                              //         //       //               ),
                              //         //       //             ),
                              //         //       //           ],
                              //         //       //         ),
                              //         //       //       ),
                              //         //       //     ],
                              //         //       //   ),
                              //         //       // ),
                              //         //       // Align(
                              //         //       //   alignment: Alignment.topCenter,
                              //         //       //   child: Container(
                              //         //       //     margin: getMargin(
                              //         //       //       left: 94,
                              //         //       //       right: 91,
                              //         //       //     ),
                              //         //       //     padding: getPadding(
                              //         //       //       all: 10,
                              //         //       //     ),
                              //         //       //     decoration: AppDecoration
                              //         //       //         .outline2
                              //         //       //         .copyWith(
                              //         //       //       borderRadius:
                              //         //       //           BorderRadiusStyle
                              //         //       //               .roundedBorder8,
                              //         //       //     ),
                              //         //       //     child: Column(
                              //         //       //       mainAxisSize:
                              //         //       //           MainAxisSize.min,
                              //         //       //       crossAxisAlignment:
                              //         //       //           CrossAxisAlignment.start,
                              //         //       //       mainAxisAlignment:
                              //         //       //           MainAxisAlignment.start,
                              //         //       //       children: [
                              //         //       //         Row(
                              //         //       //           children: [
                              //         //       //             Text(
                              //         //       //               "lbl_fri_28_may".tr,
                              //         //       //               overflow: TextOverflow
                              //         //       //                   .ellipsis,
                              //         //       //               textAlign:
                              //         //       //                   TextAlign.left,
                              //         //       //               style: CustomTextStyles
                              //         //       //                   .bodySmallGray500058,
                              //         //       //             ),
                              //         //       //             Padding(
                              //         //       //               padding: getPadding(
                              //         //       //                 left: 33,
                              //         //       //               ),
                              //         //       //               child: Text(
                              //         //       //                 "lbl_90".tr,
                              //         //       //                 overflow:
                              //         //       //                     TextOverflow
                              //         //       //                         .ellipsis,
                              //         //       //                 textAlign:
                              //         //       //                     TextAlign.left,
                              //         //       //                 style: CustomTextStyles
                              //         //       //                     .bodySmallGreen5008,
                              //         //       //               ),
                              //         //       //             ),
                              //         //       //             CustomImageView(
                              //         //       //               svgPath: ImageConstant
                              //         //       //                   .imgUpload,
                              //         //       //               height: getSize(
                              //         //       //                 8,
                              //         //       //               ),
                              //         //       //               width: getSize(
                              //         //       //                 8,
                              //         //       //               ),
                              //         //       //               margin: getMargin(
                              //         //       //                 top: 2,
                              //         //       //                 bottom: 2,
                              //         //       //               ),
                              //         //       //             ),
                              //         //       //           ],
                              //         //       //         ),
                              //         //       //         // Padding(
                              //         //       //         //   padding: getPadding(
                              //         //       //         //     top: 3,
                              //         //       //         //   ),
                              //         //       //         //   child: Text(
                              //         //       //         //     "msg_upperbody_workout"
                              //         //       //         //         .tr,
                              //         //       //         //     overflow: TextOverflow
                              //         //       //         //         .ellipsis,
                              //         //       //         //     textAlign:
                              //         //       //         //         TextAlign.left,
                              //         //       //         //     style: CustomTextStyles
                              //         //       //         //         .bodySmall10_1,
                              //         //       //         //   ),
                              //         //       //         // ),
                              //         //       //         Padding(
                              //         //       //           padding: getPadding(
                              //         //       //             top: 3,
                              //         //       //           ),
                              //         //       //           child: Container(
                              //         //       //             height: getVerticalSize(
                              //         //       //               5,
                              //         //       //             ),
                              //         //       //             width:
                              //         //       //                 getHorizontalSize(
                              //         //       //               110,
                              //         //       //             ),
                              //         //       //             decoration:
                              //         //       //                 BoxDecoration(
                              //         //       //               color:
                              //         //       //                   appTheme.gray50,
                              //         //       //               borderRadius:
                              //         //       //                   BorderRadius
                              //         //       //                       .circular(
                              //         //       //                 getHorizontalSize(
                              //         //       //                   2,
                              //         //       //                 ),
                              //         //       //               ),
                              //         //       //             ),
                              //         //       //             child: ClipRRect(
                              //         //       //               borderRadius:
                              //         //       //                   BorderRadius
                              //         //       //                       .circular(
                              //         //       //                 getHorizontalSize(
                              //         //       //                   2,
                              //         //       //                 ),
                              //         //       //               ),
                              //         //       //               child:
                              //         //       //                   LinearProgressIndicator(
                              //         //       //                 value: 0.79,
                              //         //       //                 backgroundColor:
                              //         //       //                     appTheme.gray50,
                              //         //       //               ),
                              //         //       //             ),
                              //         //       //           ),
                              //         //       //         ),
                              //         //       //       ],
                              //         //       //     ),
                              //         //       //   ),
                              //         //       // ),
                              //         //     ],
                              //         //   ),
                              //         // ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
