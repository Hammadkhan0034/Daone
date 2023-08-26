import '../controller/view_friends_one_controller.dart';
import '../models/view_friends_item_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewFriendsItemWidget extends StatelessWidget {
  ViewFriendsItemWidget(
    this.viewFriendsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ViewFriendsItemModel viewFriendsItemModelObj;

  var controller = Get.find<ViewFriendsOneController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 11,
        top: 10,
        right: 11,
        bottom: 10,
      ),
      decoration: AppDecoration.outline12.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder14,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse262,
            height: getSize(
              56,
            ),
            width: getSize(
              56,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                28,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 11,
              top: 19,
              bottom: 18,
            ),
            child: Obx(
              () => Text(
                viewFriendsItemModelObj.nameTxt.value,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: CustomTextStyles.bodySmallGray90003,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 35,
              top: 7,
              bottom: 8,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    viewFriendsItemModelObj.gradeTxt.value,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.titleLargeDeeporangeA20006,
                  ),
                ),
                Text(
                  "lbl_average".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.labelSmallGray60004,
                ),
              ],
            ),
          ),
          CustomElevatedButton(
            text: "lbl_view_more".tr,
            margin: getMargin(
              left: 46,
              top: 18,
              bottom: 15,
            ),
            buttonStyle: CustomButtonStyles.fillDeeporangeA20006.copyWith(
                fixedSize: MaterialStateProperty.all<Size>(Size(
              getHorizontalSize(
                64,
              ),
              getVerticalSize(
                23,
              ),
            ))),
            buttonTextStyle: CustomTextStyles.bodySmallWhiteA7008,
          ),
        ],
      ),
    );
  }
}
