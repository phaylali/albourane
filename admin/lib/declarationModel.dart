import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart';

@immutable
class Declaration {
  Declaration(
      {required this.boatName,
      required this.boatReference,
      required this.boatRegion,
      required this.boatOwner,
      required this.boatCoopPerc,
      required this.monthFinish,
      required this.monthEquipageNumber,
      required this.monthRevenue,
      required this.monthSales,
      required this.monthStart,
      required this.monthAmo,
      required this.monthAutres,
      required this.monthCarb,
      required this.monthChargesCommun,
      required this.monthCnss,
      required this.monthCoop,
      required this.monthEquipage,
      required this.monthEquipagePerc,
      required this.monthNet,
      required this.monthPatron,
      required this.monthPatronPerc,
      required this.monthPeage,
      required this.monthPie,
      required this.monthTaxeHalle,
      required this.monthTaxeRegion,
      required this.monthTotalCnss,
      required this.monthTotalGlobal});

  Declaration.fromJson(Map<String, Object?> json)
      : this(
          boatName: json['name']! as String,
          boatOwner: json['owner']! as String,
          boatReference: json['reference']! as String,
          boatRegion: json['region']! as String,
          boatCoopPerc: json['sub']! as num,
          monthStart: json['startDate']! as String,
          monthFinish: json['finishDate']! as String,
          monthEquipageNumber: json['equipageNumber']! as int,
          monthSales: json['sales']! as int,
          monthRevenue: json['revenue']! as num,
          monthCnss: json['cnss']! as num,
          monthAmo: json['amo']! as num,
          monthTotalCnss: json['totalCnss']! as num,
          monthTaxeHalle: json['taxeHalle']! as num,
          monthCoop: json['cooperative']! as num,
          monthPeage: json['peage']! as num,
          monthTaxeRegion: json['taxeRegion']! as num,
          monthTotalGlobal: json['totalGlobal']! as num,
          monthCarb: json['carburant']! as num,
          monthAutres: json['autres']! as num,
          monthChargesCommun: json['chargesCommun']! as num,
          monthNet: json['net']! as num,
          monthPatron: json['patron']! as num,
          monthPatronPerc: json['patronPerc']! as num,
          monthEquipage: json['equipage']! as num,
          monthEquipagePerc: json['equipagePerc']! as num,
          monthPie: json['pie']! as num,
        );

  final String boatName;
  final String boatReference;
  final String boatRegion;
  final String boatOwner;
  final num boatCoopPerc;
  final String monthStart;
  final String monthFinish;
  final int monthSales;
  final int monthEquipageNumber;
  final num monthRevenue;
  final num monthCnss;
  final num monthAmo;
  final num monthTotalCnss;
  final num monthTaxeHalle;
  final num monthAutres;
  final num monthPeage;
  final num monthTaxeRegion;
  final num monthCoop;
  final num monthNet;
  final num monthTotalGlobal;
  final num monthCarb;
  final num monthChargesCommun;
  final num monthPatron;
  final num monthPatronPerc;
  final num monthEquipage;
  final num monthEquipagePerc;
  final num monthPie;

  Map<String, Object?> toJson() {
    return {
      //'name' : boatName,
      //'owner' : boatOwner,
      //'reference' : boatReference,
      //'region': boatRegion,
      //'sub' : boatCoopPerc,
      'startDate': monthStart,
      'finishDate': monthFinish,
      'revenue': monthRevenue,
      'cnss': monthCnss,
      'amo': monthAmo,
      'totalCnss': monthTotalCnss,
      'taxeHalle': monthTaxeHalle,
      'cooperative': monthCoop,
      'peage': monthPeage,
      'taxeRegion': monthTaxeRegion,
      'totalGlobal': monthTotalGlobal,
      'carb': monthCarb,
      'autres': monthAutres,
      'chargesCommun': monthChargesCommun,
      'net': monthNet,
      'patron': monthPatron,
      'patronPerc': monthPatronPerc,
      'equipage': monthEquipage,
      'equipageNumber': monthEquipageNumber,
      'equipagePerc': monthEquipagePerc,
      'pie': monthPie
    };
  }
}

