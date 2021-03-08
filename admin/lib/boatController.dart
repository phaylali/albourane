import 'dart:async';

import 'package:admin/boatmodel.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';

class BoatsController extends GetxController {
  final floka = true.obs;
  final chbak = true.obs;
  final List<String> filters = [
    "floka",
    "chbak",
  ].obs;
  Rx<List<BoatModel>> boatsList = Rx<List<BoatModel>>();
  List<BoatModel> get boats => boatsList.value;
  final FirebaseFirestore firestoro = FirebaseFirestore.instance;

  onInit() {
    boatsList.bindStream(boatsStream(filters));
    boatsList.refresh();
    super.onInit();
  }

  start() {
    boatsList.bindStream(boatsStream(filters));
  }

  upgrade(String type) {
    if (filters.contains(type)) {
      filters.remove(type);
    } else {
      filters.add(type);
    }
    refresh();
  }

  Stream<List<BoatModel>> boatsStream(List<String> filterso) {
    return firestoro
        .collection('boats')
        .where('type', whereIn: filterso)
        .snapshots(includeMetadataChanges: false)
        .map((QuerySnapshot query) {
      List<BoatModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(BoatModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }
}
