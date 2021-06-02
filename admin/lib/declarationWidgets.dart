import 'package:admin/declarationModel.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Row decDetails(Month month, Boat boat) {
  return Row(children: [
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
                  " Valeur (DH) ",
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
                  " 6,00% ",
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
                  month.monthCnss.toStringAsFixed(2).replaceAll(".", ",") +
                      "  ",
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
                  " 1,70% ",
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
                  month.monthAmo.toStringAsFixed(2).replaceAll(".", ",") + "  ",
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
                  month.monthTotalCnss.toStringAsFixed(2).replaceAll(".", ",") +
                      "  ",
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
                  month.monthTaxeHalle.toStringAsFixed(2).replaceAll(".", ",") +
                      "  ",
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
                  boat.boatCoopPerc.toStringAsFixed(2).replaceAll(".", ",") +
                      "% ",
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
                  month.monthCoop.toStringAsFixed(2).replaceAll(".", ",") +
                      "  ",
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
                  " 0,00% ",
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
                  "0,00" + "  ",
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
                  " 0,16% ",
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
                  month.monthTaxeRegion
                          .toStringAsFixed(2)
                          .replaceAll(".", ",") +
                      "  ",
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
                  month.monthTotalGlobal
                          .toStringAsFixed(2)
                          .replaceAll(".", ",") +
                      "  ",
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
              " Autres Dépenses ",
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
                  month.monthCarb.toStringAsFixed(2).replaceAll(".", ",") +
                      "  ",
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
                  " Autres Charges Communes (DH) ",
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(
                    fontSize: 11,
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
                  month.monthAutres.toStringAsFixed(2).replaceAll(".", ",") +
                      "  ",
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
                  " Charges Comm. Hors CNSS (DH) ",
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(
                    fontSize: 11,
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
                  month.monthChargesCommun
                          .toStringAsFixed(2)
                          .replaceAll(".", ",") +
                      "  ",
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
                  month.monthNet.toStringAsFixed(2).replaceAll(".", ",") + "  ",
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
                  month.monthPatron.toStringAsFixed(2).replaceAll(".", ",") +
                      "  ",
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
                  month.monthEquipage.toStringAsFixed(2).replaceAll(".", ",") +
                      "  ",
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
  ]);
}

Row decSignature() {
  return Row(children: [
    SizedBox(width: 10),
    Expanded(
        child: Column(children: [
      Container(
          height: 20,
          decoration: BoxDecoration(
              border: Border.all(width: 1), color: PdfColors.grey.shade(0.1)),
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
                  style: TextStyle(
                    fontSize: 12,
                  ),
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
                  style: TextStyle(
                    fontSize: 12,
                  ),
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
                  style: TextStyle(
                    fontSize: 12,
                  ),
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
                  style: TextStyle(
                    fontSize: 12,
                  ),
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
                  style: TextStyle(
                    fontSize: 12,
                  ),
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
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              )),
        ),
      ])
    ])),
    SizedBox(width: 10),
  ]);
}

SizedBox decEquipageTitle() {
  return SizedBox(
      height: 20,
      child: Row(children: [
        SizedBox(width: 10),
        Text("Equipage:",
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold))
      ]));
}

Row decHeader(
    ImageProvider cnssLogo, Font fontEM, Font fontReg, ImageProvider pda) {
  return Row(
    children: [
      SizedBox(width: 10),
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
    ],
  );
}

SizedBox margin() => SizedBox(height: 20);
SizedBox marginMini() => SizedBox(height: 10);
Row decDateNow() {
  return Row(children: [
    SizedBox(width: 10),
    Text(
        "Date d'Etablissement : " +
            DateFormat('dd/MM/yyyy').format(DateTime.now()),
        style: TextStyle(fontStyle: FontStyle.italic)),
    Spacer(),
    Text("Date de Récéption : ..........................",
        style: TextStyle(fontStyle: FontStyle.italic)),
    SizedBox(width: 10)
  ]);
}

Row decMarinzTitle() {
  return Row(children: [
    SizedBox(width: 10),
    Expanded(
      child: Table(
        border: TableBorder.all(),
        columnWidths: {
          0: FractionColumnWidth(.15),
          1: FractionColumnWidth(.23),
          2: FractionColumnWidth(.16),
          3: FractionColumnWidth(.14),
          4: FractionColumnWidth(.12),
          5: FractionColumnWidth(.10),
          6: FractionColumnWidth(.08),
          7: FractionColumnWidth(.13),
          8: FractionColumnWidth(.12),
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
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                )),
          ]),
        ],
      ),
    ),
    SizedBox(width: 10),
  ]);
}

Row decMarinRow(Marin marin, Month month) {
  return Row(children: [
    SizedBox(width: 10),
    Expanded(
      child: Table(
        border: TableBorder.all(),
        columnWidths: {
          0: FractionColumnWidth(.15),
          1: FractionColumnWidth(.23),
          2: FractionColumnWidth(.16),
          3: FractionColumnWidth(.14),
          4: FractionColumnWidth(.12),
          5: FractionColumnWidth(.10),
          6: FractionColumnWidth(.08),
          7: FractionColumnWidth(.13),
          8: FractionColumnWidth(.12),
        },
        children: [
          TableRow(children: [
            Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Center(
                  child: Text(
                    marin.marinCnss,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                )),
            Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(' ' + marin.marinLastName.toString(),
                        softWrap: false,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 11,
                        ),
                        overflow: TextOverflow.clip))),
            Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(' ' + marin.marinFirstName.toUpperCase(),
                      softWrap: false,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 11,
                      ),
                      overflow: TextOverflow.clip),
                )),
            Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Center(
                  child: Text(
                    marin.marinReference,
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                )),
            Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Center(
                  child: Text(
                    marin.marinCin,
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                )),
            Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Center(
                  child: Text(
                    "1",
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                )),
            Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Center(
                  child: Text(
                    "1",
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                )),
            Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Center(
                  child: Text(
                    month.monthPie.toStringAsFixed(2).replaceAll(".", ","),
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                )),
            Container(
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Center(
                  child: Text(
                    month.monthSales.toString(),
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                )),
          ]),
        ],
      ),
    ),
    SizedBox(width: 10),
  ]);
}

SizedBox decInfo(Month month, Boat boat) {
  return SizedBox(
    height: 70,
    child: Row(children: [
      SizedBox(width: 10),
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
            child: Text(boat.boatRegion,
                style: TextStyle(fontWeight: FontWeight.bold))),
        SizedBox(height: 7),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(boat.boatName,
                style: TextStyle(fontWeight: FontWeight.bold))),
        SizedBox(height: 7),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(boat.boatReference,
                style: TextStyle(fontWeight: FontWeight.bold))),
        SizedBox(height: 7),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(boat.boatOwner,
                style: TextStyle(fontWeight: FontWeight.bold))),
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
                          month.monthEquipageNumber
                              .toStringAsFixed(2)
                              .replaceAll(".", ","),
                          //.toString() + ",00",
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
                          month.monthSales.toString(),
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
                          month.monthRevenue
                              .toStringAsFixed(2)
                              .replaceAll(".", ","),
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
  );
}

Row decDate(Month month) {
  return Row(children: [
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
      child: Text(month.monthStart,
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
          child: Text(month.monthFinish,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
    ),
    SizedBox(width: 100)
  ]);
}
