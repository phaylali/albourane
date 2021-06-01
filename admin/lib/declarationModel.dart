import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:admin/declarationWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'declarationWidgets.dart';
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
          marinLastName: json['lastName']! as String,
          marinFirstName: json['firstName']! as String,
          marinReference: json['reference']! as String,
          marinCnss: json['cnss']! as String,
          marinCin: json['cni']! as String,
        );
  Map<String, Object?> toJson() {
    return {};
  }

  final String marinLastName;
  final String marinFirstName;
  final String marinReference;
  final String marinCnss;
  final String marinCin;
}

@immutable
class Month {
  Month({
    required this.bahara,
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

  Month.fromJson(
    Map<String, Object?> json,
  ) : this(
          //bahara: (json['marins']! as List).cast<Marin>(),
          //boat: Boat.fromJson(json['boat']! as Map<String, Object?>),
          //bahara: List<Marin>.from(json['bahara']! as List<Marin>),
          bahara: json['bahara']! as List,
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
  //final List<Marin> bahara;
  //final Boat boat;
  final List bahara;
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
      'bahara': bahara,
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
  final String id;
  final String month;
  late Month? monthDec;
  late Boat? boatDec;

  List<Row> marinsRows = [];
  DecModelController(
    this.id,
    this.month,
  );
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getMarins(ido, month) async {
    print('run 1 + $ido');
    await FirebaseFirestore.instance
        .collection('seamen')
        .doc(ido)
        .withConverter<Marin>(
          fromFirestore: (snapshots, _) => Marin.fromJson(snapshots.data()!),
          toFirestore: (marin, _) => marin.toJson(),
        )
        .get()
        .then((value) {
      print('run 2 + $ido + ' + value.toString());
      marinsRows.add(decMarinRow(value.data()!, month));
    });
  }

  Future getData(boat, month) async {
    final boatRef = await FirebaseFirestore.instance
        .collection('boats')
        .doc(boat)
        .withConverter<Boat>(
          fromFirestore: (snapshots, _) => Boat.fromJson(snapshots.data()!),
          toFirestore: (boat, _) => boat.toJson(),
        );
    final boatly = await boatRef.get().then((s) => s.data());
    final monthRef = await FirebaseFirestore.instance
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
    print('length is : ' + monthly.bahara.length.toString());

    return {
      monthDec = monthly,
      boatDec = boatly,
    };
  }

  Future<Uint8List> generatePDF() async {
    final doc = Document();
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

    return await doc.save();
  }
}
