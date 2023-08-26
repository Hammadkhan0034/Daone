import '../controller/task_empty_controller.dart';
import '../models/listgroup_item_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListgroupItemWidget extends StatelessWidget {
  ListgroupItemWidget(
    this.listgroupItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ListgroupItemModel listgroupItemModelObj;

  var controller = Get.find<TaskEmptyController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getHorizontalSize(
        66,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: getHorizontalSize(
            66,
          ),
          padding: getPadding(
            left: 22,
            top: 4,
            right: 22,
            bottom: 4,
          ),
          decoration: AppDecoration.txtFill1.copyWith(
            borderRadius: BorderRadiusStyle.txtRoundedBorder16,
          ),
          child: Obx(
            () => Text(
              listgroupItemModelObj.groupTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: CustomTextStyles.titleSmallPoppinsWhiteA70015,
            ),
          ),
        ),
      ),
    );
  }
}
