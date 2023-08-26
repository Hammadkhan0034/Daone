import '../controller/register_page_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RegisterPageOneScreen.
///
/// This class ensures that the RegisterPageOneController is created when the
/// RegisterPageOneScreen is first loaded.
class RegisterPageOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterPageOneController());
  }
}
