import 'dart:io';
import 'dart:typed_data';

import 'package:admin/pdfpreview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

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

typedef LayoutCallbackWithData = Future<Uint8List> Function(
    PdfPageFormat pageFormat);

class PdfController extends GetxController {
  PrintingInfo? printingInfo;
  Future<void> init() async {
    final info = await Printing.info();

    printingInfo = info;
  }

  void showPrintedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document printed successfully'),
      ),
    );
  }

  void showSharedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document shared successfully'),
      ),
    );
  }

  Future<void> system(
    BuildContext context,
    LayoutCallback build,
    PdfPageFormat pageFormat,
  ) async {
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      return generatePDF().then((value) => value);
    });
    notifyChildrens();
    update();
  }

  Future<void> saveAsFile(
    BuildContext context,
    LayoutCallback build,
    PdfPageFormat pageFormat,
  ) async {
    final bytes = await build(pageFormat);

    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final file = File(appDocPath + '/' + 'document.pdf');
    print('Save as file ${file.path} ...');
    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
    notifyChildrens();
    update();
  }
}
