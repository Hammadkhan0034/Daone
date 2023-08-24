import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/affirmation_blast_effect_dialog/models/affirmation_blast_effect_model.dart';

/// A controller class for the AffirmationBlastEffectDialog.
///
/// This class manages the state of the AffirmationBlastEffectDialog, including the
/// current affirmationBlastEffectModelObj
class AffirmationBlastEffectController extends GetxController {
  Rx<AffirmationBlastEffectModel> affirmationBlastEffectModelObj =
      AffirmationBlastEffectModel().obs;
}
