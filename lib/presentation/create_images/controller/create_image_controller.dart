import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateImageController extends GetxController {
  final user = FirebaseAuth.instance.currentUser;
  TextEditingController createImageCommentController = TextEditingController();



  Future<void> toggleHighlightStatus(var docId) async {
    try {
      await FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user?.email)
            .collection('highlightList')
            .doc(docId) // Replace with the actual document ID
            .get();

        if (snapshot.exists) {
          bool currentStatus = snapshot['isHighlighted'] ?? false;
          // Toggle the value of isHighlighted
          bool newStatus = !currentStatus;

          transaction.update(
            FirebaseFirestore.instance
                .collection('users')
                .doc(user?.email)
                .collection('highlightList')
                .doc(docId), // Replace with the actual document ID
            {'isHighlighted': newStatus},
          );
        }
      });
    } catch (e) {
      print('Error toggling highlight status: $e');
    }
  }


Future imageCommentsSection({context, var postId, comment}) async {
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
    await FirebaseFirestore.instance.collection('users').doc(user!.email).collection('highlightList')
        .doc(postId).collection('comment')
        .add({
      'postId': postId,
      'comment':comment,
      'date': DateTime.now(),
    });
    Get.toNamed(AppRoutes.dashboardRoute);
  } catch (e) {
    Get.snackbar('Info','$e');
    print('Error adding comment: $e');
  }
}

  @override
  void onClose() {
    super.onClose();
    createImageCommentController.dispose();

  }

}

