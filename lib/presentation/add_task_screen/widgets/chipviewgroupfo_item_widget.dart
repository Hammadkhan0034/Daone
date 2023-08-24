import '../models/chipviewgroupfo_item_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChipviewgroupfoItemWidget extends StatelessWidget {
  ChipviewgroupfoItemWidget(
    this.chipviewgroupfoItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ChipviewgroupfoItemModel chipviewgroupfoItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: getPadding(
          left: 20,
          right: 20,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          chipviewgroupfoItemModelObj.groupfortysevenTxt.value,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: chipviewgroupfoItemModelObj.isSelected.value
                ? appTheme.cyan400
                : appTheme.pinkA100,
            fontSize: getFontSize(
              14,
            ),
            fontFamily: 'Hind Siliguri',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: chipviewgroupfoItemModelObj.isSelected.value,
        backgroundColor: appTheme.red50,
        selectedColor: appTheme.cyan5001,
        shape: chipviewgroupfoItemModelObj.isSelected.value
            ? RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    17,
                  ),
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    17,
                  ),
                ),
              ),
        onSelected: (value) {
          chipviewgroupfoItemModelObj.isSelected.value = value;
        },
      ),
    );
  }
}