/*
class DeclarationMonthModel {
  String? monthStart, monthFinish;
  int? monthSales, monthEquipageNumber;
  double? monthRevenue,
      monthCnss,
      monthAmo,
      monthTotalCnss,
      monthTaxeHalle,
      monthCoop,
      monthPeage,
      monthTaxeRegion,
      monthTotalGlobal,
      monthCarb,
      monthAutres,
      monthChargesCommun,
      monthNet,
      monthPatron,
      monthPatronPerc,
      monthEquipage,
      monthEquipagePerc,
      monthPie;

  DeclarationMonthModel(
      this.monthFinish,
      this.monthEquipageNumber,
      this.monthRevenue,
      this.monthSales,
      this.monthStart,
      this.monthAmo,
      this.monthAutres,
      this.monthCarb,
      this.monthChargesCommun,
      this.monthCnss,
      this.monthCoop,
      this.monthEquipage,
      this.monthEquipagePerc,
      this.monthNet,
      this.monthPatron,
      this.monthPatronPerc,
      this.monthPeage,
      this.monthPie,
      this.monthTaxeHalle,
      this.monthTaxeRegion,
      this.monthTotalCnss,
      this.monthTotalGlobal);

  DeclarationMonthModel.fromJson(DocumentSnapshot<Map<dynamic, dynamic>> map) {
    print(map.toString());
    monthStart = map['startDate'];
    monthFinish = map['finishDate'];
    monthEquipageNumber = map['equipageNumber'];
    monthRevenue = map['revenue'];
    monthCnss = map['cnss'];
    monthAmo = map['amo'];
    monthTotalCnss = map['totalCnss'];
    monthTaxeHalle = map['taxeHalle'];
    monthCoop = map['cooperative'];
    monthPeage = map['peage'];
    monthTaxeRegion = map['taxeRegion'];
    monthTotalGlobal = map['totalGlobal'];
    monthCarb = map['carburant'];
    monthAutres = map['autres'];
    monthChargesCommun = map['chargesCommun'];
    monthNet = map['net'];
    monthPatron = map['patron'];
    monthPatronPerc = map['patronPerc'];
    monthEquipage = map['equipage'];
    monthEquipagePerc = map['equipagePerc'];
    monthPie = map['pie'];
  }

  toJson() {
    return {
      //'name': name,
      'startDate': monthStart,
      'finishDate': monthFinish,
      'revenue': monthRevenue,
      'cnss': monthCnss,
      'amo': monthAmo,
      'totalCnss': monthTotalCnss,
      'taxeHalle': monthTaxeHalle,
      'cooperative': monthCoop,
      'peage': monthPeage,
      'taxeRegion': monthTaxeRegion,
      'totalGlobal': monthTotalGlobal,
      'carb': monthCarb,
      'autres': monthAutres,
      'chargesCommun': monthChargesCommun,
      'net': monthNet,
      'patron': monthPatron,
      'patronPerc': monthPatronPerc,
      'equipage': monthEquipage,
      'equipageNumber': monthEquipageNumber,
      'equipagePerc': monthEquipagePerc,
      'pie': monthPie
    };
  }
}
*/
class DecModelController extends GetxController {
  late String id = '';
  late String month = '';
  DecModelController(this.id, this.month);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData(id, month);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future getData(String boat, String month) async {
    DocumentSnapshot boatSnapshot =
        await FirebaseFirestore.instance.collection('boats').doc(boat).get();
    DocumentSnapshot monthSnapshot = await FirebaseFirestore.instance
        .collection('boats')
        .doc(boat)
        .collection('revenue')
        .doc(month)
        .get();
  }

