

import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/self_confidence_affirmation/controller/self_confidence_controller.dart';

class SelfConfidenceBinding extends Bindings {
  @override
  void dependencies() {
 Get.lazyPut(() => SelfConfidenceController());
  }

}