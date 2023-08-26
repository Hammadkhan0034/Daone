import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/register_page_one_screen/models/register_page_one_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the RegisterPageOneScreen.
///
/// This class manages the state of the RegisterPageOneScreen, including the
/// current registerPageOneModelObj
class RegisterPageOneController extends GetxController {
  TextEditingController fullnameController = TextEditingController();

  TextEditingController phonenumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<RegisterPageOneModel> registerPageOneModelObj = RegisterPageOneModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isCheckbox = false.obs;

  @override
  void onClose() {
    super.onClose();
    fullnameController.dispose();
    phonenumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
