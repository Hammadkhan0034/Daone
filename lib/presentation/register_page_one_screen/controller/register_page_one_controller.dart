import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/register_page_one_screen/models/register_page_one_model.dart';
import 'package:daone/presentation/sleep_tracking_section/controller/sleep_tracking_controller.dart';
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

  Rx<RegisterPageOneModel> registerPageOneModelObj = RegisterPageOneModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isCheckbox = false.obs;

  final auth = FirebaseAuth.instance;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SleepTrackingController _sleepTrackingController =Get.put(SleepTrackingController());

  late BuildContext context;
  void signUp(String email,pass,var context)async{
    if(formKey.currentState!.validate()){
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
      try{
        await auth
            .createUserWithEmailAndPassword(email: email, password: pass)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e){
          SnackBar(content:Text(e));
        });
      }on FirebaseAuthException catch(error){
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
        }  final snackBar = SnackBar(content: Text(errorMessage!));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print(errorMessage);


      }
    }

  }
  postDetailsToFirestore()async{
    //calling our firestore
    //calling our user Model
    //sending thes values
    FirebaseFirestore  firebaseFirestore= FirebaseFirestore.instance;
    User? user = auth.currentUser;

    RegisterPageOneModel userModel= RegisterPageOneModel();

    //writing all the values
    userModel.fullName = fullnameController.text;
    userModel.email = user!.email;
    userModel.uid = user!.uid;
    userModel.phoneNumber =phonenumberController.text;
    userModel.imageUrl ='https://cdn3.iconfinder.com/data/icons/essential-rounded/64/Rounded-31-512.png';

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.toMap());
    SnackBar(content: Text("acount create successfully"));
    print('acount created');
    _sleepTrackingController.saveSleepDatabase();
    Get.off(AppRoutes.successRegistrationScreen);

    

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
