import '../controller/group_controller.dart';
import '../controller/view_friends_controller.dart';
import '../models/group_model.dart';
import '../models/view_friends1_item_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewFriends1ItemWidget extends StatelessWidget {
  ViewFriends1ItemWidget(
    this.model, {
    Key? key,
        required this.index,
  }) : super(
          key: key,
        );

  GroupModel model;

  int index;

  var controller = Get.find<ViewFriendsController>();
  final GroupController groupController = Get.put(GroupController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getVerticalSize(
        156,
      ),
      width: getHorizontalSize(
        326,
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: getMargin(
                top: 22,
                right: 9,
              ),
              decoration: AppDecoration.outline15.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder14,
              ),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle5951,
                    height: getVerticalSize(
                      134,
                    ),
                    width: getHorizontalSize(
                      128,
                    ),
                    radius: BorderRadius.circular(
                      getHorizontalSize(
                        15,
                      ),
                    ),
                  ),


                  Padding(
                    padding: getPadding(
                      left: 9,
                      top: 16,
                      bottom: 5,
                    ),
                    child:

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [





                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: getPadding(
                              top: 23,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: getHorizontalSize(100),
                                  height: getVerticalSize(20),
                                  child: Text(
                                    controller.groups[index].name,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.titleSmallPoppinsBlack900,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "lbl_affirmations".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles
                                          .labelMediumGray90003Medium_1,
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 72,
                                      ),
                                      child: Text(
                                        "lbl_1000".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            CustomTextStyles.labelMediumGray70003,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getVerticalSize(
                            14,
                          ),
                          width: getHorizontalSize(
                            166,
                          ),
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: getVerticalSize(
                                    13,
                                  ),
                                  width: getHorizontalSize(
                                    160,
                                  ),
                                  decoration: BoxDecoration(
                                    color: appTheme.blueGray10002,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        6,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: getVerticalSize(
                                    13,
                                  ),
                                  width: getHorizontalSize(
                                    141,
                                  ),
                                  decoration: BoxDecoration(
                                    color: appTheme.deepOrangeA20006,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        6,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: getPadding(
                                    left: 19,
                                  ),
                                  child: Text(
                                      model.name,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles
                                          .labelSmallWhiteA7009_1,
                                    ),

                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: getVerticalSize(
                              27,
                            ),
                            width: getHorizontalSize(
                              95,
                            ),
                            margin: getMargin(
                              top: 8,
                            ),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgEllipse263,
                                  height: getSize(
                                    27,
                                  ),
                                  width: getSize(
                                    27,
                                  ),
                                  radius: BorderRadius.circular(
                                    getHorizontalSize(
                                      13,
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant.imgEllipse264,
                                  height: getSize(
                                    27,
                                  ),
                                  width: getSize(
                                    27,
                                  ),
                                  radius: BorderRadius.circular(
                                    getHorizontalSize(
                                      13,
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                  margin: getMargin(
                                    left: 22,
                                  ),
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant.imgEllipse265,
                                  height: getSize(
                                    27,
                                  ),
                                  width: getSize(
                                    27,
                                  ),
                                  radius: BorderRadius.circular(
                                    getHorizontalSize(
                                      13,
                                    ),
                                  ),
                                  alignment: Alignment.centerRight,
                                  margin: getMargin(
                                    right: 22,
                                  ),
                                ),
                                CustomIconButton(
                                  height: 27,
                                  width: 27,
                                  padding: getPadding(
                                    all: 3,
                                  ),
                                  decoration:
                                      IconButtonStyleHelper.outlineWhiteA700,
                                  alignment: Alignment.centerRight,
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgPlusGray70002,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgUntit11,
            height: getSize(
              71,
            ),
            width: getSize(
              71,
            ),
            alignment: Alignment.topRight,
          ),
        ],
      ),
    );
  }
}
