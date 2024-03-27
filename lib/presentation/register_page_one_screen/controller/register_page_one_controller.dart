import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/register_page_one_screen/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
/// A controller class for the RegisterPageOneScreen.
///
/// This class manages the state of the RegisterPageOneScreen, including the
/// current registerPageOneModelObj
class RegisterPageOneController extends GetxController {
  TextEditingController fullnameController = TextEditingController();

  TextEditingController phonenumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();


  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isCheckbox = false.obs;

  final auth = FirebaseAuth.instance;


  late BuildContext context;

  void signUp(String email, String pass, var context) async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(color: Colors.deepOrange),
          );
        },
      );
      try {
        await auth
            .createUserWithEmailAndPassword(email: email, password: pass)
            .then((value) {
          postDetailsToFirestore();
        });
        //     .catchError((e) {
        //   final errorMessage = "An error occurred during sign-up.";
        //   final snackBar = SnackBar(content: Text(errorMessage));
        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // });
      } on FirebaseAuthException catch (error) {
        String errorMessage = ""; // Initialize an empty string
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
            case "email-already-in-use":
            errorMessage = "Email is already linked to an other account.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.Please check your internet connection and try again.";
        }
        final snackBar = SnackBar(content: Text(errorMessage));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print(errorMessage);
      }

      finally{
        Get.back();
      }
    }





  postDetailsToFirestore()async{
    FirebaseFirestore  firebaseFirestore= FirebaseFirestore.instance;
    User? user = auth.currentUser;
    UserModel userModel= UserModel(searchCase: fullnameController.text.toLowerCase(), uid: user!.uid, fullName: fullnameController.text, phoneNumber: phonenumberController.text, email: user.email!.toLowerCase(),imageUrl: 'https://cdn3.iconfinder.com/data/icons/essential-rounded/64/Rounded-31-512.png');
    await firebaseFirestore
        .collection('users')
        .doc(user.email)
        .set(userModel.toMap());
    SnackBar(content: Text("account create successfully"));
    print('account created');
    Get.offAllNamed(AppRoutes.successRegistrationScreen);
  }
  String? errorMessage;


  @override
  void onClose() {
    super.onClose();
    fullnameController.dispose();
    phonenumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
