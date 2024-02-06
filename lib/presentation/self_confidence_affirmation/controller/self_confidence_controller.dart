



import 'package:daone/core/app_export.dart';

class SelfConfidenceController extends GetxController{
  RxInt affirmationCount = 0.obs;
  void updateAffirmationCount(int newCount) {
    affirmationCount.value = newCount;
  }
}