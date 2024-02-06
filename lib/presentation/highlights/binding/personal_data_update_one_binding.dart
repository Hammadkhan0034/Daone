import '../controller/personal_data_update_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PersonalDataUpdateOneScreen.
///
/// This class ensures that the PersonalDataUpdateOneController is created when the
/// PersonalDataUpdateOneScreen is first loaded.
class PersonalDataUpdateOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalDataUpdateOneController());
  }
}
