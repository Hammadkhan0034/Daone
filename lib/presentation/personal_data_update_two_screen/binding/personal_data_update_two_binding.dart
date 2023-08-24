import '../controller/personal_data_update_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PersonalDataUpdateTwoScreen.
///
/// This class ensures that the PersonalDataUpdateTwoController is created when the
/// PersonalDataUpdateTwoScreen is first loaded.
class PersonalDataUpdateTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalDataUpdateTwoController());
  }
}
