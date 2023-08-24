import 'controller/comment_section_one_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:daone/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CommentSectionOneDialog extends StatelessWidget {
  CommentSectionOneDialog(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  CommentSectionOneController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: getHorizontalSize(
        317,
      ),
      padding: getPadding(
        left: 13,
        top: 16,
        right: 13,
        bottom: 16,
      ),
      decoration: AppDecoration.fill13.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder18,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: getPadding(
              left: 7,
              top: 7,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  svgPath: ImageConstant.imgArrowleftBlack900,
                  height: getVerticalSize(
                    12,
                  ),
                  width: getHorizontalSize(
                    17,
                  ),
                  margin: getMargin(
                    top: 3,
                    bottom: 5,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 49,
                  ),
                  child: Text(
                    "msg_share_your_thoughts".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.titleSmallPoppinsGray90001,
                  ),
                ),
              ],
            ),
          ),
          CustomTextFormField(
            controller: controller.group256Controller,
            margin: getMargin(
              top: 15,
            ),
            contentPadding: getPadding(
              top: 21,
              bottom: 21,
            ),
            textStyle: CustomTextStyles.labelSmallGray700,
            hintText: "lbl_write_here".tr,
            hintStyle: CustomTextStyles.labelSmallGray700,
            prefix: Container(
              margin: getMargin(
                left: 17,
                top: 17,
                bottom: 17,
              ),
              child: CustomImageView(
                svgPath: ImageConstant.imgInfoGray600,
              ),
            ),
            prefixConstraints: BoxConstraints(
              maxHeight: getVerticalSize(
                215,
              ),
            ),
            suffix: Container(
              margin: getMargin(
                left: 30,
                top: 18,
                right: 15,
                bottom: 18,
              ),
              child: CustomImageView(
                svgPath: ImageConstant.imgVector,
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: getVerticalSize(
                215,
              ),
            ),
            maxLines: 14,
            filled: true,
            fillColor: appTheme.whiteA700,
            defaultBorderDecoration: TextFormFieldStyleHelper.fillWhiteA700,
            enabledBorderDecoration: TextFormFieldStyleHelper.fillWhiteA700,
            focusedBorderDecoration: TextFormFieldStyleHelper.fillWhiteA700,
            disabledBorderDecoration: TextFormFieldStyleHelper.fillWhiteA700,
          ),
          Padding(
            padding: getPadding(
              top: 17,
            ),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgRectangle5933,
                  height: getVerticalSize(
                    59,
                  ),
                  width: getHorizontalSize(
                    111,
                  ),
                  radius: BorderRadius.circular(
                    getHorizontalSize(
                      10,
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgRectangle5934,
                  height: getVerticalSize(
                    59,
                  ),
                  width: getHorizontalSize(
                    111,
                  ),
                  radius: BorderRadius.circular(
                    getHorizontalSize(
                      10,
                    ),
                  ),
                  margin: getMargin(
                    left: 8,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              top: 19,
            ),
            child: Divider(
              height: getVerticalSize(
                1,
              ),
              thickness: getVerticalSize(
                1,
              ),
              color: appTheme.whiteA700,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: getPadding(
                top: 14,
                right: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 3,
                      bottom: 3,
                    ),
                    child: Text(
                      "lbl_cancel".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.labelSmallGray700,
                    ),
                  ),
                  CustomElevatedButton(
                    text: "lbl_share".tr,
                    margin: getMargin(
                      left: 30,
                    ),
                    buttonStyle:
                        CustomButtonStyles.fillDeeporangeA20006TL4.copyWith(
                            fixedSize: MaterialStateProperty.all<Size>(Size(
                      getHorizontalSize(
                        62,
                      ),
                      getVerticalSize(
                        21,
                      ),
                    ))),
                    buttonTextStyle: CustomTextStyles.labelSmallWhiteA7009,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
