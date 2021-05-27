import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';

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
  final RxString firstDayOfMonthText = DateFormat('dd/MM/yyyy')
      .format(DateTime(DateTime.now().year, DateTime.now().month, 1))
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

    firstDayOfMonth.value = DateTime(newDate.year, newDate.month, 1);
    lastDayOfMonth.value =
        DateTime(newDate.year, newDate.month + 1).subtract(Duration(days: 1));
    notifyChildrens();
    update();
  }
}

typedef LayoutCallbackWithData = Future<Uint8List> Function(
    PdfPageFormat pageFormat);
/*
class PdfController extends GetxController {
  PrintingInfo? printingInfo;
  final RxDouble revenue = 0.00.obs;
  final RxDouble cnss = 0.00.obs;
  final RxDouble amo = 0.00.obs;
  final RxDouble totalCnss = 0.00.obs;
  final RxDouble taxeHalle = 0.00.obs;
  final RxDouble coop = 0.00.obs;

  final RxDouble peage = 0.00.obs;
  final RxDouble taxeRegion = 0.00.obs;
  final RxDouble totalGlobal = 0.00.obs;
  final RxDouble carburant = 0.00.obs;
  final RxDouble autres = 0.00.obs;
  final RxDouble chargesComm = 0.00.obs;
  final RxDouble net = 0.00.obs;
  final RxDouble patron = 0.00.obs;
  final RxDouble patronPerc = 0.4.obs;
  final RxDouble equipage = 0.00.obs;
  final RxDouble equipagePerc = 0.6.obs;
  final RxDouble pay = 0.00.obs;
  final RxInt sales = 0.obs;
  final RxInt marins = 0.obs;
  final RxDouble coopPerc = 0.015.obs;
  final RxString region = "OUEDLAOU".obs;
  final RxString boat = "BOAT".obs;
  final RxString reference = "REFERENCE".obs;
  final RxString owner = "OWNER".obs;
  final RxString startDate = "01/01/2021".obs;
  final RxString finishDate = "31/01/2021".obs;
  final FirebaseFirestore firestoro = FirebaseFirestore.instance;
  final bahara = <ThatTable>[
    ThatTable(
      "123456789",
      "AOULAD HAMMOU MHAMMAD",
      "ABDELLAH mohamed something",
      "3/1-B000",
      "L000000",
      "18000.00",
      "15",
    ),
  ].obs;

  Future<void> init(ref, month) async {
    final info = await Printing.info();
    getInfo(ref, month);
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
      return generatePDF(
              bahara,
              startDate.value,
              finishDate.value,
              region.value,
              boat.value,
              reference.value,
              owner.value,
              marins.value,
              sales.value,
              revenue.value,
              cnss.value,
              amo.value,
              totalCnss.value,
              taxeHalle.value,
              coopPerc.value,
              coop.value,
              taxeRegion.value,
              totalGlobal.value,
              carburant.value,
              chargesComm.value,
              net.value,
              patron.value,
              equipage.value)
          .then((value) => value);
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

  void getInfo(ref, month) async {
    final boatDOC = await firestoro.collection('boats').doc(ref).get();
    final monthDOC = await firestoro
        .collection('boats')
        .doc(ref)
        .collection('revenue')
        .doc(month)
        .get();
    final rev = monthDOC['revenue'];
    final coopPercZ = boatDOC['sub'];
    final carb = monthDOC['carburant'];
    final start = monthDOC['startDate'];
    final finish = monthDOC['finishDate'];
    final salez = monthDOC['sales'];
    final regionZ = boatDOC['region'];
    final nameZ = boatDOC['name'];
    final refZ = boatDOC['reference'];
    final ownerZ = boatDOC['owner'];
    List<String> baharaIDS = List.from(monthDOC['bahara']);
    final marinz = baharaIDS.length;
    final payo = (rev -
            (rev * 0.06) -
            (rev * 0.017) -
            (rev * 0.04) -
            (rev * coopPercZ) -
            (rev * 0.00) -
            (rev * 0.0016) -
            carb) *
        0.6 /
        marinz;
    addMarins(month, payo, salez, marinz, baharaIDS);

    calculations(
      rev,
      marinz,
      salez,
      regionZ,
      nameZ,
      refZ,
      ownerZ,
      coopPercZ,
      carb,
      start,
      finish,
    );
  }

  void addMarins(month, pay, sales, marinz, baharaIDS) async {
    baharaIDS.forEach((element) async {
      final baharDOC = await firestoro.collection('seamen').doc(element).get();

      bahara.add(ThatTable(
          baharDOC['cnss'],
          baharDOC['lastName'],
          baharDOC['firstName'],
          baharDOC['reference'],
          baharDOC['cni'],
          pay,
          sales));
    });
  }

  void calculations(
    rev,
    marinz,
    salez,
    regionz,
    boatz,
    referencez,
    ownerz,
    coopPercZ,
    carb,
    start,
    finish,
  ) {
    revenue.value = rev;
    cnss.value = rev * 0.06;
    amo.value = rev * 0.017;
    taxeHalle.value = rev * 0.04;
    coopPerc.value = coopPercZ;
    coop.value = rev * coopPercZ;
    peage.value = rev * 0.00;
    taxeRegion.value = rev * 0.0016;
    totalCnss.value = (rev * 0.06) + (rev * 0.017);
    chargesComm.value =
        (rev * 0.04) + (rev * coopPercZ) + (rev * 0.00) + (rev * 0.0016) + carb;
    carburant.value = carb;
    totalGlobal.value = (rev * 0.06) +
        (rev * 0.017) +
        (rev * 0.04) +
        (rev * coopPercZ) +
        (rev * 0.00) +
        (rev * 0.0016);
    net.value = rev -
        (rev * 0.06) -
        (rev * 0.017) -
        (rev * 0.04) -
        (rev * coopPercZ) -
        (rev * 0.00) -
        (rev * 0.0016) -
        carb;
    equipage.value = (rev -
            (rev * 0.06) -
            (rev * 0.017) -
            (rev * 0.04) -
            (rev * coopPercZ) -
            (rev * 0.00) -
            (rev * 0.0016) -
            carb) *
        0.6;
    patron.value = (rev -
            (rev * 0.06) -
            (rev * 0.017) -
            (rev * 0.04) -
            (rev * coopPercZ) -
            (rev * 0.00) -
            (rev * 0.0016) -
            carb) *
        0.4;
    pay.value = (rev -
            (rev * 0.06) -
            (rev * 0.017) -
            (rev * 0.04) -
            (rev * coopPercZ) -
            (rev * 0.00) -
            (rev * 0.0016) -
            carb) *
        0.6 /
        marinz;
    sales.value = salez;
    owner.value = ownerz;
    reference.value = referencez;
    region.value = regionz;
    boat.value = boatz;
    startDate.value = start.toString().split(" ").first.toString();
    finishDate.value = finish.toString().split(" ").first.toString();

    notifyChildrens();
    update();
  }
}
*/
