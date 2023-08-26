import '../controller/comment_section_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CommentSectionScreen.
///
/// This class ensures that the CommentSectionController is created when the
/// CommentSectionScreen is first loaded.
class CommentSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommentSectionController());
  }
}
