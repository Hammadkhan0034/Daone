import '../controller/home_one_controller.dart';
import '../models/completedtask1_item_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Completedtask1ItemWidget extends StatelessWidget {
  Completedtask1ItemWidget(
    this.completedtask1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Completedtask1ItemModel completedtask1ItemModelObj;

  var controller = Get.find<HomeOneController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: getPadding(
          left: 16,
          top: 7,
          right: 16,
          bottom: 7,
        ),
        decoration: AppDecoration.fill.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder14,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "msg_10_min_cardio".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: theme.textTheme.labelSmall,
            ),
            Padding(
              padding: getPadding(
                right: 6,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: getPadding(
                      bottom: 2,
                    ),
                    child: Text(
                      "lbl_work_out".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleSmallPoppinsDeeporangeA20002,
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgCheckmark,
                    height: getSize(
                      24,
                    ),
                    width: getSize(
                      24,
                    ),
                    margin: getMargin(
                      top: 1,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                bottom: 1,
              ),
              child: Row(
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgIconsaxboldclock,
                    height: getSize(
                      10,
                    ),
                    width: getSize(
                      10,
                    ),
                    margin: getMargin(
                      bottom: 1,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 1,
                    ),
                    child: Text(
                      "msg_10_00_am_10_30".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.labelSmallGray500,
                    ),
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
