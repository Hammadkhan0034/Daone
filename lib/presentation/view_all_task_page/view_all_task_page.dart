import '../view_all_task_page/widgets/view_all_task_item_widget.dart';
import 'controller/view_all_task_controller.dart';
import 'models/view_all_task_item_model.dart';
import 'models/view_all_task_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

class ViewAllTaskPage extends StatelessWidget {
  ViewAllTaskPage({Key? key})
      : super(
          key: key,
        );

  ViewAllTaskController controller =
      Get.put(ViewAllTaskController(ViewAllTaskModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    top: 24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: getVerticalSize(
                            531,
                          ),
                          width: double.maxFinite,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Opacity(
                                opacity: 0.15,
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgEllipse254270x172,
                                  height: getVerticalSize(
                                    270,
                                  ),
                                  width: getHorizontalSize(
                                    172,
                                  ),
                                  alignment: Alignment.topLeft,
                                  margin: getMargin(
                                    top: 62,
                                  ),
                                ),
                              ),
                              Opacity(
                                opacity: 0.15,
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgEllipse2552,
                                  height: getVerticalSize(
                                    270,
                                  ),
                                  width: getHorizontalSize(
                                    169,
                                  ),
                                  alignment: Alignment.bottomRight,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: getPadding(
                                    left: 21,
                                    right: 26,
                                    bottom: 114,
                                  ),
                                  child: Obx(
                                    () => ListView.separated(
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      separatorBuilder: (
                                        context,
                                        index,
                                      ) {
                                        return SizedBox(
                                          height: getVerticalSize(
                                            15,
                                          ),
                                        );
                                      },
                                      itemCount: controller
                                          .viewAllTaskModelObj
                                          .value
                                          .viewAllTaskItemList
                                          .value
                                          .length,
                                      itemBuilder: (context, index) {
                                        ViewAllTaskItemModel model = controller
                                            .viewAllTaskModelObj
                                            .value
                                            .viewAllTaskItemList
                                            .value[index];
                                        return ViewAllTaskItemWidget(
                                          model,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 30,
                          top: 118,
                          right: 30,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: getPadding(
                                top: 3,
                                bottom: 3,
                              ),
                              child: Text(
                                "msg_workout_progress".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                            CustomDropDown(
                              width: getHorizontalSize(
                                76,
                              ),
                              icon: Container(
                                margin: getMargin(
                                  left: 5,
                                  right: 10,
                                ),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdown,
                                ),
                              ),
                              hintText: "lbl_weekly".tr,
                              textStyle: CustomTextStyles.bodySmallWhiteA70010,
                              items: controller.viewAllTaskModelObj.value
                                  .dropdownItemList.value,
                              contentPadding: getPadding(
                                left: 10,
                                top: 7,
                                bottom: 7,
                              ),
                              onChanged: (value) {
                                controller.onSelected(value);
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: getVerticalSize(
                          182,
                        ),
                        width: getHorizontalSize(
                          315,
                        ),
                        margin: getMargin(
                          top: 5,
                        ),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: getVerticalSize(
                                      164,
                                    ),
                                    width: getHorizontalSize(
                                      283,
                                    ),
                                    margin: getMargin(
                                      top: 8,
                                    ),
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                            height: getVerticalSize(
                                              137,
                                            ),
                                            width: getHorizontalSize(
                                              283,
                                            ),
                                            padding: getPadding(
                                              top: 12,
                                              bottom: 12,
                                            ),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: fs.Svg(
                                                  ImageConstant.imgGroup116,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgLinegraph,
                                                  height: getVerticalSize(
                                                    110,
                                                  ),
                                                  width: getHorizontalSize(
                                                    282,
                                                  ),
                                                  alignment: Alignment.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            width: getHorizontalSize(
                                              275,
                                            ),
                                            margin: getMargin(
                                              left: 4,
                                              top: 146,
                                              right: 4,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "lbl_sun".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                                Text(
                                                  "lbl_mon".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                                Text(
                                                  "lbl_tue".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                                Text(
                                                  "lbl_wed".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                                Text(
                                                  "lbl_thu".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                                Text(
                                                  "lbl_fri".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: theme
                                                      .textTheme.labelLarge,
                                                ),
                                                Text(
                                                  "lbl_sat".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        CustomImageView(
                                          imagePath: ImageConstant
                                              .imgActivegraphPink900,
                                          height: getVerticalSize(
                                            121,
                                          ),
                                          width: getHorizontalSize(
                                            25,
                                          ),
                                          alignment: Alignment.bottomRight,
                                          margin: getMargin(
                                            right: 39,
                                            bottom: 5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 3,
                                      bottom: 18,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "lbl_100".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: CustomTextStyles.bodySmall10,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 2,
                                            top: 12,
                                          ),
                                          child: Text(
                                            "lbl_80".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: CustomTextStyles.bodySmall10,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 2,
                                            top: 11,
                                          ),
                                          child: Text(
                                            "lbl_60".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: CustomTextStyles.bodySmall10,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            top: 12,
                                          ),
                                          child: Text(
                                            "lbl_40".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: theme.textTheme.labelMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 3,
                                            top: 11,
                                          ),
                                          child: Text(
                                            "lbl_20".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: CustomTextStyles.bodySmall10,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 3,
                                            top: 12,
                                          ),
                                          child: Text(
                                            "lbl_0".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: CustomTextStyles.bodySmall10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: getMargin(
                                  left: 94,
                                  right: 91,
                                ),
                                padding: getPadding(
                                  all: 10,
                                ),
                                decoration: AppDecoration.outline2.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "lbl_fri_28_may".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles
                                              .bodySmallGray500058,
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 33,
                                          ),
                                          child: Text(
                                            "lbl_90".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .bodySmallGreen5008,
                                          ),
                                        ),
                                        CustomImageView(
                                          svgPath: ImageConstant.imgUpload,
                                          height: getSize(
                                            8,
                                          ),
                                          width: getSize(
                                            8,
                                          ),
                                          margin: getMargin(
                                            top: 2,
                                            bottom: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        top: 3,
                                      ),
                                      child: Text(
                                        "msg_upperbody_workout".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: CustomTextStyles.bodySmall10_1,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        top: 3,
                                      ),
                                      child: Container(
                                        height: getVerticalSize(
                                          5,
                                        ),
                                        width: getHorizontalSize(
                                          110,
                                        ),
                                        decoration: BoxDecoration(
                                          color: appTheme.gray50,
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              2,
                                            ),
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              2,
                                            ),
                                          ),
                                          child: LinearProgressIndicator(
                                            value: 0.79,
                                            backgroundColor: appTheme.gray50,
                                          ),
                                        ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
