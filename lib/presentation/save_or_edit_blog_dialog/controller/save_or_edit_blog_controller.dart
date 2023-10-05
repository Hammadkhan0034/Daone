import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/save_or_edit_blog_dialog/models/save_or_edit_blog_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SaveOrEditBlogController extends GetxController {



  // Observables for selected background and available backgrounds
  RxString selectedBackground = "".obs;
  RxList<String> availableBackgrounds = RxList<String>();

  // Text editing controller for the text field
  final textEditingController = TextEditingController();

  // Observable for the displayed text
  final displayText = ''.obs;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;


  Future<void> incrementLike(String blogId) async {
    try {
      // Reference the specific document using its unique ID (blogId)
      final DocumentReference blogRef = firestore.collection('blogs').doc(blogId);

      // Increment the 'like' field by 1
      await blogRef.update({
        'like': FieldValue.increment(1),
      });

      print('Like incremented successfully.');
    } catch (e) {
      print('Error incrementing like: $e');
    }
  }


  @override
  void onInit() {
    super.onInit();
    // Fetch background images from Firestore when the controller initializes
    fetchBackgrounds();

    // Listen to changes in the text field and update displayText
    textEditingController.addListener(() {
      displayText.value = '${textEditingController.text}';
    });
  }

  // Function to fetch background images from Firestore
  Future<void> fetchBackgrounds() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('backgrounds').get();
      final backgrounds = snapshot.docs.map((doc) => doc['imageUrl'] as String).toList();
      availableBackgrounds.assignAll(backgrounds);
    } catch (e) {
      // Handle any errors while fetching backgrounds
      print('Error fetching backgrounds: $e');
    }
  }

  // Function to set the selected background
  void setSelectedBackground(String background) {
    selectedBackground.value = background;
  }

  // Dispose the text editing controller when the controller is closed
  @override
  void onClose() {
    super.onClose();
    textEditingController.dispose();
  }

  // Observable for the SaveOrEditBlogModel
  Rx<SaveOrEditBlogModel> saveOrEditBlogModelObj = SaveOrEditBlogModel().obs;

  Future<void> higlightslist(BuildContext context,String selectedText,imageUrl) async {
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
        DocumentReference userDocRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
        await userDocRef.collection('highlightList').add({
          'selectedText' : selectedText,
          'imageUrl': imageUrl,
          'date': DateFormat('dd-MM-yyyy').format(DateTime.now()),
        });  // Data saved successfully
        print('highlights saved to Firestore');
        Get.snackbar("Highlights","Selected Text Add to Highlights");

        // Hide the progress indicator and navigate
        Navigator.of(context).pop();
        Get.offAndToNamed(AppRoutes.blogScreen);
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


}
