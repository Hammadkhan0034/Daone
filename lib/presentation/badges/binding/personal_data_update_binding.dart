import '../controller/personal_data_update_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PersonalDataUpdateScreen.
///
/// This class ensures that the PersonalDataUpdateController is created when the
/// PersonalDataUpdateScreen is first loaded.
class PersonalDataUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalDataUpdateController());
  }
}
