


import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/create_images/controller/create_image_controller.dart';

class CreateImageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CreateImageController());
  }

}