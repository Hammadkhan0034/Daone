import '../controller/latest_blog_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LatestBlogScreen.
///
/// This class ensures that the LatestBlogController is created when the
/// LatestBlogScreen is first loaded.
class LatestBlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LatestBlogController());
  }
}
