import 'package:admin/header.dart';
import 'package:flutter/material.dart';

import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';

class PDFTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainBody(title: "تجربة", child: MyApp());
  }
}

typedef LayoutCallbackWithData = Future<Uint8List> Function(
    PdfPageFormat pageFormat, CustomData data);

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  PrintingInfo? printingInfo;

  var _data = CustomData();

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<void> _init() async {
    final info = await Printing.info();
    setState(() {
      printingInfo = info;
    });
  }

  void _showPrintedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document printed successfully'),
      ),
    );
  }

  void _showSharedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document shared successfully'),
      ),
    );
  }

  Future<void> _saveAsFile(
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
  }

  @override
  Widget build(BuildContext context) {
    pw.RichText.debug = true;

    final actions = <PdfPreviewAction>[
      if (!kIsWeb)
        PdfPreviewAction(
          icon: const Icon(Icons.save),
          onPressed: _saveAsFile,
        )
    ];

    return PdfPreview(
      maxPageWidth: 700,
      build: (format) => generateInvoice(format, _data),
      actions: actions,
      onPrinted: _showPrintedToast,
      onShared: _showSharedToast,
    );
  }
}

Future<Uint8List> generateInvoice(
    PdfPageFormat pageFormat, CustomData data) async {
  final lorem = pw.LoremText();

  final products = <Product>[
    Product('19874', lorem.sentence(4), 3.99, 2),
    Product('98452', lorem.sentence(6), 15, 2),
    Product('28375', lorem.sentence(4), 6.95, 3),
    Product('95673', lorem.sentence(3), 49.99, 4),
    Product('23763', lorem.sentence(2), 560.03, 1),
    Product('55209', lorem.sentence(5), 26, 1),
    Product('09853', lorem.sentence(5), 26, 1),
    Product('23463', lorem.sentence(5), 34, 1),
    Product('56783', lorem.sentence(5), 7, 4),
    Product('78256', lorem.sentence(5), 23, 1),
    Product('23745', lorem.sentence(5), 94, 1),
    Product('07834', lorem.sentence(5), 12, 1),
    Product('23547', lorem.sentence(5), 34, 1),
    Product('98387', lorem.sentence(5), 7.99, 2),
  ];

  final invoice = Invoice(
    invoiceNumber: '982347',
    products: products,
    customerName: 'Abraham Swearegin',
    customerAddress: '54 rue de Rivoli\n75001 Paris, France',
    paymentInfo:
        '4509 Wiseman Street\nKnoxville, Tennessee(TN), 37929\n865-372-0425',
    tax: .15,
    baseColor: PdfColors.teal,
    accentColor: PdfColors.blueGrey900,
  );

  return await invoice.buildPdf(pageFormat);
}

class Invoice {
  Invoice({
    required this.products,
    required this.customerName,
    required this.customerAddress,
    required this.invoiceNumber,
    required this.tax,
    required this.paymentInfo,
    required this.baseColor,
    required this.accentColor,
  });

  final List<Product> products;
  final String customerName;
  final String customerAddress;
  final String invoiceNumber;
  final double tax;
  final String paymentInfo;
  final PdfColor baseColor;
  final PdfColor accentColor;

  String? _logo;

  Future<Uint8List> buildPdf(PdfPageFormat pageFormat) async {
    // Create a PDF document.
    final doc = pw.Document();

    final font3 = await rootBundle.load('res/google_fonts/Tajawal-Bold.ttf');

    _logo = await rootBundle.loadString('res/icons/anchor.svg');
    // _bgShape = await rootBundle.loadString('res/logos/cnss.png');

    // Add page to the PDF
    doc.addPage(
      pw.Page(
          pageTheme: _buildTheme(
            pageFormat,
            pw.Font.ttf(font3),
            pw.Font.ttf(font3),
            pw.Font.ttf(font3),
          ),
          build: (context) {
            return _buildHeader(context);
          }),
    );

    // Return the PDF file content
    return doc.save();
  }

