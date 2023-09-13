import 'controller/add_task_pop_up_calender_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:daone/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class AddTaskPopUpCalenderDialog extends StatelessWidget {
  AddTaskPopUpCalenderDialog(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  AddTaskPopUpCalenderController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: getHorizontalSize(
        336,
      ),
      padding: getPadding(
        top: 10,
        bottom: 10,
      ),
      decoration: AppDecoration.fill.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder22,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: getPadding(
              left: 43,
              top: 42,
              right: 43,
              bottom: 42,
            ),
            decoration: AppDecoration.fill.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder18,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "lbl_october_2023".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleSmallBluegray90001,
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgArrows,
                      height: getVerticalSize(
                        6,
                      ),
                      width: getHorizontalSize(
                        23,
                      ),
                      margin: getMargin(
                        top: 5,
                        bottom: 5,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: getPadding(
                    top: 32,
                    right: 1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_mo".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.titleSmallBluegray90001_1,
                      ),
                      Text(
                        "lbl_tu".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.titleSmallBluegray90001_1,
                      ),
                      Text(
                        "lbl_we".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.titleSmallBluegray90001_1,
                      ),
                      Text(
                        "lbl_th".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.titleSmallBluegray90001_1,
                      ),
                      Text(
                        "lbl_fr".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.titleSmallBluegray90001_1,
                      ),
                      Text(
                        "lbl_sa".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.titleSmallBluegray90001_1,
                      ),
                      Text(
                        "lbl_su".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.titleSmallBluegray90001_1,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: getPadding(
                      top: 18,
                      right: 6,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "lbl_1".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleSmall,
                        ),
                        Padding(
                          padding: getPadding(
                            left: 29,
                          ),
                          child: Text(
                            "lbl_2".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 25,
                          ),
                          child: Text(
                            "lbl_3".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 27,
                          ),
                          child: Text(
                            "lbl_4".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 6,
                    top: 10,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: getPadding(
                          top: 8,
                          bottom: 7,
                        ),
                        child: Text(
                          "lbl_5".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 30,
                          top: 8,
                          bottom: 7,
                        ),
                        child: Text(
                          "lbl_6".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 30,
                          top: 8,
                          bottom: 7,
                        ),
                        child: Text(
                          "lbl_7".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      Container(
                        width: getSize(
                          33,
                        ),
                        margin: getMargin(
                          left: 19,
                        ),
                        padding: getPadding(
                          left: 12,
                          top: 7,
                          right: 12,
                          bottom: 7,
                        ),
                        decoration: AppDecoration.txtFill.copyWith(
                          borderRadius: BorderRadiusStyle.txtRoundedBorder16,
                        ),
                        child: Text(
                          "lbl_8".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: CustomTextStyles.titleSmallWhiteA700,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 14,
                          top: 8,
                          bottom: 7,
                        ),
                        child: Text(
                          "lbl_9".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 22,
                          top: 8,
                          bottom: 7,
                        ),
                        child: Text(
                          "lbl_10".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 22,
                          top: 8,
                          bottom: 7,
                        ),
                        child: Text(
                          "lbl_11".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 3,
                    top: 11,
                    right: 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_12".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.titleSmall,
                      ),
                      Text(
                        "lbl_13".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.titleSmall,
                      ),
                      Text(
                        "lbl_14".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.titleSmall,
                      ),
                      Text(
                        "lbl_15".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.titleSmall,
                      ),
                      Text(
                        "lbl_16".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.titleSmall,
                      ),
                      Text(
                        "lbl_17".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.titleSmall,
                      ),
                      Text(
                        "lbl_18".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 3,
                    top: 18,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "lbl_19".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.titleSmall,
                      ),
                      Padding(
                        padding: getPadding(
                          left: 22,
                        ),
                        child: Text(
                          "lbl_202".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 22,
                        ),
                        child: Text(
                          "lbl_21".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 23,
                        ),
                        child: Text(
                          "lbl_22".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 18,
                        ),
                        child: Text(
                          "lbl_23".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 16,
                        ),
                        child: Text(
                          "lbl_24".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 18,
                        ),
                        child: Text(
                          "lbl_25".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 1,
                    top: 18,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "lbl_26".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.titleSmall,
                      ),
                      Padding(
                        padding: getPadding(
                          left: 22,
                        ),
                        child: Text(
                          "lbl_27".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 21,
                        ),
                        child: Text(
                          "lbl_28".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 22,
                        ),
                        child: Text(
                          "lbl_29".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 18,
                        ),
                        child: Text(
                          "lbl_30".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 19,
                        ),
                        child: Text(
                          "lbl_31".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              top: 10,
              bottom: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomOutlinedButton(
                  onTap: (){
                    Get.back();
                  },
                  text: "lbl_cancel".tr,
                  buttonStyle:
                      CustomButtonStyles.outlineDeeporangeA20005.copyWith(
                          fixedSize: MaterialStateProperty.all<Size>(Size(
                    getHorizontalSize(
                      91,
                    ),
                    getVerticalSize(
                      35,
                    ),
                  ))),
                  buttonTextStyle:
                      CustomTextStyles.titleSmallDMSansDeeporangeA20005,
                ),
                CustomElevatedButton(
                  onTap: (){
                    Get.toNamed(AppRoutes.congratulationsPageScreen);
                  },
                  text: "lbl_save".tr,
                  margin: getMargin(
                    left: 20,
                  ),
                  buttonStyle: CustomButtonStyles.fillDeeporangeA20005.copyWith(
                      fixedSize: MaterialStateProperty.all<Size>(Size(
                    getHorizontalSize(
                      91,
                    ),
                    getVerticalSize(
                      35,
                    ),
                  ))),
                  buttonTextStyle: CustomTextStyles.titleSmallDMSansWhiteA700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
