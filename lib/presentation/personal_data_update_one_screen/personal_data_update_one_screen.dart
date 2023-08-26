import '../personal_data_update_one_screen/widgets/listn_item_widget.dart';
import 'controller/personal_data_update_one_controller.dart';
import 'models/listn_item_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/app_bar/appbar_iconbutton.dart';
import 'package:daone/widgets/app_bar/appbar_image.dart';
import 'package:daone/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:daone/widgets/app_bar/custom_app_bar.dart';
import 'package:daone/widgets/custom_bottom_bar.dart';
import 'package:daone/widgets/custom_drop_down.dart';
import 'package:daone/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class PersonalDataUpdateOneScreen
    extends GetWidget<PersonalDataUpdateOneController> {
  const PersonalDataUpdateOneScreen({Key? key})
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
            81,
          ),
          leadingWidth: 77,
          leading: AppbarIconbutton(
            svgPath: ImageConstant.imgInfo,
            margin: getMargin(
              left: 29,
              top: 4,
              bottom: 4,
            ),
          ),
          centerTitle: true,
          title: AppbarSubtitle2(
            text: "lbl_highlights".tr,
          ),
          actions: [
            AppbarImage(
              height: getSize(
                40,
              ),
              width: getSize(
                40,
              ),
              svgPath: ImageConstant.imgFolder,
              margin: getMargin(
                left: 30,
                top: 4,
                right: 30,
                bottom: 12,
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 44,
            ),
            child: Padding(
              padding: getPadding(
                left: 29,
                right: 29,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: getVerticalSize(
                          189,
                        ),
                        child: VerticalDivider(
                          width: getHorizontalSize(
                            2,
                          ),
                          thickness: getVerticalSize(
                            2,
                          ),
                          color: appTheme.gray80003,
                          indent: getHorizontalSize(
                            55,
                          ),
                          endIndent: getHorizontalSize(
                            39,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Obx(
                          () => ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (
                              context,
                              index,
                            ) {
                              return SizedBox(
                                height: getVerticalSize(
                                  18,
                                ),
                              );
                            },
                            itemCount: controller.personalDataUpdateOneModelObj
                                .value.listnItemList.value.length,
                            itemBuilder: (context, index) {
                              ListnItemModel model = controller
                                  .personalDataUpdateOneModelObj
                                  .value
                                  .listnItemList
                                  .value[index];
                              return ListnItemWidget(
                                model,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: getPadding(
                      top: 18,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: getVerticalSize(
                            189,
                          ),
                          child: VerticalDivider(
                            width: getHorizontalSize(
                              2,
                            ),
                            thickness: getVerticalSize(
                              2,
                            ),
                            color: appTheme.gray80003,
                            indent: getHorizontalSize(
                              55,
                            ),
                            endIndent: getHorizontalSize(
                              39,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: getMargin(
                              left: 12,
                            ),
                            padding: getPadding(
                              left: 20,
                              top: 17,
                              right: 20,
                              bottom: 17,
                            ),
                            decoration: AppDecoration.outline16.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder18,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    left: 2,
                                  ),
                                  child: Row(
                                    children: [
                                      CustomOutlinedButton(
                                        text: "lbl_n2".tr,
                                        buttonStyle: CustomButtonStyles
                                            .outlineBlack900
                                            .copyWith(
                                                fixedSize: MaterialStateProperty
                                                    .all<Size>(Size(
                                          getHorizontalSize(
                                            44,
                                          ),
                                          getVerticalSize(
                                            44,
                                          ),
                                        ))),
                                        buttonTextStyle: CustomTextStyles
                                            .bodyLargePoppinsGray90003,
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          left: 15,
                                          top: 7,
                                          bottom: 6,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "lbl_you_highlighted".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .labelMediumGray90003Medium,
                                            ),
                                            Text(
                                              "msg_02_august_2023_at".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .poppinsOnError,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: getHorizontalSize(
                                    250,
                                  ),
                                  margin: getMargin(
                                    left: 10,
                                    top: 17,
                                  ),
                                  child: Text(
                                    "msg_repeating_affirmations".tr,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        CustomTextStyles.bodyMediumBlack900_1,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 12,
                                    top: 9,
                                    bottom: 9,
                                  ),
                                  child: Text(
                                    "msg_posted_on_02_august".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.poppinsOnError,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 18,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: getVerticalSize(
                            174,
                          ),
                          child: VerticalDivider(
                            width: getHorizontalSize(
                              2,
                            ),
                            thickness: getVerticalSize(
                              2,
                            ),
                            color: appTheme.gray80003,
                            indent: getHorizontalSize(
                              55,
                            ),
                            endIndent: getHorizontalSize(
                              24,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: getMargin(
                              left: 12,
                            ),
                            padding: getPadding(
                              left: 20,
                              top: 17,
                              right: 20,
                              bottom: 17,
                            ),
                            decoration: AppDecoration.outline16.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder18,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    left: 2,
                                  ),
                                  child: Row(
                                    children: [
                                      CustomOutlinedButton(
                                        text: "lbl_n2".tr,
                                        buttonStyle: CustomButtonStyles
                                            .outlineBlack900
                                            .copyWith(
                                                fixedSize: MaterialStateProperty
                                                    .all<Size>(Size(
                                          getHorizontalSize(
                                            44,
                                          ),
                                          getVerticalSize(
                                            44,
                                          ),
                                        ))),
                                        buttonTextStyle: CustomTextStyles
                                            .bodyLargePoppinsGray90003,
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          left: 15,
                                          top: 7,
                                          bottom: 6,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "lbl_you_highlighted".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .labelMediumGray90003Medium,
                                            ),
                                            Text(
                                              "msg_02_august_2023_at".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .poppinsOnError,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: getHorizontalSize(
                                    250,
                                  ),
                                  margin: getMargin(
                                    left: 10,
                                    top: 17,
                                  ),
                                  child: Text(
                                    "msg_repeating_affirmations".tr,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        CustomTextStyles.bodyMediumBlack900_1,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 12,
                                    top: 9,
                                    bottom: 9,
                                  ),
                                  child: Text(
                                    "msg_posted_on_02_august".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.poppinsOnError,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {},
        ),
      ),
    );
  }
}
