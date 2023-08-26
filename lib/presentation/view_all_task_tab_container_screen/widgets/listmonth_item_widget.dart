import '../controller/view_all_task_tab_container_controller.dart';
import '../models/listmonth_item_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListmonthItemWidget extends StatelessWidget {
  ListmonthItemWidget(
    this.listmonthItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ListmonthItemModel listmonthItemModelObj;

  var controller = Get.find<ViewAllTaskTabContainerController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 20,
        top: 7,
        right: 20,
        bottom: 7,
      ),
      decoration: AppDecoration.outline6.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder14,
      ),
      width: getHorizontalSize(
        64,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: getPadding(
              top: 1,
            ),
            child: Text(
              "lbl_july".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: CustomTextStyles.bodySmallGray90001,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 1,
            ),
            child: Obx(
              () => Text(
                listmonthItemModelObj.dayTxt.value,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 2,
              top: 3,
            ),
            child: Obx(
              () => Text(
                listmonthItemModelObj.dayofweekTxt.value,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: CustomTextStyles.bodySmallGray90001,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
