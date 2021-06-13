import 'package:get/get.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:intl/intl.dart';

class DateController extends GetxController {
  final Rx<DateTime> dateNow = DateTime.now().obs;
  final Rx<DateTime> firstDate =
      DateTime.now().subtract(Duration(days: 1000)).obs;
  final Rx<DateTime> lastDate = DateTime.now().add(Duration(days: 1000)).obs;

  final Rx<DateTime> firstDayOfMonth =
      DateTime(DateTime.now().year, DateTime.now().month, 1).obs;
  final Rx<DateTime> selectedMonth = DateTime(
    DateTime.now().year,
    DateTime.now().month,
  ).obs;
  final Rx<DateTime> lastDayOfMonth =
      DateTime(DateTime.now().year, DateTime.now().month + 1)
          .subtract(Duration(days: 1))
          .obs;
  final RxString firstDayOfMonthText = DateFormat('dd/MM/yyyy')
      .format(DateTime(DateTime.now().year, DateTime.now().month, 1))
      .obs;
  final RxString selectedMonthText = DateFormat('MM-yyyy')
      .format(DateTime(
        DateTime.now().year,
        DateTime.now().month,
      ))
      .obs;
  static RxString firstDayOfMonthTextNow = DateFormat('dd/MM/yyyy')
      .format(DateTime(DateTime.now().year, DateTime.now().month, 1))
      .obs;
  final RxString lastDayOfMonthText = DateFormat('dd/MM/yyyy')
      .format(DateTime(DateTime.now().year, DateTime.now().month + 1)
          .subtract(Duration(days: 1)))
      .obs;
  static RxString lastDayOfMonthTextNow = DateFormat('dd/MM/yyyy')
      .format(DateTime(DateTime.now().year, DateTime.now().month + 1)
          .subtract(Duration(days: 1)))
      .obs;
  final Rx<dp.DatePickerStyles> styles = dp.DatePickerStyles().obs;
  void renew(DateTime newDate) {
    dateNow.value = newDate;
    firstDayOfMonthText.value = DateFormat('dd/MM/yyyy')
        .format(DateTime(newDate.year, newDate.month, 1));
    lastDayOfMonthText.value = DateFormat('dd/MM/yyyy').format(
        DateTime(newDate.year, newDate.month + 1).subtract(Duration(days: 1)));
    selectedMonthText.value =
        DateFormat('MM-yyyy').format(DateTime(newDate.year, newDate.month));

    firstDayOfMonth.value = DateTime(newDate.year, newDate.month, 1);
    lastDayOfMonth.value =
        DateTime(newDate.year, newDate.month + 1).subtract(Duration(days: 1));
    selectedMonth.value = DateTime(newDate.year, newDate.month);
    notifyChildrens();
    update();
  }
}
