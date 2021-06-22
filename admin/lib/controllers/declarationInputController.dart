import 'package:admin/models/boatModel.dart';
import 'package:admin/models/marinModel.dart';
import 'package:admin/models/marinMonthModel.dart';
import 'package:admin/models/monthModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeclarationInputController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController revenueController,
      salesController,
      carbController,
      filterController;

  RxDouble revenue = 0.0.obs;
  RxInt sales = 0.obs;
  RxDouble carb = 0.0.obs;
  var filter = '6'.obs;
  List<Marin> marinzo = [];
  List<Marin> marinQuery = [];
  List<Marin> marinFinal = [];
  var baharaz = [].obs;

  CollectionReference boatsCol = FirebaseFirestore.instance.collection('boats');
  CollectionReference seamenCol =
      FirebaseFirestore.instance.collection('seamen');

  @override
  void onInit() {
    super.onInit();
    revenueController = TextEditingController();
    salesController = TextEditingController();
    carbController = TextEditingController();
    filterController = TextEditingController();
    getMarins();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    revenueController.dispose();
    salesController.dispose();
    carbController.dispose();
    filterController.dispose();
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
      by.forEach((element) {
        marinzo.add(element.data());
      });
    });
  }

  Future<DocumentSnapshot<Month>> getOldMarins(boat) async {
    final hy = await boatsCol.doc(boat).collection('revenue').get();

    return boatsCol
        .doc(boat)
        .collection('revenue')
        .doc(hy.docs.last.id)
        .withConverter<Month>(
          fromFirestore: (snapshots, _) => Month.fromJson(snapshots.data()!),
          toFirestore: (month, _) => month.toJson(),
        )
        .get();
  }

  addDeclaration(boat, doc, start, finish, coopPerc) async {
    marinFinal.forEach((element) {
      baharaz.add(element.marinReference.replaceAll('/', '-'));
    });
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
            monthTotalGlobal: totalglobal))
        .then((value) {
      marinFinal.forEach((element) async {
        final mar = element.marinReference.replaceAll('/', '-');
        seamenCol
            .doc(mar)
            .collection('revenue')
            .withConverter<MarinMonth>(
              fromFirestore: (snapshots, _) =>
                  MarinMonth.fromJson(snapshots.data()!),
              toFirestore: (month, _) => month.toJson(),
            )
            .doc(doc)
            .set(MarinMonth(boatReference: boat, marinPie: pie));
      });
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
