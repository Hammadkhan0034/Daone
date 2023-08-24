import '../controller/task_empty_controller.dart';
import '../models/listmonth1_item_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Listmonth1ItemWidget extends StatelessWidget {
  Listmonth1ItemWidget(
    this.listmonth1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Listmonth1ItemModel listmonth1ItemModelObj;

  var controller = Get.find<TaskEmptyController>();

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
                listmonth1ItemModelObj.dayTxt.value,
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
                listmonth1ItemModelObj.dayofweekTxt.value,
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
