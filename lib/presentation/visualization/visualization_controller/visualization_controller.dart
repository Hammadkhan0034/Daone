

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/presentation/daily_intension_record_screen/models/daily_intension_record_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class VisualizationController extends GetxController{

  Future<void> addToFav({required BuildContext context,
    required DailyIntentionModel dailyIntentionModel}) async {
    try {
      User? user =FirebaseAuth.instance.currentUser;
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
      if (user!=null){
        DocumentReference userDocRef = FirebaseFirestore.instance.collection('users').doc(user.email);
        await userDocRef.collection('favVideos').doc(dailyIntentionModel.date.millisecondsSinceEpoch.toString()).set(dailyIntentionModel.toMap());  // Data saved successfully
        print('highlights saved to Firestore');
        Get.snackbar("Info","Selected video saved to Favorite List");

        // Hide the progress indicator and navigate
        Navigator.of(context).pop();
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

  Future<void> deleteFromFav(BuildContext context, {
    required String documentId,
  }) async {
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
        DocumentReference userDocRef =
        FirebaseFirestore.instance.collection('users').doc(user.email);
        await userDocRef.collection('favVideos').doc(documentId).delete();
        print('Video deleted from Firestore');
        Get.snackbar("Info", "Selected video deleted from Favorite List");

        // Hide the progress indicator
        Navigator.of(context).pop();
        // Optionally, you can navigate back to the favorite list or update the UI
        // Get.offAndToNamed(AppRoutes.visualizationRoute);
      } else {
        // Handle the case where the user is not authenticated
        print('User is not authenticated');
        Get.snackbar('Error', 'User is not authenticated');
        Navigator.of(context).pop(); // Hide the progress indicator
      }
    } catch (e) {
      // Handle errors here
      print('Error deleting video: $e');
      Get.snackbar('Error deleting video:', '$e');
      Navigator.of(context).pop(); // Hide the progress indicator
    }
  }

}

