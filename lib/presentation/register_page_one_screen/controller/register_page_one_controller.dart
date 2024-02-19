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

  Rx<UserModel> registerPageOneModelObj = UserModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isCheckbox = false.obs;

  final auth = FirebaseAuth.instance;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late BuildContext context;

  void signUp(String email, String pass, var context) async {
    if (formKey.currentState!.validate()) {
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
        })
            .catchError((e) {
          final errorMessage = "An error occurred during sign-up.";
          final snackBar = SnackBar(content: Text(errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      } on FirebaseAuthException catch (error) {
        String errorMessage = ""; // Initialize an empty string
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
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
            errorMessage = "An undefined Error happened.";
        }
        final snackBar = SnackBar(content: Text(errorMessage));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print(errorMessage);
      } finally{
        Get.back();
      }
    }
  }




  postDetailsToFirestore()async{
    //calling our firestore
    //calling our user Model
    //sending thes values
    FirebaseFirestore  firebaseFirestore= FirebaseFirestore.instance;
    User? user = auth.currentUser;

    UserModel userModel= UserModel();

    //writing all the values
    userModel.fullName = fullnameController.text;
    userModel.email = user!.email;
    userModel.uid = user!.uid;
    userModel.phoneNumber =phonenumberController.text;
    userModel.imageUrl ='https://cdn3.iconfinder.com/data/icons/essential-rounded/64/Rounded-31-512.png';

    await firebaseFirestore
        .collection('users')
        .doc(user!.email)
        .set(userModel.toMap());
    SnackBar(content: Text("account create successfully"));
    print('account created');
    Get.offAndToNamed(AppRoutes.successRegistrationScreen);
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
