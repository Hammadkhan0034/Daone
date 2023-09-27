



import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../date_widget/date_utils.dart';

class CalendarController extends GetxController {
  Rx<DateTime> currentDateTime = DateTime.now().obs;
  RxList<DateTime> currentMonthList = <DateTime>[].obs;
  List savedContainerInfo = List.generate(3, (index) => '').obs;
  RxInt selectedContainerIndex = RxInt(-1); // Initialize with -1 to indicate no selection
  RxInt selectedIndex = 0.obs;
//  Rx<DateTime> taskDate = DateTime(0000, 0, 00).obs;

  @override
  void onInit() {
    super.onInit();
    updateMonthList();
  }

  void updateMonthList() {
    final DateTime currentDate = currentDateTime.value;
    final List<DateTime> daysInMonth = DateUtils.daysInMonth(currentDate);
    daysInMonth.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList.value = daysInMonth.toSet().toList();
  }

  void selectDate(DateTime date) {
    currentDateTime.value = date;
  }

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'Aug';
      case 9:
        return 'Sept';
      case 10:
        return 'Oct';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}

