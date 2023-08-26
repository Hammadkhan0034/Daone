import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/save_or_edit_blog_dialog/models/save_or_edit_blog_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SaveOrEditBlogDialog.
///
/// This class manages the state of the SaveOrEditBlogDialog, including the
/// current saveOrEditBlogModelObj
class SaveOrEditBlogController extends GetxController {
  TextEditingController statementController = TextEditingController();

  TextEditingController fontfamilyController = TextEditingController();

  Rx<SaveOrEditBlogModel> saveOrEditBlogModelObj = SaveOrEditBlogModel().obs;

  @override
  void onClose() {
    super.onClose();
    statementController.dispose();
    fontfamilyController.dispose();
  }
}
