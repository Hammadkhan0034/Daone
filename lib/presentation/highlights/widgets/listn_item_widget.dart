import '../controller/personal_data_update_one_controller.dart';
import '../models/listn_item_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListnItemWidget extends StatelessWidget {
  ListnItemWidget(
    this.listnItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ListnItemModel listnItemModelObj;

  var controller = Get.find<PersonalDataUpdateOneController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 20,
        top: 17,
        right: 20,
        bottom: 17,
      ),
      decoration: AppDecoration.outline16.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder18,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: getPadding(
              left: 2,
            ),
            child: Row(
              children: [
                CustomOutlinedButton(
                  text: "lbl_n2".tr,
                  buttonStyle: CustomButtonStyles.outlineBlack900.copyWith(
                      fixedSize: MaterialStateProperty.all<Size>(Size(
                    getHorizontalSize(
                      44,
                    ),
                    getVerticalSize(
                      44,
                    ),
                  ))),
                  buttonTextStyle: CustomTextStyles.bodyLargePoppinsGray90003,
                ),
                Padding(
                  padding: getPadding(
                    left: 15,
                    top: 7,
                    bottom: 6,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_you_highlighted".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.labelMediumGray90003Medium,
                      ),
                      Text(
                        "msg_02_august_2023_at".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.poppinsOnError,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              left: 10,
              top: 17,
            ),
            child: Text(
              "msg_repeating_affirmations".tr,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: CustomTextStyles.bodyMediumBlack900_1,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 12,
              top: 9,
              bottom: 9,
            ),
            child: Text(
              "msg_posted_on_02_august".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: CustomTextStyles.poppinsOnError,
            ),
          ),
        ],
      ),
    );
  }
}
