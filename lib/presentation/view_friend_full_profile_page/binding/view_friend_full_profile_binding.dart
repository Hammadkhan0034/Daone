import 'package:daone/presentation/view_friend_full_profile_page/controller/view_friend_full_profile_controller.dart';
import 'package:get/get.dart';


class ViewFriendsFullProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewFriendFullProfileController());
  }
}