import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/grade_yourself_dialog/models/grade_yourself_model.dart';

/// A controller class for the GradeYourselfDialog.
///
/// This class manages the state of the GradeYourselfDialog, including the
/// current gradeYourselfModelObj
class GradeYourselfController extends GetxController {
  Rx<GradeYourselfModel> gradeYourselfModelObj = GradeYourselfModel().obs;
}
