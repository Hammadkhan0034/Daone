import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/edit_affirmation_dialog/models/edit_affirmation_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// A controller class for the EditAffirmationDialog.
///
/// This class manages the state of the EditAffirmationDialog, including the
/// current editAffirmationModelObj
class EditAffirmationController extends GetxController {

  RxDouble currentValue=0.0.obs;

  Rx<TimeOfDay> selectedTime1 = TimeOfDay.now().obs;
  Rx<TimeOfDay> selectedTime2 = TimeOfDay.now().obs;

  Future<void> selectTime1(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime1.value,
    );

    if (pickedTime != null) {
      selectedTime1.value = pickedTime;
    }
  }
  Future<void> selectTime2(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime2.value,
    );

    if (pickedTime != null) {
      selectedTime2.value = pickedTime;
    }
  }
  Future<void> OwnAffirmationList(
      BuildContext context,
      String? affirmation,
      String? imageUrl,
      String? dateStart,
      String? dateEnd,
      int affirmationCount,
      ) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
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

      if (user != null) {
        if (affirmation != null && imageUrl != null && dateStart != null && dateEnd != null) {
          DocumentReference userDocRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
          await userDocRef.collection('OwnAffirmationList').add({
            'affirmation': affirmation,
            'imageUrl': imageUrl,
            'dateStart': dateStart,
            'dateEnd': dateEnd,
            'affirmationCount': affirmationCount,
          });  // Data saved successfully
          print('Task saved to Firestore');
          Get.snackbar("Affirmation", "Affirmation Saved Successfully");

          // Hide the progress indicator and navigate
          Navigator.of(context).pop();
          Get.offAndToNamed(AppRoutes.selectAffirmationScreen);
        } else {
          // Handle the case where any of the required values is null
          print('One or more values are null');
          Get.snackbar('Error', 'One or more values are null');
          Navigator.of(context).pop(); // Hide the progress indicator
        }
      } else {
        // Handle the case where the user is not authenticated
        print('User is not authenticated');
        Get.snackbar('Error', 'User is not authenticated');
        Navigator.of(context).pop(); // Hide the progress indicator
      }
    } catch (e) {
      // Handle errors here
      print('Error saving task: $e');
      Get.snackbar('Error saving task:', '$e');
      Navigator.of(context).pop(); // Hide the progress indicator
    }
  }


  TextEditingController messageController = TextEditingController();
  Rx<EditAffirmationModel> editAffirmationModelObj = EditAffirmationModel().obs;

  RxString displayText =''.obs;
  RxString selectedBackground= ''.obs;
  RxList<String> availableBackgrounds = RxList<String>();

 Future<void>fetchBackgrounds()async{
   try{
     final snapshot = await FirebaseFirestore.instance.collection('backgrounds').get();
     final backgrounds = snapshot.docs.map((doc) => doc['imageUrl'] as String).toList();
     availableBackgrounds.assignAll(backgrounds);
   }catch(e){
     print('Error fetching backgrounds: $e');
   }}

  @override
  void onInit() {
    super.onInit();
    // Fetch background images from Firestore when the controller initializes
    fetchBackgrounds();

    // Listen to changes in the text field and update displayText
    messageController.addListener(() {
      displayText.value = '${messageController.text}';
    });
  }
  // Function to set the selected background
  void setSelectedBackground(String background) {
    selectedBackground.value = background;
  }




  @override
  void onClose() {
    super.onClose();
    messageController.dispose();
  }
}
