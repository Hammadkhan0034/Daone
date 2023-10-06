
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:daone/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OwnAffirmationController extends GetxController{
  final confettiController = ConfettiController(duration: const Duration(seconds: 5));

  void playConfetti() {
    confettiController.play();
  }

  void deleteAffirmation(String documentId) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentReference userDocRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

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

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }
}