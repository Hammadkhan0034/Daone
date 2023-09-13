import 'package:daone/presentation/affirmation_blast_effect_dialog/affirmation_blast_effect_dialog.dart';
import 'package:daone/presentation/affirmation_blast_effect_dialog/controller/affirmation_blast_effect_controller.dart';
import 'package:daone/presentation/edit_affirmation_dialog/controller/edit_affirmation_controller.dart';
import 'package:daone/presentation/edit_affirmation_dialog/edit_affirmation_dialog.dart';

import 'controller/affirmation_blast_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class AffirmationBlastDialog extends StatelessWidget {
  AffirmationBlastDialog(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  AffirmationBlastController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: getHorizontalSize(
        318,
      ),
      padding: getPadding(
        left: 21,
        top: 24,
        right: 21,
        bottom: 24,
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
              238,
            ),
            width: getHorizontalSize(
              269,
            ),
            child: Stack(
              alignment: Alignment.topCenter,
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
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: getHorizontalSize(
                      219,
                    ),
                    margin: getMargin(
                      top: 45,
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
                    onTap: () {
                      Get.toNamed(AppRoutes.selectAffirmationScreen);
                    },

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
                    onTap: (){
                      Get.dialog(AlertDialog(backgroundColor: Colors.transparent,
                        contentPadding: EdgeInsets.zero,
                        insetPadding: const EdgeInsets.only(left: 0),
                        content:EditAffirmationDialog(Get.put(EditAffirmationController(),),),));
                    },
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
            onTap: (){
              Get.dialog(AlertDialog(backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
                insetPadding: const EdgeInsets.only(left: 0),
                content:AffirmationBlastEffectDialog(Get.put(AffirmationBlastEffectController(),),),));
            },
            text: "msg_blast_affirmation".tr,
            margin: getMargin(
              top: 19,
              right: 6,
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
