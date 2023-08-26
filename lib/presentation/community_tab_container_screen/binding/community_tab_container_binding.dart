import '../controller/community_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CommunityTabContainerScreen.
///
/// This class ensures that the CommunityTabContainerController is created when the
/// CommunityTabContainerScreen is first loaded.
class CommunityTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommunityTabContainerController());
  }
}
