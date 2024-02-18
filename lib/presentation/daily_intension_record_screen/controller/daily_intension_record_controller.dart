import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import '../videos/upload_video.dart';

class DailyIntensionRecordController extends GetxController {




  TextEditingController titleController = TextEditingController();
  TextEditingController tagsController = TextEditingController();



  getVideoFile(ImageSource videoSource) async {
    final videoFile = await ImagePicker().pickVideo(source: videoSource );
    if(videoFile!= null){
      Get.to(()=>
          UploadVideo(
            videoFile:File(videoFile.path),
            videoPath:videoFile.path,
          ));
    }
  }

  Future<void> uploadVideoToFirebaseStorage(
      File videoFile, BuildContext context) async {
    final user =FirebaseAuth.instance.currentUser!.uid;
    final storage = FirebaseStorage.instance;
    final Reference storageReference =
    storage.ref().child('${user}videos/${videoFile.path.split('/').last}');

    try {
      UploadTask uploadTask = storageReference.putFile(videoFile);

      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        double percentage = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
        // Update the UI with the upload percentage

        print('Upload is $percentage% complete');
      });

      await uploadTask.whenComplete(() async {
        String downloadUrl = await storageReference.getDownloadURL();
        // You can now save `downloadUrl` to a database or use it in your app.
        updateVideoUrl(downloadUrl,tagsController.text,titleController.text);

        Get.offAndToNamed(AppRoutes.dashboardRoute);
        // // Navigate to the dashboard screen
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(
        //     builder: (context) => DashboardScreen(downloadUrl: downloadUrl),
        //   ),
        // );
      });
    } catch (e) {
      print('Error uploading video: $e');
    }
  }

  void updateVideoUrl(downloadUrl,tags,title)async {


    DocumentReference documentReference = FirebaseFirestore.instance.collection(
        'users').doc(
        FirebaseAuth.instance.currentUser!.email);
    await documentReference.collection('VideosUrl').add({
      'videoUrl': downloadUrl,
      'date':Timestamp.fromDate(DateTime.now()),
      'tags': tags,
      'title':title
    });
  }

}