import '../controller/account_setting_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AccountSettingScreen.
///
/// This class ensures that the AccountSettingController is created when the
/// AccountSettingScreen is first loaded.
class AccountSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountSettingController());
  }
}
