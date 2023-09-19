import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/login_page_screen/models/login_page_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text_widget.dart';

/// A controller class for the LoginPageScreen.
///
/// This class manages the state of the LoginPageScreen, including the
/// current loginPageModelObj
class LoginPageController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<LoginPageModel> loginPageModelObj = LoginPageModel().obs;

  Rx<bool> isShowPassword = true.obs;

  late BuildContext context;

  late var errorMessage;

  final formKey = GlobalKey<FormState>();

  void logIn(String email,String password,var context)async{
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent user from dismissing the dialog
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(color: Colors.deepOrange),
        );
      },
    );
    try {
      if (formKey.currentState!.validate()) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email, password: password).then((value) =>
        {
              Get.offAndToNamed(AppRoutes.dashboardRoute)?.catchError(
                      (e){
                        Get.snackbar("Error ",e);
                      }
              ),
        });
      }
    }on FirebaseAuthException catch(e){
      switch(e.code){
        case "user-not-found" :
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided for that user.';
          break;
        default:
          errorMessage = 'An error occurred during authentication.';
      } final snackBar = SnackBar(content: Text(errorMessage!,style: TextStyle(color:Colors.black),));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print(errorMessage);

    }
  }


  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
