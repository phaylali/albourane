import 'dart:typed_data';

//import 'package:flutter/services.dart';
//import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Uint8List> generatePDF() async {
  final doc = Document();

  //final font1 = await rootBundle.load('res/google_fonts/Tajawal-Light.ttf');
  //final font2 = await rootBundle.load('res/google_fonts/Tajawal-Bold.ttf');
  final cnss = await imageFromAssetBundle('res/icons/cnss.png');
  final pda = await imageFromAssetBundle('res/icons/pda.jpg');

  doc.addPage(Page(
      pageFormat: PdfPageFormat.a4,
      orientation: PageOrientation.portrait,
      build: (Context context) {
        return FullPage(
            ignoreMargins: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 20),
                    SizedBox(
                      width: 120,
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Image(cnss, height: 70),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Column(children: [
                      SizedBox(height: 20),
                      Center(
                          child: Text(
                        "Annexe 2",
                        style: TextStyle(
                            //font: ttf,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      )),
                      SizedBox(height: 15),
                      Center(
                          child: Text(
                        "FEUILLE DE DECOMPTE MENSUELLE",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )),
                      SizedBox(height: 15),
                      Center(
                          child: Text(
                        "PECHE ARTISANALE",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )),
                    ])),
                    SizedBox(
                      width: 120,
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Image(pda, height: 50),
                          SizedBox(
                              height: 20,
                              child: Center(
                                  child: Text("MINISTERE DE LA PECHE MARITIME",
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center))),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(height: 15),
                Center(
                    child: Text(
                  "Période du    01/01/2021    au    31/01/2021",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                )),
                SizedBox(height: 20),
                Row(children: [
                  SizedBox(width: 25),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Site/Port de Pêche :    OUEDLAOU",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Nom Barque           :    ADKOUK-2",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Matricule Barque   :    3/1-1178",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Nom Propriétaire   :    BENAMAR REDOUAN",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        SizedBox(height: 25),
                        SizedBox(
                          height: 19,
                          child: Row(
                            children: [
                              Container(
                                  width: 80,
                                  height: 19,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: PdfColors.grey.shade(0.1)),
                                  child: Padding(
                                    padding: EdgeInsets.all(2),
                                    child: Text("Total (% Gain)",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center),
                                  )),
                              Container(
                                  width: 80,
                                  height: 19,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: PdfColors.grey.shade(0.1)),
                                  child: Padding(
                                    padding: EdgeInsets.all(2),
                                    child: Text("Nbre Vente",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center),
                                  )),
                              Container(
                                  width: 100,
                                  height: 19,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: PdfColors.grey.shade(0.1)),
                                  child: Padding(
                                    padding: EdgeInsets.all(2),
                                    child: Text("Recette Brute(DH)",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
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
                                  width: 80,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1)),
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
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
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1)),
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Text("11",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center),
                                  )),
                              Container(
                                  width: 100,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1)),
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
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
                        SizedBox(height: 50)
                      ])),
                  SizedBox(width: 10),
                ]),
                SizedBox(
                    height: 20,
                    child: Row(children: [
                      SizedBox(width: 10),
                      Text("Equipage:",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold))
                    ]))
              ],
            ));
      }));

  return await doc.save();
}
