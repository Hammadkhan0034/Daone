import '../view_friends_page/widgets/view_friends1_item_widget.dart';
import 'controller/view_friends_controller.dart';
import 'models/view_friends1_item_model.dart';
import 'models/view_friends_model.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_drop_down.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

class ViewFriendsPage extends StatelessWidget {
  ViewFriendsPage({Key? key})
      : super(
          key: key,
        );

  ViewFriendsController controller =
      Get.put(ViewFriendsController(ViewFriendsModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                width: double.maxFinite,
                child: Padding(
                  padding: getPadding(
                    left: 29,
                    top: 31,
                    right: 20,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(

                          child: Obx(
                            () => ListView.separated(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (
                                context,
                                index,
                              ) {
                                return Padding(
                                  padding: getPadding(
                                    top: 15.5,
                                    bottom: 15.5,
                                  ),
                                  child: SizedBox(
                                    width: getHorizontalSize(
                                      169,
                                    ),
                                    child: Divider(
                                      height: getVerticalSize(
                                        1,
                                      ),
                                      thickness: getVerticalSize(
                                        1,
                                      ),
                                      color: appTheme.blueGray100,
                                    ),
                                  ),
                                );
                              },
                              itemCount: controller.viewFriendsModelObj.value
                                  .viewFriends1ItemList.value.length,
                              itemBuilder: (context, index) {
                                ViewFriends1ItemModel model = controller
                                    .viewFriendsModelObj
                                    .value
                                    .viewFriends1ItemList
                                    .value[index];
                                return ViewFriends1ItemWidget(
                                  model,
                                );
                              },
                            ),
                          ),
                        ),
                        CustomElevatedButton(
                          width: getHorizontalSize(
                            307,
                          ),
                          height: getVerticalSize(
                            60,
                          ),
                          text: "lbl_create_group".tr,
                          margin: getMargin(
                            left: 5,
                            top: 153,
                            right: 14,
                          ),
                          buttonStyle: CustomButtonStyles.outlineIndigoA1004c
                              .copyWith(
                                  fixedSize:
                                      MaterialStateProperty.all<Size>(Size(
                            double.maxFinite,
                            getVerticalSize(
                              60,
                            ),
                          ))),
                          decoration: CustomButtonStyles
                              .outlineIndigoA1004cDecoration,
                          buttonTextStyle:
                              CustomTextStyles.titleMediumWhiteA700,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