  Future<Uint8List> generatePDF() async {
    final doc = Document();
    final fontReg = await fontFromAssetBundle('res/fonts/Carlito-Regular.ttf');
    final fontEM = await fontFromAssetBundle('res/fonts/EMcomic-Bold.ttf');
    final fontBold = await fontFromAssetBundle('res/fonts/Carlito-Bold.ttf');
    final cnssLogo = await imageFromAssetBundle('res/icons/cnss.png');
    final pda = await imageFromAssetBundle('res/icons/pda.jpg');
    doc.addPage(Page(
        pageFormat: PdfPageFormat.a4,
        orientation: PageOrientation.portrait,
        theme: ThemeData(
            defaultTextStyle: TextStyle(
          font: fontReg,
          fontBold: fontBold,
          fontSize: 12,
        )),
        build: (Context context) {
          return FullPage(
              ignoreMargins: true,
              child: declarationPDF(cnssLogo, fontEM, pda, fontReg));
        }));

    return await doc.save();
  }

  /*
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
  }*/
  /*
            final actions = <PdfPreviewAction>[
              if (!kIsWeb)
                PdfPreviewAction(
                    icon: const Icon(Icons.save), onPressed: saveAsFile),
              PdfPreviewAction(
                  icon: const Icon(Icons.save), onPressed: system)
            ];
*/

}

