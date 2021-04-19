import 'package:admin/header.dart';
import 'package:admin/pdfpreview.dart';
import 'package:admin/providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class DeclarationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainBody(
        title: "تصريح",
        child: GetBuilder<PdfController>(
          init: PdfController(),
          builder: (b) {
            final actions = <PdfPreviewAction>[
              if (!kIsWeb)
                PdfPreviewAction(
                    icon: const Icon(Icons.save), onPressed: b.saveAsFile),
              PdfPreviewAction(
                  icon: const Icon(Icons.save), onPressed: b.system)
            ];
            return PdfPreview(
              initialPageFormat: PdfPageFormat.a4,
              maxPageWidth: 700,
              build: (format) => generatePDF(),
              actions: actions,
              onPrinted: b.showPrintedToast,
              onShared: b.showSharedToast,
              pdfPreviewPageDecoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor),
            );
          },
        ));
  }
}
