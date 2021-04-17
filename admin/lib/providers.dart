import 'package:get/get.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;

class DateController extends GetxController {
  final Rx<DateTime> dateNow = DateTime.now().obs;
  final Rx<DateTime> firstDate =
      DateTime.now().subtract(Duration(days: 1000)).obs;
  final Rx<DateTime> lastDate = DateTime.now().add(Duration(days: 1000)).obs;

  final Rx<DateTime> firstDayOfMonth =
      DateTime(DateTime.now().year, DateTime.now().month, 1).obs;
  final Rx<DateTime> lastDayOfMonth =
      DateTime(DateTime.now().year, DateTime.now().month + 1)
          .subtract(Duration(days: 1))
          .obs;
  final RxString firstDayOfMonthText =
      DateTime(DateTime.now().year, DateTime.now().month, 1)
          .toString()
          .split(" ")
          .first
          .obs;
  final RxString lastDayOfMonthText =
      DateTime(DateTime.now().year, DateTime.now().month + 1)
          .subtract(Duration(days: 1))
          .toString()
          .split(" ")
          .first
          .obs;
  final Rx<dp.DatePickerStyles> styles = dp.DatePickerStyles().obs;
  void renew(DateTime newDate) {
    dateNow.value = newDate;
    firstDayOfMonthText.value =
        DateTime(newDate.year, newDate.month, 1).toString().split(" ").first;
    lastDayOfMonthText.value = DateTime(newDate.year, newDate.month + 1)
        .subtract(Duration(days: 1))
        .toString()
        .split(" ")
        .first;
    firstDayOfMonth.value = DateTime(newDate.year, newDate.month, 1);
    lastDayOfMonth.value =
        DateTime(newDate.year, newDate.month + 1).subtract(Duration(days: 1));
    notifyChildrens();
    update();
  }
}
