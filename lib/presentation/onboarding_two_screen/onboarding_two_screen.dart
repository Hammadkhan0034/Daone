import 'controller/onboarding_two_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_image.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class OnboardingTwoScreen extends GetWidget<OnboardingTwoController> {
  const OnboardingTwoScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: getVerticalSize(
                  406,
                ),
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgVector218x375,
                      height: getVerticalSize(
                        218,
                      ),
                      width: getHorizontalSize(
                        375,
                      ),
                      alignment: Alignment.topCenter,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: getMargin(
                          left: 7,
                          right: 8,
                          top: 20,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: fs.Svg(
                              ImageConstant.imgFrame,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: getVerticalSize(20)),
                          child: CustomAppBar(
                            height: getVerticalSize(
                              105,
                            ),
                            title: AppbarImage(
                              height: getVerticalSize(
                                105,
                              ),
                              width: getHorizontalSize(
                                47,
                              ),
                              imagePath: ImageConstant.img868722,
                              margin: getMargin(
                                left: 71,
                              ),
                            ),
                            actions: [
                              Padding(
                                padding: EdgeInsets.only(top: getVerticalSize(20)),
                                child: AppbarImage(
                                  height: getVerticalSize(
                                    150,
                                  ),
                                  width: getHorizontalSize(
                                    47,
                                  ),
                                  imagePath: ImageConstant.img868721,
                                  margin: getMargin(
                                    left: 80,
                                    right: 80,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 62,
                ),
                child: Text(
                  "msg_create_a_positive".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.headlineSmallGray90002,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  313,
                ),
                margin: getMargin(
                  left: 30,
                  top: 16,
                  right: 31,
                ),
                child: Text(
                  "msg_unleash_the_potential".tr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              Spacer(),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Card(
              //     clipBehavior: Clip.antiAlias,
              //     elevation: 0,
              //     margin: getMargin(
              //       right: 30,
              //       bottom: 40,
              //     ),
              //     shape: RoundedRectangleBorder(
              //       side: BorderSide(
              //         color: appTheme.gray50,
              //         width: getHorizontalSize(
              //           1,
              //         ),
              //       ),
              //       borderRadius: BorderRadiusStyle.circleBorder30,
              //     ),
              //     child: Container(
              //       height: getSize(
              //         60,
              //       ),
              //       width: getSize(
              //         60,
              //       ),
              //       decoration: AppDecoration.outline.copyWith(
              //         borderRadius: BorderRadiusStyle.circleBorder30,
              //       ),
              //       child: Stack(
              //         children: [
              //           CustomImageView(
              //             imagePath: ImageConstant.imgEllipse3,
              //             height: getVerticalSize(
              //               60,
              //             ),
              //             width: getHorizontalSize(
              //               30,
              //             ),
              //             alignment: Alignment.centerRight,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        floatingActionButton: CustomFloatingButton(
          onTap: (){
            Get.toNamed(AppRoutes.onboardingThreeScreen);
          },
          height: 75,
          width: 75,
          child: CustomImageView(
            svgPath: ImageConstant.imgArrowright,
            height: getVerticalSize(
              25.0,
            ),
            width: getHorizontalSize(
              25.0,
            ),
          ),
        ),
      ),
    );
  }
}
