import 'package:admin/controllers/declarationController.dart';

import 'package:admin/widgets/mainBody.dart';
import 'package:admin/resources/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class DeclarationPage extends GetView<DeclarationController> {
  @override
  Widget build(BuildContext context) {
    final String id = Get.parameters['id']!;
    final String month = Get.parameters['m']!;

    return MainBody(
        title: "تصريح",
        child: FutureBuilder(
          future: controller.getData(id, month),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return Wrap(
              alignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: [
                SizedBox(
                  width: context.width * 0.8,
                  height: context.height * 0.7,
                  child: PdfPreview(
                    initialPageFormat: PdfPageFormat.a4,
                    maxPageWidth: 700,
                    pdfFileName: "CNSS|$id|$month",
                    build: (format) => controller.doc.save(),
                    canChangeOrientation: false,
                    canChangePageFormat: false,
                    allowPrinting: false,
                    allowSharing: false,
                    useActions: false,
                    shouldRepaint: true,
                  ),
                ),
                SizedBox(
                    width: 300,
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          controller.shareDeclaration(id, month);
                        },
                        child: ListTile(
                          leading: OmniIcons().share,
                          title: Text(
                            'انشر التقرير',
                            textAlign: TextAlign.center,
                          ),
                        ))),
                SizedBox(
                    width: 300,
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          controller.printDeclaration(id, month);
                        },
                        child: ListTile(
                          leading: OmniIcons().print,
                          title: Text(
                            'اطبع التقرير',
                            textAlign: TextAlign.center,
                          ),
                        ))),
              ],
            );
          },
        ));
  }
}
