


import 'package:daone/core/app_export.dart';

class GratitudeAffirmationController extends GetxController{
  RxInt affirmationCount = 0.obs;
  void updateAffirmationCount(int newCount) {
    affirmationCount.value = newCount;
  }
}