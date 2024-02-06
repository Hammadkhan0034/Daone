


import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/visualization/visualization_controller/visualization_controller.dart';

class VisualizationBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => VisualizationController());
  }

}