import 'package:admin/declarationModel.dart';
import 'package:admin/header.dart';
import 'package:admin/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:keyboard_actions/external/platform_check/platform_check.dart';
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
                return Column(
                  children: [
                    Expanded(
                      child: PdfPreview(
                        initialPageFormat: PdfPageFormat.a4,
                        maxPageWidth: 700,
                        pdfFileName: "CNSS-ID_$id-M_$month",
                        //pdfPreviewPageDecoration: Decoration(),
                        build: (format) => b.doc.save(),
                        //b.doco.save(),
                        //b.generatePDF(),
                        canChangeOrientation: false,
                        canChangePageFormat: false,
                        allowPrinting: false,
                        allowSharing: false,
                        useActions: false,
                        //onShared: b.onShared(),
                        //onPrinted: b.onShared(),
                        //onError: b.onError(),
                      ),
                    ),
                    Wrap(
                      children: [
                        SizedBox(
                            width: 300,
                            height: 40,
                            child: ListTile(
                                leading: OmniIcons().back,
                                title: Text('Share Declaration'),
                                onTap: () {
                                  b.shareDeclaration();
                                })),
                        SizedBox(
                            width: 300,
                            height: 40,
                            child: ListTile(
                                leading: OmniIcons().back,
                                title: Text('Print Declaration'),
                                onTap: () {
                                  b.printDeclaration();
                                })),
                      ],
                    )
                  ],
                );
              },
            );
          },
        ));
  }
}
