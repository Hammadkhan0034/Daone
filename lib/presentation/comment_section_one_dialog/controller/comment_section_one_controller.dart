import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/comment_section_one_dialog/models/comment_section_one_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the CommentSectionOneDialog.
///
/// This class manages the state of the CommentSectionOneDialog, including the
/// current commentSectionOneModelObj
class CommentSectionOneController extends GetxController {
  TextEditingController group256Controller = TextEditingController();

  Rx<CommentSectionOneModel> commentSectionOneModelObj =
      CommentSectionOneModel().obs;

  @override
  void onClose() {
    super.onClose();
    group256Controller.dispose();
  }
}
