import '../controller/select_task_controller.dart';
import '../models/select_task_item_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectTaskItemWidget extends StatelessWidget {
  SelectTaskItemWidget(
    this.selectTaskItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SelectTaskItemModel selectTaskItemModelObj;

  var controller = Get.find<SelectTaskController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 42,
        top: 21,
        right: 42,
        bottom: 21,
      ),
      decoration: AppDecoration.fill4.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder14,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomIconButton(
            height: 48,
            width: 48,
            padding: getPadding(
              all: 9,
            ),
            decoration: IconButtonStyleHelper.fillIndigoA10002,
            child: CustomImageView(
              svgPath: ImageConstant.imgGroup14,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 9,
              bottom: 15,
            ),
            child: Obx(
              () => Text(
                selectTaskItemModelObj.workoutTxt.value,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: CustomTextStyles.titleSmallHindSiliguriIndigo90001,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
