import 'package:admin/declarationModel.dart';
import 'package:pdf/widgets.dart';

Column declarationPDF(ImageProvider cnssLogo, TtfFont fontEM, ImageProvider pda,
    TtfFont fontReg, Declaration dec) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    /*Row(
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
    */

    // BAHARA
    /*
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
    SizedBox(height: 20),*/
/*
    
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
    ]),*/
    /*
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
    ),*/
    /*
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
    SizedBox(height: 10),*/
  ]);
}
