import '../controller/select_affirmation_controller.dart';
import '../models/select_item_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectItemWidget extends StatelessWidget {
  SelectItemWidget(
    this.selectItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SelectItemModel selectItemModelObj;

  var controller = Get.find<SelectAffirmationController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        all: 12,
      ),
      decoration: AppDecoration.outline4.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder14,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle5912,
            height: getSize(
              123,
            ),
            width: getSize(
              123,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                8,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              top: 12,
              bottom: 2,
            ),
            child: Obx(
              () => Text(
                selectItemModelObj.myownaffirmatioTxt.value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: CustomTextStyles.labelLargeGray80001,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
