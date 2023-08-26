import 'controller/save_or_edit_blog_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:daone/widgets/custom_outlined_button.dart';
import 'package:daone/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SaveOrEditBlogDialog extends StatelessWidget {
  SaveOrEditBlogDialog(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  SaveOrEditBlogController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: getHorizontalSize(
        318,
      ),
      padding: getPadding(
        left: 20,
        top: 22,
        right: 20,
        bottom: 22,
      ),
      decoration: AppDecoration.fill.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder22,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: getVerticalSize(
              209,
            ),
            width: getHorizontalSize(
              269,
            ),
            margin: getMargin(
              left: 2,
              top: 6,
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgRectangle11,
                  height: getVerticalSize(
                    209,
                  ),
                  width: getHorizontalSize(
                    269,
                  ),
                  radius: BorderRadius.circular(
                    getHorizontalSize(
                      15,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: getHorizontalSize(
                      219,
                    ),
                    margin: getMargin(
                      top: 30,
                    ),
                    child: Text(
                      "msg_i_deserve_to_experience".tr,
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
          CustomTextFormField(
            controller: controller.statementController,
            margin: getMargin(
              left: 2,
              top: 35,
              right: 6,
            ),
            contentPadding: getPadding(
              left: 5,
              right: 5,
            ),
            textStyle: CustomTextStyles.bodySmallGray9000310,
            hintText: "msg_i_deserve_to_experience2".tr,
            hintStyle: CustomTextStyles.bodySmallGray9000310,
            textInputAction: TextInputAction.next,
            defaultBorderDecoration:
                TextFormFieldStyleHelper.underLineGray30003,
            enabledBorderDecoration:
                TextFormFieldStyleHelper.underLineGray30003,
            focusedBorderDecoration:
                TextFormFieldStyleHelper.underLineGray30003,
            disabledBorderDecoration:
                TextFormFieldStyleHelper.underLineGray30003,
          ),
          Padding(
            padding: getPadding(
              top: 25,
            ),
            child: Row(
              children: [
                Padding(
                  padding: getPadding(
                    top: 5,
                    bottom: 3,
                  ),
                  child: Text(
                    "lbl_background".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.bodySmallGray9000311_1,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgRectangle5909,
                  height: getVerticalSize(
                    26,
                  ),
                  width: getHorizontalSize(
                    123,
                  ),
                  radius: BorderRadius.circular(
                    getHorizontalSize(
                      3,
                    ),
                  ),
                  margin: getMargin(
                    left: 20,
                  ),
                ),
                CustomOutlinedButton(
                  text: "lbl_5e4646".tr,
                  margin: getMargin(
                    left: 14,
                  ),
                  buttonStyle: CustomButtonStyles.outlineGray30003.copyWith(
                      fixedSize: MaterialStateProperty.all<Size>(Size(
                    getHorizontalSize(
                      48,
                    ),
                    getVerticalSize(
                      26,
                    ),
                  ))),
                  buttonTextStyle: CustomTextStyles.poppinsWhiteA700Regular,
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              top: 28,
            ),
            child: Row(
              children: [
                Padding(
                  padding: getPadding(
                    top: 5,
                    bottom: 3,
                  ),
                  child: Text(
                    "lbl_font".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.bodySmallGray9000311_1,
                  ),
                ),
                Spacer(),
                CustomTextFormField(
                  width: getHorizontalSize(
                    123,
                  ),
                  controller: controller.fontfamilyController,
                  contentPadding: getPadding(
                    left: 14,
                    top: 5,
                    right: 14,
                    bottom: 5,
                  ),
                  textStyle: CustomTextStyles.bodySmallRadleyGray90003,
                  hintText: "lbl_radely".tr,
                  hintStyle: CustomTextStyles.bodySmallRadleyGray90003,
                  defaultBorderDecoration:
                      TextFormFieldStyleHelper.outlineGray30003,
                  enabledBorderDecoration:
                      TextFormFieldStyleHelper.outlineGray30003,
                  focusedBorderDecoration:
                      TextFormFieldStyleHelper.outlineGray30003,
                  disabledBorderDecoration:
                      TextFormFieldStyleHelper.outlineGray30003,
                ),
                Container(
                  height: getVerticalSize(
                    26,
                  ),
                  width: getHorizontalSize(
                    48,
                  ),
                  margin: getMargin(
                    left: 14,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: getPadding(
                            left: 9,
                            top: 3,
                          ),
                          child: Text(
                            "lbl_12".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.bodySmallGray90003,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: getPadding(
                            all: 1,
                          ),
                          decoration: AppDecoration.outline10.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder3,
                          ),
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 0,
                            margin: EdgeInsets.all(0),
                            color: appTheme.blueGray50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusStyle.roundedBorder3,
                            ),
                            child: Container(
                              height: getVerticalSize(
                                24,
                              ),
                              width: getHorizontalSize(
                                18,
                              ),
                              padding: getPadding(
                                left: 5,
                                top: 10,
                                right: 5,
                                bottom: 10,
                              ),
                              decoration: AppDecoration.fill10.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder3,
                              ),
                              child: Stack(
                                children: [
                                  CustomImageView(
                                    svgPath: ImageConstant.imgVectorBlack900,
                                    height: getVerticalSize(
                                      3,
                                    ),
                                    width: getHorizontalSize(
                                      6,
                                    ),
                                    alignment: Alignment.bottomRight,
                                  ),
                                ],
                              ),
                            ),
                          ),
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
              top: 30,
            ),
            child: Row(
              children: [
                Text(
                  "lbl_align".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.bodySmallGray9000311_1,
                ),
                CustomImageView(
                  svgPath: ImageConstant.imgMenuGray90003,
                  height: getVerticalSize(
                    12,
                  ),
                  width: getHorizontalSize(
                    85,
                  ),
                  margin: getMargin(
                    left: 59,
                    top: 1,
                    bottom: 3,
                  ),
                ),
              ],
            ),
          ),
          CustomElevatedButton(
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
    );
  }
}
