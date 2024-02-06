import '../controller/personal_data_update_controller.dart';
import '../models/griduntiteleven_item_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GriduntitelevenItemWidget extends StatelessWidget {
  GriduntitelevenItemWidget(
    this.griduntitelevenItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  GriduntitelevenItemModel griduntitelevenItemModelObj;

  var controller = Get.find<PersonalDataUpdateController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.all(0),
      color: appTheme.whiteA700,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: appTheme.deepOrangeA20006,
          width: getHorizontalSize(
            1,
          ),
        ),
        borderRadius: BorderRadiusStyle.circleBorder30,
      ),
      child: Container(
        height: getVerticalSize(
          142,
        ),
        width: getHorizontalSize(
          146,
        ),
        padding: getPadding(
          left: 23,
          top: 21,
          right: 23,
          bottom: 21,
        ),
        decoration: AppDecoration.outline14.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder30,
        ),
        child: Stack(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgUntit11,
              height: getSize(
                99,
              ),
              width: getSize(
                99,
              ),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
