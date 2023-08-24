import '../controller/view_all_task_controller.dart';
import '../models/view_all_task_item_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_checkbox_button.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewAllTaskItemWidget extends StatelessWidget {
  ViewAllTaskItemWidget(
    this.viewAllTaskItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ViewAllTaskItemModel viewAllTaskItemModelObj;

  var controller = Get.find<ViewAllTaskController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: getPadding(
          left: 12,
          top: 11,
          right: 12,
          bottom: 11,
        ),
        decoration: AppDecoration.outline5.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder14,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: getVerticalSize(
                46,
              ),
              width: getHorizontalSize(
                299,
              ),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Obx(
                      () => CustomCheckboxButton(
                        alignment: Alignment.topCenter,
                        width: getHorizontalSize(
                          299,
                        ),
                        text: "msg_10_min_cardio".tr,
                        iconSize: getHorizontalSize(
                          23,
                        ),
                        value: viewAllTaskItemModelObj.isCheckbox.value,
                        padding: getPadding(
                          top: 3,
                          bottom: 3,
                        ),
                        textStyle: CustomTextStyles.labelMediumBluegray70001,
                        isRightCheck: true,
                        onChange: (value) {
                          viewAllTaskItemModelObj.isCheckbox.value = value;
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Obx(
                      () => Text(
                        viewAllTaskItemModelObj.activityTxt.value,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style:
                            CustomTextStyles.titleSmallPoppinsDeeporangeA20002,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                left: 4,
                top: 4,
                bottom: 3,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgIconsaxboldclock,
                    height: getSize(
                      14,
                    ),
                    width: getSize(
                      14,
                    ),
                    margin: getMargin(
                      top: 1,
                      bottom: 1,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 5,
                    ),
                    child: Text(
                      "msg_10_00_am_10_30".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.labelMediumGray500,
                    ),
                  ),
                  Spacer(),
                  CustomElevatedButton(
                    text: "lbl_done".tr,
                    margin: getMargin(
                      top: 1,
                      bottom: 1,
                    ),
                    buttonStyle: CustomButtonStyles.fillTeal800TL7.copyWith(
                        fixedSize: MaterialStateProperty.all<Size>(Size(
                      getHorizontalSize(
                        34,
                      ),
                      getVerticalSize(
                        14,
                      ),
                    ))),
                    buttonTextStyle: CustomTextStyles.poppinsWhiteA700,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
