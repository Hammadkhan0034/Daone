import 'dart:io';

import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/daily_intension_record_screen/models/daily_intension_record_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../videos/upload_video.dart';

/// A controller class for the DailyIntensionRecordScreen.
///
/// This class manages the state of the DailyIntensionRecordScreen, including the
/// current dailyIntensionRecordModelObj
class DailyIntensionRecordController extends GetxController {



  Rx<DailyIntensionRecordModel> dailyIntensionRecordModelObj =
      DailyIntensionRecordModel().obs;




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
    final storage = FirebaseStorage.instance;
    final Reference storageReference =
    storage.ref().child('videos/${videoFile.path.split('/').last}');

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

}
