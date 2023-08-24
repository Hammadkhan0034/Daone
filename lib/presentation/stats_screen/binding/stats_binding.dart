import '../controller/stats_controller.dart';
import 'package:get/get.dart';

/// A binding class for the StatsScreen.
///
/// This class ensures that the StatsController is created when the
/// StatsScreen is first loaded.
class StatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StatsController());
  }
}
