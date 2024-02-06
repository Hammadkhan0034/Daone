import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/login_page_screen/models/login_page_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';






class LoginPageController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Rx<LoginPageModel> loginPageModelObj = LoginPageModel().obs;

  RxBool isLoading = false.obs;
  RxBool isLoading1 = false.obs;
  Rx<bool> isShowPassword = true.obs;
  late BuildContext context;


  final formKey = GlobalKey<FormState>();
  RxString errorMessage = ''.obs;


  void logIn(String email, String password,BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent user from dismissing the dialog
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(color: Colors.deepOrange
          ),
        );
      },
    );
    try {
      if (formKey.currentState!.validate()) {
        await
        FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // If sign-in is successful, navigate to the dashboard using GetX
        Get.offAllNamed(AppRoutes.dashboardRoute);
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "user-not-found":
          errorMessage.value = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage.value = 'Wrong password provided for that user.';
          break;
        default:
          errorMessage.value = 'An error occurred during authentication.';
      }
      // Show a Snackbar with the error message
      Get.snackbar(
        "Authentication Error",
        errorMessage.value,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }







  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> handleSignIn() async {
    isLoading(true); // Show the progress indicator
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult = await _auth.signInWithCredential(credential);
      final User? user = authResult.user;
      isLoading.value = false; // Hide the progress indicator

      return user;
    } catch (error) {
      isLoading.value = false; // Hide the progress indicator
      Get.snackbar(
        "Authentication Error",
        error.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      print(error);
      return null;
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: ['email'],
    );

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    var userData = await FacebookAuth.instance.getUserData();
    var userEmail =userData['email'];
    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
