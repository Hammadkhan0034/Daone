import 'controller/grade_yourself_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class GradeYourselfDialog extends StatelessWidget {
  GradeYourselfDialog(
    this.controller, {
    Key? key,
  });

  GradeYourselfController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: getHorizontalSize(
        318,
      ),
      padding: getPadding(
        left: 14,
        top: 28,
        right: 14,
        bottom: 28,
      ),
      decoration: AppDecoration.fill.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder22,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "lbl_rate_yourself".tr.toUpperCase(),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: CustomTextStyles.titleMediumGray90003,
          ),
          Container(
            width: getHorizontalSize(
              249,
            ),
            margin: getMargin(
              left: 20,
              top: 5,
              right: 20,
            ),
            child: Text(
              "msg_how_well_did_you".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodySmallGray60005,
            ),
          ),
          CustomImageView(
            svgPath: ImageConstant.imgObjects,
            height: getVerticalSize(
              86,
            ),
            width: getHorizontalSize(
              227,
            ),
            margin: getMargin(
              top: 25,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 1,
              top: 28,
              right: 7,
            ),
            child: SliderTheme(
              data: SliderThemeData(
                trackShape: RoundedRectSliderTrackShape(),
                activeTrackColor: appTheme.yellow800,
                inactiveTrackColor: appTheme.blueGray100,
                thumbColor: appTheme.whiteA700,
                thumbShape: RoundSliderThumbShape(),
              ),
              child: Slider(
                value: 55.05,
                min: 0.0,
                max: 100.0,
                onChanged: (value) {},
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 2,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_02".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.labelMediumBluegray400dd,
                ),
                Text(
                  "lbl_10".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.labelMediumBluegray400dd,
                ),
              ],
            ),
          ),
          Container(
            width: getHorizontalSize(
              286,
            ),
            margin: getMargin(
              top: 20,
              right: 4,
            ),
            padding: getPadding(
              left: 15,
              top: 16,
              right: 15,
              bottom: 16,
            ),
            decoration: AppDecoration.outline3.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder14,
            ),
            child: Padding(
              padding: getPadding(
                bottom: 2,
              ),
              child: Text(
                "msg_how_can_i_do_better".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: CustomTextStyles.bodySmallGray50002,
              ),
            ),
          ),
          CustomElevatedButton(
            onTap: (){
              Get.toNamed(AppRoutes.homeScreen);
            },
            width: getHorizontalSize(
              252,
            ),
            height: getVerticalSize(
              45,
            ),
            text: "lbl_complete".tr,
            margin: getMargin(
              left: 17,
              top: 26,
              right: 20,
              bottom: 1,
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
