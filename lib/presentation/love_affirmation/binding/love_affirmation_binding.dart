


import 'package:daone/core/app_export.dart';

import '../controller/love_affirmation_controller.dart';




class LoveAffirmationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoveAffirmationController());
  }

}