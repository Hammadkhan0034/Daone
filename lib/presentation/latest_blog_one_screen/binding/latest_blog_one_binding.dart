import '../controller/latest_blog_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LatestBlogOneScreen.
///
/// This class ensures that the LatestBlogOneController is created when the
/// LatestBlogOneScreen is first loaded.
class LatestBlogOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LatestBlogOneController());
  }
}
