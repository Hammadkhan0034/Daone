
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/personal_data_update_two_screen/models/personal_data_update_two_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// A controller class for the PersonalDataUpdateTwoScreen.
///
/// This class manages the state of the PersonalDataUpdateTwoScreen, including the
/// current personalDataUpdateTwoModelObj
class PersonalDataUpdateTwoController extends GetxController {
  TextEditingController lastnameController = TextEditingController();

  TextEditingController phonenumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController newpasswordController = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;

  Rx<PersonalDataUpdateTwoModel> personalDataUpdateTwoModelObj =
      PersonalDataUpdateTwoModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isShowPassword1 = true.obs;

  SelectionPopupModel? selectedDropDownValue;

  void onInit() {
    super.onInit();
    getImageUrl();
    print("yeahhhhhh");
  }

  @override
  void onClose() {
    super.onClose();
    lastnameController.dispose();
    phonenumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    newpasswordController.dispose();
  }

  Future<void> updatePassword(String? currentPassword, String? newPassword,BuildContext context) async {
    try {
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
      User? user = FirebaseAuth.instance.currentUser;

      // Reauthenticate the user with their current password
      AuthCredential credential = EmailAuthProvider.credential(email: user!.email!, password: currentPassword!);
      await user?.reauthenticateWithCredential(credential);

      // Update the password
      await user?.updatePassword(newPassword!);

      // Password updated successfully
      print("Password updated successfully");
      Get.toNamed(AppRoutes.loginPageScreen);
    } catch (e) {
      // Handle errors (e.g., wrong current password)
      print("Error updating password: $e");
    }
  }
// Update fields in a Firestore document
  Future<void> updateDocumentFields(String newNumber,String newName) async {
    // Get a reference to the Firestore document you want to update
    DocumentReference documentReference = FirebaseFirestore.instance.collection('users').doc(user?.email);

    try {

      // Update specific fields in the document
      await documentReference.update({
        'fullName': newName,
        'phoneNumber':newNumber,
      });
      Get.snackbar('Personal Data Info','Document fields updated successfully.');
      print('Document fields updated successfully.');
      Get.toNamed(AppRoutes.accountSettingScreen);
    } catch (e) {
      Get.snackbar('Error updating document','$e');
    }
  }



onSelected(dynamic value) {
    for (var element
        in personalDataUpdateTwoModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    personalDataUpdateTwoModelObj.value.dropdownItemList.refresh();
  }

  //image picking functions

  RxString imagePath= "".obs;
  RxString imageUrl = ''.obs;

 Future getImage()async{
    final ImagePicker picker= ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if(image!= null){
      imagePath.value = image.path.toString();
    }
 }

  Future<void> getImageUrl() async {
    final ref = FirebaseStorage.instance.ref('userImages').child(user!.uid);
    // download url
    final url = await ref.getDownloadURL();
    imageUrl.value = url;
  }


  Future<void> uploadImageToFirestore(File imageFile, String userId,context) async {
    User? user = FirebaseAuth.instance.currentUser;
    RxDouble uploadProgress = 0.0.obs;

    if (user == null) {
      // User is not authenticated, handle authentication.
      Get.snackbar("Error", 'User is not authenticated. Handle authentication.');
      return;
    }

    try {
      showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.deepOrange,
          ),
        );
      },
    );
      // Create a reference to the Firebase Storage location where you want to store the image.
      final storageRef = FirebaseStorage.instance.ref().child('userImages/$userId');

      // Upload the image to Firebase Storage.
      final UploadTask uploadTask = storageRef.putFile(imageFile);

      // Monitor the upload progress
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        double progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
        uploadProgress.value = progress;
      });

      // Wait for the completion of the upload task
      await uploadTask;

      // Get the download URL of the uploaded image.
      final imageUrl = await storageRef.getDownloadURL();

      // Save the image URL to Firestore in the "users" collection.
      await FirebaseFirestore.instance.collection('users').doc(user.email).update({
        'imageUrl': imageUrl,
      });
      Get.back();
      // The image has been successfully uploaded and the URL is saved in Firestore.
      Get.snackbar('Image Upload', 'Image uploaded successfully.');
    } catch (e) {
      // Handle errors, e.g., file upload or Firestore update errors.
      Get.snackbar('Error', 'Error uploading image: $e');
    }
  }




}
