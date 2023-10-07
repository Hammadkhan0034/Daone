





import 'package:daone/core/app_export.dart';

import '../controller/prosperity_affirmation_controller.dart';

class ProsperityAffirmationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>ProsperityController());
  }


}