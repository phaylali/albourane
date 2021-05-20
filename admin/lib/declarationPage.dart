import 'package:admin/declarationModel.dart';
import 'package:admin/header.dart';
import 'package:admin/pdfpreview.dart';
import 'package:admin/providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*
class HomeService {
  final CollectionReference boatCollectionRef =
      FirebaseFirestore.instance.collection('boats');

  Future<DocumentSnapshot<Map<String, dynamic>>> getBoat(boat) async {
    var value = await boatCollectionRef.doc(boat).get();
    return value;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getMonth(boat, month) async {
    var value = await boatCollectionRef
        .doc(boat)
        .collection('revenue')
        .doc(month)
        .get();
    return value;
  }
}

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  DeclarationBoatModel get boatModel => _boatModel;
  DeclarationBoatModel _boatModel = DeclarationBoatModel(
      'boatName', 'boatOwner', 'boatReference', 'boatRegion', 1.50);

  DeclarationMonthModel get monthModel => _monthModel;
  DeclarationMonthModel _monthModel = DeclarationMonthModel(
      'monthFinish',
      5,
      1000,
      5,
      'monthStart',
      200,
      200,
      200,
      200,
      200,
      200,
      200,
      200,
      200,
      200,
      200,
      200,
      200,
      200,
      200,
      200,
      200);
  HomeViewModel(boat, month) {
    getInfo(boat, month);
  }

  getInfo(boat, month) async {
    _loading.value = true;
    HomeService().getBoat(boat).then((value) {
      DeclarationBoatModel.fromJson(value);
      update();
    });

    HomeService().getMonth(boat, month).then((value) {
      DeclarationMonthModel.fromJson(value);
      update();
    });
  }
}
*/
class DeclarationPage extends StatelessWidget {
  //final DeclarationBoatModel? boatModel;
  final DeclarationMonthModel? monthModel;
  DeclarationPage({
    this.monthModel,
  });
  @override
  Widget build(BuildContext context) {
    final String id = Get.parameters['id']!;
    final String month = Get.parameters['m']!;
    return MainBody(
        title: "تصريح",
        child: GetBuilder<DecModelController>(
          init: DecModelController(id, month),
          builder: (b) {
            /*
            final actions = <PdfPreviewAction>[
              if (!kIsWeb)
                PdfPreviewAction(
                    icon: const Icon(Icons.save), onPressed: b.saveAsFile),
              PdfPreviewAction(
                  icon: const Icon(Icons.save), onPressed: b.system)
            ];*/

            return PdfPreview(
              initialPageFormat: PdfPageFormat.a4,
              maxPageWidth: 700,
              build: (format) => b.generatePDF(
                  // b.bahara,
                  //  b.startDate.value,
                  //   b.finishDate.value,
                  //   b.region.value,
                  //  b.boat.value,
                  //  b.reference.value,
                  //   b.owner.value,
                  //    b.marins.value,
                  //   b.sales.value,
                  //    b.revenue.value,
                  //   b.cnss.value,
                  //    b.amo.value,
                  //   b.totalCnss.value,
                  //   b.taxeHalle.value,
                  //    b.coopPerc.value,
                  //   b.coop.value,
                  //   b.taxeRegion.value,
                  //   b.totalGlobal.value,
                  //   b.carburant.value,
                  //    b.chargesComm.value,
                  //   b.net.value,
                  //   b.patron.value,
                  //   b.equipage.value
                  ),
              // actions: actions,
              //    onPrinted: b.showPrintedToast,
              //  onShared: b.showSharedToast,
              pdfPreviewPageDecoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor),
            );
          },
        ));
  }
}
