import 'controller/edit_affirmation_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:daone/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EditAffirmationDialog extends StatelessWidget {
  EditAffirmationDialog(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  EditAffirmationController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: getHorizontalSize(
        318,
      ),
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
              top: 12,
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
            controller: controller.messageController,
            margin: getMargin(
              top: 34,
            ),
            contentPadding: getPadding(
              left: 5,
              right: 5,
            ),
            textStyle: CustomTextStyles.bodySmallGray9000310,
            hintText: "msg_i_deserve_to_experience2".tr,
            hintStyle: CustomTextStyles.bodySmallGray9000310,
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
              top: 26,
              right: 1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: getPadding(
                    top: 4,
                    bottom: 4,
                  ),
                  child: Text(
                    "lbl_font".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.bodySmallGray9000311_1,
                  ),
                ),
                Container(
                  width: getHorizontalSize(
                    71,
                  ),
                  padding: getPadding(
                    left: 8,
                    top: 4,
                    right: 8,
                    bottom: 4,
                  ),
                  decoration: AppDecoration.txtOutline1.copyWith(
                    borderRadius: BorderRadiusStyle.txtRoundedBorder3,
                  ),
                  child: Text(
                    "lbl_radely".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.bodySmallRadleyGray90003,
                  ),
                ),
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
                    84,
                  ),
                  radius: BorderRadius.circular(
                    getHorizontalSize(
                      3,
                    ),
                  ),
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
                  child: Text(
                    "lbl_09_00_am".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.bodySmallGray9000311,
                  ),
                ),
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
                  child: Text(
                    "lbl_05_00_pm".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.bodySmallGray9000311,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              top: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    top: 12,
                    bottom: 14,
                  ),
                  child: Text(
                    "lbl_how_many2".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.bodySmallGray9000311_1,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: getPadding(
                      left: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(
                            right: 2,
                          ),
                          child: Text(
                            "lbl_10x".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.labelMediumGray90003,
                          ),
                        ),
                        Container(
                          height: getVerticalSize(
                            9,
                          ),
                          width: getHorizontalSize(
                            198,
                          ),
                          margin: getMargin(
                            top: 1,
                            right: 2,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: getPadding(
                                    bottom: 3,
                                  ),
                                  child: SizedBox(
                                    width: getHorizontalSize(
                                      198,
                                    ),
                                    child: Divider(
                                      height: getVerticalSize(
                                        1,
                                      ),
                                      thickness: getVerticalSize(
                                        1,
                                      ),
                                      color: appTheme.gray30003,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: getPadding(
                                    bottom: 2,
                                  ),
                                  child: SizedBox(
                                    width: getHorizontalSize(
                                      105,
                                    ),
                                    child: Divider(
                                      height: getVerticalSize(
                                        1,
                                      ),
                                      thickness: getVerticalSize(
                                        1,
                                      ),
                                      color: appTheme.gray90003,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  height: getSize(
                                    9,
                                  ),
                                  width: getSize(
                                    9,
                                  ),
                                  margin: getMargin(
                                    right: 86,
                                  ),
                                  decoration: BoxDecoration(
                                    color: appTheme.whiteA700,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        4,
                                      ),
                                    ),
                                    border: Border.all(
                                      color: appTheme.black900,
                                      width: getHorizontalSize(
                                        1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: getPadding(
                                bottom: 1,
                              ),
                              child: Text(
                                "lbl_02".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles
                                    .labelMediumBluegray400ddMedium,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 1,
                              ),
                              child: Text(
                                "lbl_202".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles
                                    .labelMediumBluegray400ddMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
            text: "lbl_save".tr,
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
    );
  }
}
