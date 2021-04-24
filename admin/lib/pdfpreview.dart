import 'dart:typed_data';

//import 'package:flutter/services.dart';
//import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Uint8List> generatePDF() async {
  final doc = Document();

  //final fontReg = await rootBundle.load('res/fonts/Carlito-Regular.ttf');
  //final fontBold = await rootBundle.load('res/fonts/Carlito-Bold.ttf');
  final fontEM = await fontFromAssetBundle('res/fonts/EMcomic-Bold.ttf');
  final fontBold = await fontFromAssetBundle('res/fonts/Carlito-Bold.ttf');
  final fontUgly = await fontFromAssetBundle('res/fonts/LDFComicSansBold.ttf');
  final cnss = await imageFromAssetBundle('res/icons/cnss.png');
  final pda = await imageFromAssetBundle('res/icons/pda.jpg');

  doc.addPage(Page(
      pageFormat: PdfPageFormat.a4,
      orientation: PageOrientation.portrait,
      theme:
          ThemeData(defaultTextStyle: TextStyle(font: fontBold, fontSize: 12)),
      build: (Context context) {
        return FullPage(
            ignoreMargins: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 20),
                    SizedBox(
                      width: 100,
                      height: 60,
                      child: Image(
                        cnss,
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
                        style: TextStyle(fontSize: 14),
                      )),
                      SizedBox(height: 10),
                      Center(
                          child: Text(
                        "PECHE ARTISANALE",
                        style: TextStyle(fontSize: 14),
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
                Center(
                    child: Text(
                        "Période du         01/01/2021    au    31/01/2021",
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center)),
                SizedBox(height: 17),
                Row(children: [
                  SizedBox(width: 25),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Site/Port de Pêche :       OUEDLAOU",
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 7),
                          Text(
                            "Nom Barque           :       ADKOUK-2",
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 7),
                          Text(
                            "Matricule Barque   :       3/1-1178",
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 7),
                          Text(
                            "Nom Propriétaire   :       BENAMAR REDOUAN",
                            textAlign: TextAlign.left,
                          ),
                        ]),
                  ),
                  SizedBox(width: 50),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        SizedBox(height: 10),
                        SizedBox(
                          height: 19,
                          child: Row(
                            children: [
                              Container(
                                  width: 70,
                                  height: 19,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: PdfColors.grey.shade(0.1)),
                                  child: Center(
                                    child: Text("Total (% Gain)",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                        textAlign: TextAlign.center),
                                  )),
                              Container(
                                  width: 70,
                                  height: 19,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: PdfColors.grey.shade(0.1)),
                                  child: Center(
                                    child: Text("Nbre Vente",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                        textAlign: TextAlign.center),
                                  )),
                              Container(
                                  width: 90,
                                  height: 19,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: PdfColors.grey.shade(0.1)),
                                  child: Center(
                                    child: Text("Recette Brute(DH)",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                        textAlign: TextAlign.center),
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
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1)),
                                  child: Center(
                                    child: Text("2,00",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center),
                                  )),
                              Container(
                                  width: 70,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1)),
                                  child: Center(
                                    child: Text("11",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center),
                                  )),
                              Container(
                                  width: 90,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1)),
                                  child: Center(
                                    child: Text("15082,00",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height: 30)
                      ])),
                  //SizedBox(width: 10),
                ]),
                SizedBox(
                    height: 20,
                    child: Row(children: [
                      SizedBox(width: 20),
                      Text("Equipage:",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold))
                    ])),
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      SizedBox(height: 10),
                      SizedBox(
                        height: 20,
                        child: Row(
                          children: [
                            SizedBox(width: 30),
                            Expanded(
                              child: Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: PdfColors.grey.shade(0.1)),
                                  child: Center(
                                    child: Text("N°CNSS",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                        textAlign: TextAlign.center),
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: PdfColors.grey.shade(0.1)),
                                  child: Center(
                                    child: Text("Nom",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                        textAlign: TextAlign.center),
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: PdfColors.grey.shade(0.1)),
                                  child: Center(
                                    child: Text("Prénom",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                        textAlign: TextAlign.center),
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: PdfColors.grey.shade(0.1)),
                                  child: Center(
                                    child: Text("N°Inscription",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                        textAlign: TextAlign.center),
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: PdfColors.grey.shade(0.1)),
                                  child: Center(
                                    child: Text("N°CIN",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                        textAlign: TextAlign.center),
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: PdfColors.grey.shade(0.1)),
                                  child: Center(
                                    child: Text("Nbre Part",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                        textAlign: TextAlign.center),
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: PdfColors.grey.shade(0.1)),
                                  child: Center(
                                    child: Text("% Gain",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                        textAlign: TextAlign.center),
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: PdfColors.grey.shade(0.1)),
                                  child: Center(
                                    child: Text("Gain(DH)",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                        textAlign: TextAlign.center),
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: PdfColors.grey.shade(0.1)),
                                  child: Center(
                                    child: Text("Nbre Vente",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                        textAlign: TextAlign.center),
                                  )),
                            ),
                            SizedBox(width: 30),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: Row(
                          children: [
                            SizedBox(width: 30),
                            Container(
                                width: 70,
                                height: 20,
                                decoration:
                                    BoxDecoration(border: Border.all(width: 1)),
                                child: Center(
                                  child: Text("2,00",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center),
                                )),
                            Container(
                                width: 80,
                                height: 20,
                                decoration:
                                    BoxDecoration(border: Border.all(width: 1)),
                                child: Center(
                                  child: Text("11",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center),
                                )),
                            Container(
                                width: 90,
                                height: 20,
                                decoration:
                                    BoxDecoration(border: Border.all(width: 1)),
                                child: Center(
                                  child: Text("15082,00",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center),
                                )),
                            SizedBox(width: 30),
                          ],
                        ),
                      ),
                      SizedBox(height: 50)
                    ])),
              ],
            ));
      }));

  return await doc.save();
}