Column declarationPDF(ImageProvider cnssLogo, TtfFont fontEM, ImageProvider pda,
    TtfFont fontReg) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Row(
      children: [
        SizedBox(width: 20),
        SizedBox(
          width: 100,
          height: 60,
          child: Image(
            cnssLogo,
          ),
        ),
        Expanded(
            child: Column(children: [
          SizedBox(height: 20),
          Center(
              child: Text(
            "Annexe 2",
            style: TextStyle(font: fontEM, fontSize: 14),
          )),
          SizedBox(height: 10),
          Center(
              child: Text(
            "FEUILLE DE DECOMPTE MENSUELLE",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          )),
          SizedBox(height: 10),
          Center(
              child: Text(
            "PECHE ARTISANALE",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          )),
        ])),
        SizedBox(
          width: 100,
          height: 60,
          child: Column(
            children: [
              Image(pda, height: 50),
              SizedBox(
                  height: 10,
                  child: Center(
                      child: Text("MINISTERE DE LA PECHE MARITIME",
                          style: TextStyle(
                            fontSize: 7,
                          ),
                          textAlign: TextAlign.center))),
            ],
          ),
        ),
        SizedBox(width: 10),
      ],
    ),
    SizedBox(height: 10),
    Row(children: [
      SizedBox(width: 100),
      Expanded(
        child: Align(
            alignment: Alignment.center,
            child: Text("Période du",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
      ),
      Expanded(
          child: Align(
        alignment: Alignment.center,
        child: Text(startDate.toString(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      )),
      Expanded(
        child: Align(
            alignment: Alignment.center,
            child: Text("au",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
      ),
      Expanded(
        child: Align(
            alignment: Alignment.center,
            child: Text(finishDate.toString(),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
      ),
      SizedBox(width: 100)
    ]),
    SizedBox(height: 20),
    SizedBox(
      height: 70,
      child: Row(children: [
        SizedBox(width: 25),
        SizedBox(
            width: 100,
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Site/Port de Pêche",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              SizedBox(height: 7),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Nom Barque",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              SizedBox(height: 7),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Matricule Barque",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              SizedBox(height: 7),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Nom Propriétaire",
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ])),
        SizedBox(
            width: 20,
            child: Column(children: [
              Text(":"),
              SizedBox(height: 7),
              Text(":"),
              SizedBox(height: 7),
              Text(":"),
              SizedBox(height: 7),
              Text(":"),
            ])),
        Expanded(
            child: Column(children: [
          Align(
              alignment: Alignment.centerLeft,
              child:
                  Text(region, style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(height: 7),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(boat, style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(height: 7),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(reference,
                  style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(height: 7),
          Align(
              alignment: Alignment.centerLeft,
              child:
                  Text(owner, style: TextStyle(fontWeight: FontWeight.bold))),
        ])),
        SizedBox(
            width: 230,
            child: Column(children: [
              Spacer(),
              SizedBox(
                height: 20,
                child: Row(
                  children: [
                    Container(
                        width: 70,
                        height: 20,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            color: PdfColors.grey.shade(0.1)),
                        child: Center(
                          child: Text(
                            "Total (% Gain)",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        )),
                    Container(
                        width: 70,
                        height: 20,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            color: PdfColors.grey.shade(0.1)),
                        child: Center(
                          child: Text(
                            "Nbre Vente",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        )),
                    Container(
                        width: 90,
                        height: 20,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            color: PdfColors.grey.shade(0.1)),
                        child: Center(
                          child: Text(
                            "Recette Brute(DH)",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Row(
                  children: [
                    Container(
                        width: 70,
                        height: 20,
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                        child: Center(
                          child: Text(
                            marinz.toString() + ",00",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                    Container(
                        width: 70,
                        height: 20,
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                        child: Center(
                          child: Text(
                            sales.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                    Container(
                        width: 90,
                        height: 20,
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                        child: Center(
                          child: Text(
                            revenue.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Spacer()
            ])),
        SizedBox(width: 10)
      ]),
    ),
    SizedBox(height: 10),
    SizedBox(
        height: 20,
        child: Row(children: [
          SizedBox(width: 10),
          Text("Equipage:",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold))
        ])),
    SizedBox(height: 10),
    Row(children: [
      SizedBox(width: 10),
      Expanded(
        child: Table(
          border: TableBorder.all(),
          columnWidths: {
            0: FractionColumnWidth(.15),
            1: FractionColumnWidth(.23),
            2: FractionColumnWidth(.22),
            3: FractionColumnWidth(.13),
            4: FractionColumnWidth(.12),
            5: FractionColumnWidth(.10),
            6: FractionColumnWidth(.08),
            7: FractionColumnWidth(.13),
            8: FractionColumnWidth(.13),
          },
          children: [
            TableRow(children: [
              Container(
                  height: 20,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: PdfColors.grey.shade(0.1)),
                  child: Center(
                    child: Text(
                      " N°CNSS ",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                  height: 20,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: PdfColors.grey.shade(0.1)),
                  child: Center(
                    child: Text(
                      " Nom ",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                  height: 20,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: PdfColors.grey.shade(0.1)),
                  child: Center(
                    child: Text(
                      " Prénom ",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                  height: 20,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: PdfColors.grey.shade(0.1)),
                  child: Center(
                    child: Text(
                      " N°Inscription ",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                  height: 20,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: PdfColors.grey.shade(0.1)),
                  child: Center(
                    child: Text(
                      " CIN ",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                  height: 20,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: PdfColors.grey.shade(0.1)),
                  child: Center(
                    child: Text(
                      " Nbre Part ",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                  height: 20,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: PdfColors.grey.shade(0.1)),
                  child: Center(
                    child: Text(
                      " % Gain ",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                  height: 20,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: PdfColors.grey.shade(0.1)),
                  child: Center(
                    child: Text(
                      " Gain(DH) ",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                  height: 20,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: PdfColors.grey.shade(0.1)),
                  child: Center(
                    child: Text(
                      " Nbre Vente ",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )),
            ]),
          ],
        ),
      ),
      SizedBox(width: 10),
    ]),
    Row(children: [
      SizedBox(width: 10),
      Expanded(
        child: Table(
            border: TableBorder.all(),
            columnWidths: {
              0: FractionColumnWidth(.15),
              1: FractionColumnWidth(.23),
              2: FractionColumnWidth(.22),
              3: FractionColumnWidth(.13),
              4: FractionColumnWidth(.12),
              5: FractionColumnWidth(.10),
              6: FractionColumnWidth(.08),
              7: FractionColumnWidth(.13),
              8: FractionColumnWidth(.13),
            },
            children: bahara),
      ),
      SizedBox(width: 10),
    ]),
    SizedBox(height: 20),
    Row(children: [
      SizedBox(width: 10),
      Expanded(
          child: Column(children: [
        Container(
            height: 20,
            decoration: BoxDecoration(
                border: Border.all(width: 1), color: PdfColors.grey.shade(0.1)),
            child: Center(
              child: Text(
                " Prélèvements au niveau de l'ONP ",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            )),
        Row(children: [
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    " Libellé ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    " % ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    " Valeur(DH) ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        ]),
        Row(children: [
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " CNSS ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    " 6.00% ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    cnss.toString(),
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
        ]),
        Row(children: [
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " AMO ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    " 1.70% ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    amo.toString(),
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
        ]),
        Row(children: [
          Expanded(
            flex: 2,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    " Total CNSS ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    totalCnss.toString(),
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
        ]),
        Row(children: [
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " Taxe Halle ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    " 4.00% ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    taxeHalle.toString(),
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
        ]),
        Row(children: [
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " Coopér./Ass. ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    subPerc.toString() + "% ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    sub.toString(),
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
        ]),
        Row(children: [
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " Péage ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    " 0.00% ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    " 0.00 ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
        ]),
        Row(children: [
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " Taxe Région ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    " 0.16% ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    taxeRegion.toString(),
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
        ]),
        Row(children: [
          Expanded(
            flex: 2,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    " Total Global ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    totalGlobal.toString(),
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        ]),
      ])),
      SizedBox(width: 40),
      Expanded(
          child: Column(children: [
        Container(
            height: 20,
            decoration: BoxDecoration(
                border: Border.all(width: 1), color: PdfColors.grey.shade(0.1)),
            child: Center(
              child: Text(
                " Autre Dépenses ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            )),
        Row(children: [
          Expanded(
            flex: 3,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " Carburant (DH) ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 2,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    carb.toString(),
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
        ]),
        Row(children: [
          Expanded(
            flex: 3,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " Autres Charges Communes(DH) ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 2,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    " 0.00 ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
        ]),
        Row(children: [
          Expanded(
            flex: 3,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " Charges Comm. Hors CNSS(DH) ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 2,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    charges.toString(),
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
        ]),
        SizedBox(height: 20),
        Container(
            height: 20,
            decoration: BoxDecoration(
                border: Border.all(width: 1), color: PdfColors.grey.shade(0.1)),
            child: Center(
              child: Text(
                " Répartition des Gains ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            )),
        Row(children: [
          Expanded(
            flex: 3,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " Net à Répartir (DH) ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 2,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    net.toString(),
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
        ]),
        Row(children: [
          Expanded(
            flex: 3,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " Part Armateur (DH) ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 2,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    patron.toString(),
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
        ]),
        Row(children: [
          Expanded(
            flex: 3,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " Part Equipage (DH) ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 2,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    payTotal.toString(),
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
        ]),
        Row(children: [
          Expanded(
            flex: 3,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " Pourcentage Equipage ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 2,
            child: Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    " 60.00% ",
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
        ]),
      ])),
      SizedBox(width: 10)
    ]),
    SizedBox(height: 20),
    Row(
      children: [
        SizedBox(width: 10),
        Expanded(
            child: Column(children: [
          Container(
              height: 20,
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  color: PdfColors.grey.shade(0.1)),
              child: Center(
                child: Text(
                  " Cachets et Signatures ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              )),
          Row(children: [
            Expanded(
              child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      " Propriétaires/Représentant ",
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(fontSize: 12, font: fontReg),
                    ),
                  )),
            ),
            Expanded(
              child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      " Coopérative/Association ou Patron ",
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(fontSize: 12, font: fontReg),
                    ),
                  )),
            ),
            Expanded(
              child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      " Visa DPM ",
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(fontSize: 12, font: fontReg),
                    ),
                  )),
            ),
          ]),
          Row(children: [
            Expanded(
              child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      " ",
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(fontSize: 12, font: fontReg),
                    ),
                  )),
            ),
            Expanded(
              child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      " ",
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(fontSize: 12, font: fontReg),
                    ),
                  )),
            ),
            Expanded(
              child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      " ",
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(fontSize: 12, font: fontReg),
                    ),
                  )),
            ),
          ])
        ])),
        SizedBox(width: 10),
      ],
    ),
    Spacer(),
    Row(children: [
      SizedBox(width: 10),
      Text(
        "Date d'Etablissement : " +
            DateFormat('dd/MM/yyyy').format(DateTime.now()),
      ),
      Spacer(),
      Text("Date de Récéption : .........................."),
      SizedBox(width: 10)
    ]),
    SizedBox(height: 10),
  ]);
}
