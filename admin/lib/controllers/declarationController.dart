import 'package:admin/models/boatModel.dart';
import 'package:admin/models/marinModel.dart';
import 'package:admin/models/monthModel.dart';
import 'package:admin/widgets/declarationWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:flutter/material.dart' as d;

class DeclarationController extends GetxController {
  late Month? monthDec;
  late Boat? boatDec;
  final doc = Document();

  List<Row> marinsRows = [];
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getMarins(ido, month) async {
    await FirebaseFirestore.instance
        .collection('seamen')
        .doc(ido)
        .withConverter<Marin>(
          fromFirestore: (snapshots, _) => Marin.fromJson(snapshots.data()!),
          toFirestore: (marin, _) => marin.toJson(),
        )
        .get()
        .then((value) {
      marinsRows.add(decMarinRow(value.data()!, month));
    });
  }

  Future getData(boat, month) async {
    final boatRef = FirebaseFirestore.instance
        .collection('boats')
        .doc(boat)
        .withConverter<Boat>(
          fromFirestore: (snapshots, _) => Boat.fromJson(snapshots.data()!),
          toFirestore: (boat, _) => boat.toJson(),
        );
    final boatly = await boatRef.get().then((s) => s.data());
    final monthRef = FirebaseFirestore.instance
        .collection('boats')
        .doc(boat)
        .collection('revenue')
        .doc(month)
        .withConverter<Month>(
          fromFirestore: (snapshots, _) => Month.fromJson(snapshots.data()!),
          toFirestore: (month, _) => month.toJson(),
        );
    final monthly = await monthRef.get().then((s) => s.data());

    for (var age in monthly!.bahara) {
      getMarins(age, monthly);
    }

    await generatePDF(doc);

    print('length is : ' + monthly.bahara.length.toString());

    return {
      monthDec = monthly,
      boatDec = boatly,
    };
  }

  onError() {
    Get.snackbar("", "",
        titleText: d.Text(
          "خطأ",
          textDirection: d.TextDirection.rtl,
          textAlign: d.TextAlign.center,
        ),
        messageText: d.Text(
          " ",
          textScaleFactor: 0.7,
          textDirection: d.TextDirection.rtl,
          textAlign: d.TextAlign.center,
        ));
  }

  onShared() {
    Get.snackbar("", "",
        titleText: d.Text(
          "تم النشر بنجاح",
          textDirection: d.TextDirection.rtl,
          textAlign: d.TextAlign.center,
        ),
        messageText: d.Text(
          " ",
          textScaleFactor: 0.7,
          textDirection: d.TextDirection.rtl,
          textAlign: d.TextAlign.center,
        ));
  }

  shareDeclaration(id, month) async {
    await Printing.sharePdf(
        bytes: await
            // generatePDF(),
            doc.save(),
        filename: 'CNSS|$id|$month.pdf');
    Get.snackbar("", "",
        titleText: d.Text(
          "تم النشر بنجاح",
          textDirection: d.TextDirection.rtl,
          textAlign: d.TextAlign.center,
        ),
        messageText: d.Text(
          " ",
          textScaleFactor: 0.7,
          textDirection: d.TextDirection.rtl,
          textAlign: d.TextAlign.center,
        ));
  }

  printDeclaration(id, month) async {
    await Printing.layoutPdf(
        name: 'CNSS|$id|$month.pdf',
        format: PdfPageFormat.a4,
        onLayout: (PdfPageFormat format) async => doc.save());
    Get.snackbar("", "",
        titleText: d.Text(
          "تم الطبع بنجاح",
          textDirection: d.TextDirection.rtl,
          textAlign: d.TextAlign.center,
        ),
        messageText: d.Text(
          " ",
          textScaleFactor: 0.7,
          textDirection: d.TextDirection.rtl,
          textAlign: d.TextAlign.center,
        ));
  }

  generatePDF(doc) async {
    final font1 = await rootBundle.load('res/fonts/Carlito-Regular.ttf');
    final font = Font.ttf(font1);
    final font2 = await rootBundle.load('res/fonts/EMcomic-Bold.ttf');
    final fontEM = Font.ttf(font2);
    final font3 = await rootBundle.load('res/fonts/Carlito-Bold.ttf');
    final fontBold = Font.ttf(font3);
    final font4 = await rootBundle.load('res/fonts/Carlito-Italic.ttf');
    final fontItalic = Font.ttf(font4);

    final cnssLogo = await imageFromAssetBundle('res/icons/cnss.png');
    final pda = await imageFromAssetBundle('res/icons/pda.jpg');

    doc.addPage(Page(
        pageFormat: PdfPageFormat.a4,
        orientation: PageOrientation.portrait,
        theme: ThemeData(
            defaultTextStyle: TextStyle(
          font: font,
          fontBold: fontBold,
          fontItalic: fontItalic,
          fontSize: 12,
        )),
        build: (Context context) {
          return FullPage(
              ignoreMargins: true,
              child: Row(children: [
                SizedBox(width: 20),
                Expanded(
                    child: Center(
                  child: Column(children: [
                    margin(),
                    decHeader(cnssLogo, fontEM, font, pda),
                    margin(),
                    decDate(monthDec!),
                    margin(),
                    decInfo(monthDec!, boatDec!),
                    marginMini(),
                    decEquipageTitle(),
                    marginMini(),
                    decMarinzTitle(),
                    SizedBox(width: 660, child: Column(children: marinsRows)),
                    margin(),
                    decDetails(monthDec!, boatDec!),
                    margin(),
                    decSignature(),
                    Spacer(),
                    decDateNow(),
                    margin()
                  ]),
                )),
                SizedBox(width: 20)
              ]));
        }));

    return doc;
  }
}
