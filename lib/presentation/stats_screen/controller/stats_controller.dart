import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/stats_screen/models/stats_model.dart';

/// A controller class for the StatsScreen.
///
/// This class manages the state of the StatsScreen, including the
/// current statsModelObj
class StatsController extends GetxController {
  Rx<StatsModel> statsModelObj = StatsModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element in statsModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    statsModelObj.value.dropdownItemList.refresh();
  }
   var dailyAffirmationsProgressList= [
     ["20",ImageConstant.group10110,"Affirmation Complete"],
     ["20",ImageConstant.group10110,"Affirmation Complete"],
     ["20",ImageConstant.group10110,"Affirmation Complete"],
     ["20",ImageConstant.group10110,"Affirmation Complete"],
   ];


}
