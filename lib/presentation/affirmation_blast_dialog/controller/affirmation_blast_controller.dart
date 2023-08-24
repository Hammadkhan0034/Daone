import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/affirmation_blast_dialog/models/affirmation_blast_model.dart';

/// A controller class for the AffirmationBlastDialog.
///
/// This class manages the state of the AffirmationBlastDialog, including the
/// current affirmationBlastModelObj
class AffirmationBlastController extends GetxController {
  Rx<AffirmationBlastModel> affirmationBlastModelObj =
      AffirmationBlastModel().obs;
}
