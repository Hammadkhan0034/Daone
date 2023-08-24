import 'controller/affirmation_blast_effect_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class AffirmationBlastEffectDialog extends StatelessWidget {
  AffirmationBlastEffectDialog(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  AffirmationBlastEffectController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: getHorizontalSize(
        318,
      ),
      padding: getPadding(
        left: 21,
        top: 1,
        right: 21,
        bottom: 1,
      ),
      decoration: AppDecoration.fill.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder22,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: getVerticalSize(
              261,
            ),
            width: getHorizontalSize(
              269,
            ),
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: getVerticalSize(
                      238,
                    ),
                    width: getHorizontalSize(
                      269,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgRectangle11,
                          height: getVerticalSize(
                            238,
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
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: getVerticalSize(
                              173,
                            ),
                            width: getHorizontalSize(
                              256,
                            ),
                            margin: getMargin(
                              bottom: 19,
                            ),
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: SizedBox(
                                    width: getHorizontalSize(
                                      219,
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
                                CustomImageView(
                                  svgPath: ImageConstant.imgLayer1,
                                  height: getVerticalSize(
                                    110,
                                  ),
                                  width: getHorizontalSize(
                                    116,
                                  ),
                                  alignment: Alignment.bottomRight,
                                  margin: getMargin(
                                    bottom: 1,
                                  ),
                                ),
                                CustomImageView(
                                  svgPath: ImageConstant.imgLayer1LightGreen700,
                                  height: getVerticalSize(
                                    126,
                                  ),
                                  width: getHorizontalSize(
                                    128,
                                  ),
                                  alignment: Alignment.bottomLeft,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomImageView(
                  svgPath: ImageConstant.imgLayer1DeepOrange600,
                  height: getVerticalSize(
                    110,
                  ),
                  width: getHorizontalSize(
                    119,
                  ),
                  alignment: Alignment.topLeft,
                  margin: getMargin(
                    left: 52,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              left: 3,
              top: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    text: "lbl_select".tr,
                    margin: getMargin(
                      right: 4,
                    ),
                    buttonStyle: CustomButtonStyles.fillGreen300.copyWith(
                        fixedSize: MaterialStateProperty.all<Size>(Size(
                      double.maxFinite,
                      getVerticalSize(
                        40,
                      ),
                    ))),
                    buttonTextStyle: CustomTextStyles.bodyMediumWhiteA700,
                  ),
                ),
                Expanded(
                  child: CustomElevatedButton(
                    text: "lbl_add_new".tr,
                    margin: getMargin(
                      left: 4,
                    ),
                    buttonStyle: CustomButtonStyles.fillGray90003.copyWith(
                        fixedSize: MaterialStateProperty.all<Size>(Size(
                      double.maxFinite,
                      getVerticalSize(
                        40,
                      ),
                    ))),
                    buttonTextStyle: CustomTextStyles.bodyMediumWhiteA700,
                  ),
                ),
              ],
            ),
          ),
          CustomElevatedButton(
            text: "msg_blast_affirmation".tr,
            margin: getMargin(
              top: 19,
              right: 6,
              bottom: 23,
            ),
            buttonStyle: CustomButtonStyles.radiusTL28.copyWith(
                fixedSize: MaterialStateProperty.all<Size>(Size(
              double.maxFinite,
              getVerticalSize(
                57,
              ),
            ))),
            buttonTextStyle: CustomTextStyles.titleMediumWhiteA700Medium_2,
          ),
        ],
      ),
    );
  }
}
