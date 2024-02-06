

import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/own_affirmation_screen/controller/own_affirmation_controller.dart';

class OwnAffirmationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OwnAffirmationController());
  }

}