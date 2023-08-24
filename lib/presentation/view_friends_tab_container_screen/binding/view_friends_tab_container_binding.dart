import '../controller/view_friends_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ViewFriendsTabContainerScreen.
///
/// This class ensures that the ViewFriendsTabContainerController is created when the
/// ViewFriendsTabContainerScreen is first loaded.
class ViewFriendsTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewFriendsTabContainerController());
  }
}
