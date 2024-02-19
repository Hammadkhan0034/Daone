
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/core/utils/utils.dart';
import 'package:daone/presentation/own_affirmation_screen/own_affirmation_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class OwnAffirmationController extends GetxController{
  final confettiController = ConfettiController(duration: const Duration(seconds: 5));
  RxInt affirmationCount = 0.obs;
  RxBool shouldShowEdit=false.obs;
  RxString selectedBackground= ''.obs;
  RxList<String> availableBackgrounds = RxList<String>();
  TextEditingController affirmationText=TextEditingController();


  void updateAffirmationCount(int newCount) {
    affirmationCount.value = newCount;
  }
  final player = AudioPlayer();

  Future<void> playAudioFromAsset(String assetPath) async {
    try {
      await player.play(
        AssetSource(
          assetPath
        ),

      );
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  void playConfetti() {
    confettiController.play();
    playAudioFromAsset("assets/1.mp3");
  }

  Future blastAffirmation(OwnAffirmationModel ownAffirmationModel)async{
    playAudioFromAsset('1.mp3');
    playConfetti();
    FirebaseFirestore.instance
        .collection('users')
        .doc(
        FirebaseAuth.instance.currentUser?.email).collection("OwnAffirmationList").doc(ownAffirmationModel.documentID) // Use the document ID to reference the specific document
        .update({'affirmationCount': ++ownAffirmationModel.affirmationCount}).then((_) {
      // Document updated successfully
      print('AffirmationCount updated successfully');
    }).catchError((error) {
      // Handle errors if the update fails
      print('Error updating AffirmationCount: $error');
    });
  }

  Future deleteAffirmation(String documentId) async {
    bool result=await Utils.askForConfirmation(Get.context!, "delete this affirmation","Delete Affirmation", );
    if(result==false) return;
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentReference userDocRef =
        FirebaseFirestore.instance.collection('users').doc(user.email);

        // Specify the path to the document you want to delete
        DocumentReference taskDocRef =
        userDocRef.collection('OwnAffirmationList').doc(documentId);

        // Delete the task
        await taskDocRef.delete();

        print('Task deleted from Firestore');
        Get.snackbar("Affirmation Alert", "Affirmtion Deleted Successfully");
      } else {
        // Handle the case where the user is not authenticated
        print('User is not authenticated');
        Get.snackbar('Error', 'User is not authenticated');
      }
    } catch (e) {
      // Handle errors here
      print('Error deleting task: $e');
      Get.snackbar('Error deleting task:', '$e');
    }
  }

  Future<void>fetchBackgrounds()async{
    try{
      final snapshot = await FirebaseFirestore.instance.collection('backgrounds').get();
      final backgrounds = snapshot.docs.map((doc) => doc['imageUrl'] as String).toList();
      availableBackgrounds.assignAll(backgrounds);
    }catch(e){
      print('Error fetching backgrounds: $e');
    }}
  void setSelectedBackground(String background) {
    selectedBackground.value = background;
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }
}