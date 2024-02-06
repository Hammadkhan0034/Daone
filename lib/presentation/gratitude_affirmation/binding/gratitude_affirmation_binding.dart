


import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/gratitude_affirmation/controller/gartitude_affirmation_controller.dart';

class GratitudeAffirmationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => GratitudeAffirmationController());
  }


}