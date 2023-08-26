import '../controller/welcome_screen_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the WelcomeScreenOneScreen.
///
/// This class ensures that the WelcomeScreenOneController is created when the
/// WelcomeScreenOneScreen is first loaded.
class WelcomeScreenOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeScreenOneController());
  }
}
