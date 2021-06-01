import 'package:admin/declarationModel.dart';
import 'package:admin/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class DeclarationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String id = Get.parameters['id']!;
    final String month = Get.parameters['m']!;

    return MainBody(
        title: "تصريح",
        child: GetBuilder<DecModelController>(
          init: DecModelController(id, month),
          builder: (b) {
            return FutureBuilder(
              future: b.getData(id, month),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }

                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                print("CNSS/ID_$id/M_$month");
                return PdfPreview(
                  initialPageFormat: PdfPageFormat.a4,
                  maxPageWidth: 700,
                  pdfFileName: "CNSS/ID_$id/M_$month",
                  build: (format) => b.generatePDF(),
                  canChangeOrientation: false,
                  canChangePageFormat: false,
                );
              },
            );
          },
        ));
  }
}
