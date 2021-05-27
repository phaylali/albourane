//import 'dart:convert';
import 'dart:typed_data';

import 'package:admin/declarationWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

//import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart';

@immutable
class Boat {
  Boat({
    required this.boatName,
    required this.boatReference,
    required this.boatRegion,
    required this.boatOwner,
    required this.boatCoopPerc,
  });

  Boat.fromJson(Map<String, Object?> json)
      : this(
          boatName: json['name']! as String,
          boatOwner: json['owner']! as String,
          boatReference: json['reference']! as String,
          boatRegion: json['region']! as String,
          boatCoopPerc: json['sub']! as num,
        );
  Map<String, Object?> toJson() {
    return {};
  }

  final String boatName;
  final String boatReference;
  final String boatRegion;
  final String boatOwner;
  final num boatCoopPerc;
}

@immutable
class Marin {
  Marin({
    required this.marinLastName,
    required this.marinFirstName,
    required this.marinReference,
    required this.marinCnss,
    required this.marinCin,
  });

  Marin.fromJson(Map<String, Object?> json)
      : this(
          marinLastName: json['name']! as String,
          marinFirstName: json['owner']! as String,
          marinReference: json['reference']! as String,
          marinCnss: json['region']! as String,
          marinCin: json['sub']! as String,
        );

  final String marinLastName;
  final String marinFirstName;
  final String marinReference;
  final String marinCnss;
  final String marinCin;
}

@immutable
class Declaration {
  Declaration({
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
    required this.monthTotalGlobal,
    //required this.boat,
    //required this.marins,
  });

  Declaration.fromJson(
    Map<String, Object?> json,
  ) : this(
          //marins: (json['marins']! as List).cast<Marin>(),
          //boat: Boat.fromJson(json['boat']! as Map<String, Object?>),
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
  //final List<Marin> marins;
  //final Boat boat;
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

class DecModelController extends GetxController {
  late String id;
  late String month;
  late Declaration monthDec;
  late Boat boatDec;

  DecModelController(this.id, this.month);
  @override
  void onInit() async {
    super.onInit();
    await getData(id, month);
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getData(boat, month) async {
    final boatRef = await FirebaseFirestore.instance
        .collection('boats')
        .doc(boat)
        .withConverter<Boat>(
          fromFirestore: (snapshots, _) => Boat.fromJson(snapshots.data()!),
          toFirestore: (boat, _) => boat.toJson(),
        );
    final monthRef = await FirebaseFirestore.instance
        .collection('boats')
        .doc(boat)
        .collection('revenue')
        .doc(month)
        .withConverter<Declaration>(
          fromFirestore: (snapshots, _) =>
              Declaration.fromJson(snapshots.data()!),
          toFirestore: (month, _) => month.toJson(),
        );

    final monthly = await monthRef.get().then((s) => s.data());
    final boatly = await boatRef.get().then((s) => s.data());
    update();
    /*  
    final marinsRef = await FirebaseFirestore.instance
        .collection('boats')
        .doc(boat)
        .collection('revenue')
        .doc(month)
        .withConverter<Declaration>(
          fromFirestore: (snapshots, _) =>
              Declaration.fromJson(snapshots.data()!),
          toFirestore: (month, _) => month.toJson(),
        );*/
    return {monthDec = monthly!, boatDec = boatly!};
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
          //final dec = Declaration.fromJson();
          return FullPage(
              ignoreMargins: true,
              child: Row(children: [
                SizedBox(width: 20),
                Expanded(
                    child: Center(
                  child: Column(children: [
                    margin(),
                    decHeader(cnssLogo, fontEM, fontReg, pda),
                    marginMini(),
                    decDate(monthDec),
                    marginMini(),
                    decInfo(monthDec, boatDec),
                    marginMini(),
                    decEquipageTitle(),
                    marginMini(),
                    decMarinzTitle(),
                    marginMini(),
                    decDetails(monthDec, boatDec),
                    marginMini(),
                    Spacer(),
                    decSignature(),
                    marginMini(),
                    decDateNow(),
                    margin()
                  ]),
                )),
                SizedBox(width: 20)
              ])

              //declarationPDF(cnssLogo, fontEM, pda, fontReg, dec)

              );
        }));

    return await doc.save();
  }
}
