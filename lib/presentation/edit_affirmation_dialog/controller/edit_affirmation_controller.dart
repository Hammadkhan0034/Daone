import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/edit_affirmation_dialog/models/edit_affirmation_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the EditAffirmationDialog.
///
/// This class manages the state of the EditAffirmationDialog, including the
/// current editAffirmationModelObj
class EditAffirmationController extends GetxController {
  TextEditingController messageController = TextEditingController();

  Rx<EditAffirmationModel> editAffirmationModelObj = EditAffirmationModel().obs;

  @override
  void onClose() {
    super.onClose();
    messageController.dispose();
  }
}
