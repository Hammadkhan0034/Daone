import 'controller/congratulations_page_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class CongratulationsPageScreen
    extends GetWidget<CongratulationsPageController> {
  const CongratulationsPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            110,
          ),
          centerTitle: true,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "lbl_congratulations".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: theme.textTheme.headlineLarge,
              ),
              Text(
                "msg_you_have_completed".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: CustomTextStyles.bodyMediumGray90001,
              ),
            ],
          ),
        ),
        body: Container(
          height: getVerticalSize(
            561,
          ),
          width: double.maxFinite,
          padding: getPadding(
            left: 4,
            top: 51,
            right: 4,
            bottom: 51,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgLayer1Indigo700,
                height: getVerticalSize(
                  130,
                ),
                width: getHorizontalSize(
                  306,
                ),
                alignment: Alignment.bottomCenter,
                margin: getMargin(
                  bottom: 54,
                ),
              ),
              CustomImageView(
                svgPath: ImageConstant.imgLayer1Orange200,
                height: getVerticalSize(
                  289,
                ),
                width: getHorizontalSize(
                  215,
                ),
                alignment: Alignment.bottomCenter,
                margin: getMargin(
                  bottom: 49,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: getPadding(
                    left: 59,
                    right: 59,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: fs.Svg(
                        ImageConstant.imgGroup49,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgLayer1BlueGray600,
                    height: getVerticalSize(
                      174,
                    ),
                    width: getHorizontalSize(
                      130,
                    ),
                  ),
                ),
              ),
              CustomImageView(
                svgPath: ImageConstant.imgLayer1DeepOrange200,
                height: getVerticalSize(
                  228,
                ),
                width: getHorizontalSize(
                  87,
                ),
                alignment: Alignment.bottomLeft,
                margin: getMargin(
                  left: 31,
                  bottom: 3,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomElevatedButton(
          width: getHorizontalSize(
            315,
          ),
          height: getVerticalSize(
            60,
          ),
          text: "lbl_back_to_home".tr,
          margin: getMargin(
            left: 30,
            right: 30,
            bottom: 40,
          ),
          buttonStyle: CustomButtonStyles.outlineIndigoA1004c.copyWith(
              fixedSize: MaterialStateProperty.all<Size>(Size(
            double.maxFinite,
            getVerticalSize(
              60,
            ),
          ))),
          decoration: CustomButtonStyles.outlineIndigoA1004cDecoration,
          buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
        ),
      ),
    );
  }
}
