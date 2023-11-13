import '../../widgets/text_widget.dart';
import 'controller/save_or_edit_blog_controller.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/widgets/custom_elevated_button.dart';
import 'package:daone/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SaveOrEditBlogDialog extends StatelessWidget {
  SaveOrEditBlogDialog(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  SaveOrEditBlogController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: getHorizontalSize(
        318,
      ),
      padding: getPadding(
        left: 20,
        top: 22,
        right: 20,
        bottom: 22,
      ),
      decoration: AppDecoration.fill.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder22,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: getVerticalSize(
                209,
              ),
              width: getHorizontalSize(
                269,
              ),
              margin: getMargin(
                left: 2,
                top: 6,
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Obx(
                    () => Container(
                        height: getVerticalSize(
                          209,
                        ),
                        width: getHorizontalSize(
                          269,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              15,
                            ),
                          ),
                          image: controller.selectedBackground.value != ''
                              ? DecorationImage(
                                  image: NetworkImage(
                                      controller.selectedBackground.value),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: controller.selectedBackground.value == ''
                            ? Center(
                                child: TextWidget(
                                    text: "Add Background",
                                    color: Colors.white,
                                    fsize: 15))
                            : null // Center(child: TextWidget(text: "", color:Colors.white, fsize: 15))
                        ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: getHorizontalSize(
                        219,
                      ),
                      margin: getMargin(top: 20, bottom: 20),
                      child: Obx(
                        () => SingleChildScrollView(
                          child: TextWidget(
                            text: controller.displayText.value,
                            color: Colors.black,
                            fsize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomTextFormField(
              controller: controller.textEditingController,
              margin: getMargin(
                left: 2,
                top: 35,
                right: 6,
              ),
              contentPadding: getPadding(
                left: 5,
                right: 5,
              ),
              textStyle: CustomTextStyles.bodySmallGray9000310,
              hintText: "paste here".tr,
              hintStyle: CustomTextStyles.bodySmallGray9000310,
              textInputAction: TextInputAction.next,
              defaultBorderDecoration:
                  TextFormFieldStyleHelper.underLineGray30003,
              enabledBorderDecoration:
                  TextFormFieldStyleHelper.underLineGray30003,
              focusedBorderDecoration:
                  TextFormFieldStyleHelper.underLineGray30003,
              disabledBorderDecoration:
                  TextFormFieldStyleHelper.underLineGray30003,
            ),
            Padding(
              padding: getPadding(
                top: 26,
                right: 1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 5,
                      bottom: 3,
                    ),
                    child: Text(
                      "lbl_background".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.bodySmallGray9000311_1,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Get.dialog(
                          AlertDialog(
                            title: Text("Choose a Background"),
                            content: Obx(
                              () => SizedBox(
                                height: Get.height * 0.6,
                                width: Get.width * 0.7,
                                child: ListView.builder(
                                  itemCount:
                                      controller.availableBackgrounds.length,
                                  itemBuilder: (context, index) {
                                    final background =
                                        controller.availableBackgrounds[index];
                                    return InkWell(
                                      onTap: () {
                                        controller
                                            .setSelectedBackground(background);
                                        Get.back();
                                      },
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title:
                                                Text("Background ${index + 1}"),
                                          ),
                                          Container(
                                            height: Get.height * 0.05,
                                            width: Get.width * 0.5,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    controller
                                                            .availableBackgrounds[
                                                        index],
                                                  ),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Obx(
                        () => Container(
                          height: Get.height * 0.027,
                          width: Get.width * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: NetworkImage(
                                    controller.selectedBackground.value),
                                fit: BoxFit.cover),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            CustomElevatedButton(
              onTap: () {
                controller.higlightslist(context, controller.displayText.value,
                    controller.selectedBackground.value);
              },
              text: "lbl_save_to_profile".tr,
              margin: getMargin(
                left: 2,
                top: 24,
                right: 7,
              ),
              buttonStyle: CustomButtonStyles.fillDeeporangeA20001.copyWith(
                  fixedSize: MaterialStateProperty.all<Size>(Size(
                double.maxFinite,
                getVerticalSize(
                  46,
                ),
              ))),
              buttonTextStyle: CustomTextStyles.titleMediumWhiteA700Medium_2,
            ),
          ],
        ),
      ),
    );
  }
}
