import 'package:admin/controllers/declarationController.dart';

import 'package:admin/widgets/mainBody.dart';
import 'package:admin/resources/icons.dart';
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
        child: GetBuilder<DeclarationController>(
          init: DeclarationController(id, month),
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

                return Column(
                  children: [
                    Expanded(
                      child: PdfPreview(
                        initialPageFormat: PdfPageFormat.a4,
                        maxPageWidth: 700,
                        pdfFileName: "CNSS|$id|$month",
                        build: (format) => b.doc.save(),
                        canChangeOrientation: false,
                        canChangePageFormat: false,
                        allowPrinting: false,
                        allowSharing: false,
                        useActions: false,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        SizedBox(
                            width: 300,
                            height: 40,
                            child: OutlinedButton(
                                onPressed: () {
                                  b.shareDeclaration();
                                },
                                child: Row(
                                  children: [
                                    Spacer(),
                                    OmniIcons().share,
                                    Spacer(),
                                    Text('انشر التقرير'),
                                    Spacer(),
                                  ],
                                ))),
                        Spacer(),
                        SizedBox(
                            width: 300,
                            height: 40,
                            child: OutlinedButton(
                                onPressed: () {
                                  b.printDeclaration();
                                },
                                child: Row(
                                  children: [
                                    Spacer(),
                                    OmniIcons().print,
                                    Spacer(),
                                    Text('اطبع التقرير'),
                                    Spacer(),
                                  ],
                                ))),
                        Spacer(),
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
