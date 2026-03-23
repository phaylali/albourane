import 'package:admin/models/marin_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/models/boat_model.dart';
import 'package:admin/models/marin_month_model.dart';
import 'package:admin/models/month_model.dart';

class DeclarationEditController extends GetxController {
  late TextEditingController revenueController,
      salesController,
      carbController,
      filterController;
  var start = ''.obs;
  var finish = ''.obs;
  RxDouble revenue = 0.0.obs;
  RxInt sales = 0.obs;
  RxDouble carb = 0.0.obs;
  var filter = '6'.obs;
  List<Marin> marinzo = [];
  List<Marin> marinQuery = [];
  List<Marin> marinFinal = [];
  List<Marin> marinOld = [];
  var baharaz = [].obs;

  late CollectionReference boatsCol;
  late CollectionReference seamenCol;

  @override
  void onInit() {
    super.onInit();
    if (Firebase.apps.isNotEmpty) {
      boatsCol = FirebaseFirestore.instance.collection('boats');
      seamenCol = FirebaseFirestore.instance.collection('seamen');
    }
    revenueController = TextEditingController();
    salesController = TextEditingController();
    carbController = TextEditingController();
    filterController = TextEditingController();
    getMarins();
  }


  @override
  void onClose() {
    revenueController.dispose();
    salesController.dispose();
    carbController.dispose();
    filterController.dispose();
  }

  void onClear() {
    revenueController.clear();
    salesController.clear();
    carbController.clear();
    filterController.clear();
    marinFinal.clear();
    baharaz.clear();
  }

  setControllers(boat, month) async {
    return await boatsCol
        .doc(boat)
        .collection('revenue')
        .doc(month)
        .withConverter<Month>(
          fromFirestore: (snapshots, _) => Month.fromJson(snapshots.data()!),
          toFirestore: (month, _) => month.toJson(),
        )
        .get()
        .then((value) {
      final month = value.data();
      if (month != null) {
        revenueController.value =
            TextEditingValue(text: month.monthRevenue.toString());
        salesController.value =
            TextEditingValue(text: month.monthSales.toString());
        carbController.value =
            TextEditingValue(text: month.monthCarb.toString());

        start.value = month.monthStart;
        finish.value = month.monthFinish;
      } else {
        debugPrint('Document not found in setControllers');
      }
    });
  }

  getMarins() async {
    return await seamenCol
        .withConverter<Marin>(
          fromFirestore: (snapshots, _) => Marin.fromJson(snapshots.data()!),
          toFirestore: (marin, _) => marin.toJson(),
        )
        .get()
        .then((value) {
      final by = value.docs;
      for (var element in by) {
        marinzo.add(element.data());
      }
    });
  }

  Future<DocumentSnapshot<Month>> getOldMarins(boat, month) async {
    return boatsCol
        .doc(boat)
        .collection('revenue')
        .doc(month)
        .withConverter<Month>(
          fromFirestore: (snapshots, _) => Month.fromJson(snapshots.data()!),
          toFirestore: (month, _) => month.toJson(),
        )
        .get();
  }

  addDeclaration(boat, doc, start, finish, coopPerc) async {
    for (var element in marinFinal) {
      baharaz.add(element.url);
    }
    final rev = double.parse(revenueController.text);
    final salezo = int.parse(salesController.text);
    final carbo = double.parse(carbController.text);
    final cnss = rev * 6 / 100;
    final amo = rev * 1.7 / 100;
    final totalcnss = cnss + amo;
    final taxehalle = rev * 4 / 100;
    final coop = rev * coopPerc / 100;
    final taxeregion = rev * 0.16 / 100;
    final totalglobal = cnss + amo + taxehalle + taxeregion + coop;
    final charges = carbo + taxeregion + coop + taxehalle;
    final net = rev - totalcnss - charges;
    final patron = net * 40 / 100;
    final equipage = net * 60 / 100;
    final pie = equipage / marinFinal.length;

    return await boatsCol
        .doc(boat)
        .collection('revenue')
        .withConverter<Month>(
          fromFirestore: (snapshots, _) => Month.fromJson(snapshots.data()!),
          toFirestore: (month, _) => month.toJson(),
        )
        .doc(doc)
        .get()
        .then((value) {
      boatsCol
          .doc(boat)
          .collection('revenue')
          .withConverter<Month>(
            fromFirestore: (snapshots, _) => Month.fromJson(snapshots.data()!),
            toFirestore: (month, _) => month.toJson(),
          )
          .doc(doc)
          .set(Month(
              bahara: baharaz,
              monthFinish: finish,
              monthEquipageNumber: marinFinal.length,
              monthRevenue: rev,
              monthSales: salezo,
              monthStart: start,
              monthAmo: amo,
              monthAutres: 0.00,
              monthCarb: carbo,
              monthChargesCommun: charges,
              monthCnss: cnss,
              monthCoop: coop,
              monthEquipage: equipage,
              monthEquipagePerc: 60,
              monthNet: net,
              monthPatron: patron,
              monthPatronPerc: 40,
              monthPeage: 0.00,
              monthPie: pie,
              monthTaxeHalle: taxehalle,
              monthTaxeRegion: taxeregion,
              monthTotalCnss: totalcnss,
              monthTotalGlobal: totalglobal,
              url: doc));
    }).then((value) {
    }).then((value) {
      for (var element in marinFinal) {
        seamenCol
            .doc(element.url)
            .collection('revenue')
            .withConverter<MarinMonth>(
              fromFirestore: (snapshots, _) =>
                  MarinMonth.fromJson(snapshots.data()!),
              toFirestore: (month, _) => month.toJson(),
            )
            .doc(doc)
            .set(MarinMonth(boatReference: boat, marinPie: pie));
      }
    }).then((value) {
      Get.snackbar("", "",
          titleText: const Text(
            "تم تصحيح التقرير بنجاح",
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ),
          messageText: const Text(
            ' ',
            textScaler: TextScaler.linear(0.7),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ));
      onClear();
    });
  }

  addSearchList(filtero) async {
    marinQuery = marinzo.where((element) {
      return element.marinReference.contains(filtero);
    }).toList();
    notifyChildrens();
  }

  Future<DocumentSnapshot<Boat>> getBoat(x) async {
    return await boatsCol
        .doc(x)
        .withConverter<Boat>(
          fromFirestore: (snapshots, _) => Boat.fromJson(snapshots.data()!),
          toFirestore: (boat, _) => boat.toJson(),
        )
        .get();
  }
}
