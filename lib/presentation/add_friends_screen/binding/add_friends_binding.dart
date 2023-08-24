import '../controller/add_friends_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddFriendsScreen.
///
/// This class ensures that the AddFriendsController is created when the
/// AddFriendsScreen is first loaded.
class AddFriendsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddFriendsController());
  }
}