  pw.Widget _buildHeader(pw.Context context) {
    return pw.FullPage(
        ignoreMargins: true,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.SizedBox(height: 20),
            pw.Row(
              children: [
                pw.SizedBox(width: 20),
                pw.SizedBox(
                  width: 120,
                  child: pw.Column(
                    children: [
                      pw.SizedBox(height: 70, child: pw.SvgImage(svg: _logo!)),
                      pw.SizedBox(height: 10),
                      pw.SizedBox(height: 20),
                    ],
                  ),
                ),
                pw.Expanded(
                    child: pw.Column(children: [
                  pw.SizedBox(height: 20),
                  pw.Center(
                      child: pw.Text(
                    "Annexe 2",
                    style: pw.TextStyle(
                        fontSize: 12, fontWeight: pw.FontWeight.bold),
                  )),
                  pw.SizedBox(height: 15),
                  pw.Center(
                      child: pw.Text(
                    "FEUILLE DE DECOMPTE MENSUELLE",
                    style: pw.TextStyle(
                        fontSize: 12, fontWeight: pw.FontWeight.bold),
                  )),
                  pw.SizedBox(height: 15),
                  pw.Center(
                      child: pw.Text(
                    "PECHE ARTISANALE",
                    style: pw.TextStyle(
                        fontSize: 12, fontWeight: pw.FontWeight.bold),
                  )),
                ])),
                pw.SizedBox(
                  width: 120,
                  child: pw.Column(
                    children: [
                      pw.SizedBox(
                        height: 70,
                        child: pw.SvgImage(svg: _logo!),
                      ),
                      pw.SizedBox(height: 10),
                      pw.SizedBox(
                          height: 20,
                          child: pw.Center(
                              child: pw.Text("MINISTERE DE LA PECHE MARITIME",
                                  style: pw.TextStyle(
                                      fontSize: 7,
                                      fontWeight: pw.FontWeight.bold),
                                  textAlign: pw.TextAlign.center))),
                    ],
                  ),
                ),
                pw.SizedBox(width: 20),
              ],
            ),
            pw.SizedBox(height: 15),
            pw.Center(
                child: pw.Text(
              "Période du    01/01/2021    au    31/01/2021",
              style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
            )),
            pw.SizedBox(height: 20),
            pw.Row(children: [
              pw.SizedBox(width: 25),
              pw.Expanded(
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        "Site/Port de Pêche :    OUEDLAOU",
                        textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(
                            fontSize: 12, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        "Nom Barque           :    ADKOUK-2",
                        textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(
                            fontSize: 12, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        "Matricule Barque   :    3/1-1178",
                        textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(
                            fontSize: 12, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        "Nom Propriétaire   :    BENAMAR REDOUAN",
                        textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(
                            fontSize: 12, fontWeight: pw.FontWeight.bold),
                      ),
                    ]),
              ),
              pw.Expanded(
                  child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                    pw.SizedBox(height: 25),
                    pw.SizedBox(
                      height: 19,
                      child: pw.Row(
                        children: [
                          pw.Container(
                              width: 80,
                              height: 19,
                              decoration: pw.BoxDecoration(
                                  border: pw.Border.all(width: 1),
                                  color: PdfColors.grey.shade(0.1)),
                              child: pw.Padding(
                                padding: pw.EdgeInsets.all(2),
                                child: pw.Text("Total (% Gain)",
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                    textAlign: pw.TextAlign.center),
                              )),
                          pw.Container(
                              width: 80,
                              height: 19,
                              decoration: pw.BoxDecoration(
                                  border: pw.Border.all(width: 1),
                                  color: PdfColors.grey.shade(0.1)),
                              child: pw.Padding(
                                padding: pw.EdgeInsets.all(2),
                                child: pw.Text("Nbre Vente",
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                    textAlign: pw.TextAlign.center),
                              )),
                          pw.Container(
                              width: 100,
                              height: 19,
                              decoration: pw.BoxDecoration(
                                  border: pw.Border.all(width: 1),
                                  color: PdfColors.grey.shade(0.1)),
                              child: pw.Padding(
                                padding: pw.EdgeInsets.all(2),
                                child: pw.Text("Recette Brute(DH)",
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                    textAlign: pw.TextAlign.center),
                              )),
                        ],
                      ),
                    ),
                    pw.SizedBox(
                      height: 20,
                      child: pw.Row(
                        children: [
                          pw.Container(
                              width: 80,
                              height: 20,
                              decoration: pw.BoxDecoration(
                                  border: pw.Border.all(width: 1)),
                              child: pw.Padding(
                                padding: pw.EdgeInsets.all(3),
                                child: pw.Text("2,00",
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                    textAlign: pw.TextAlign.center),
                              )),
                          pw.Container(
                              width: 80,
                              height: 20,
                              decoration: pw.BoxDecoration(
                                  border: pw.Border.all(width: 1)),
                              child: pw.Padding(
                                padding: pw.EdgeInsets.all(3),
                                child: pw.Text("11",
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                    textAlign: pw.TextAlign.center),
                              )),
                          pw.Container(
                              width: 100,
                              height: 20,
                              decoration: pw.BoxDecoration(
                                  border: pw.Border.all(width: 1)),
                              child: pw.Padding(
                                padding: pw.EdgeInsets.all(3),
                                child: pw.Text("15082,00",
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                    textAlign: pw.TextAlign.center),
                              )),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 50)
                  ])),
              pw.SizedBox(width: 10),
            ])
          ],
        ));
  }

  pw.PageTheme _buildTheme(
      PdfPageFormat pageFormat, pw.Font base, pw.Font bold, pw.Font italic) {
    return pw.PageTheme(
      pageFormat: pageFormat,
    );
  }
}

String _formatCurrency(double amount) {
  return '\$${amount.toStringAsFixed(2)}';
}

class Product {
  const Product(
    this.sku,
    this.productName,
    this.price,
    this.quantity,
  );

  final String sku;
  final String productName;
  final double price;
  final int quantity;
  double get total => price * quantity;

  String getIndex(int index) {
    switch (index) {
      case 0:
        return sku;
      case 1:
        return productName;
      case 2:
        return _formatCurrency(price);
      case 3:
        return quantity.toString();
      case 4:
        return _formatCurrency(total);
    }
    return '';
  }
}

class CustomData {
  const CustomData({this.name = '[your name]'});

  final String name;
}
