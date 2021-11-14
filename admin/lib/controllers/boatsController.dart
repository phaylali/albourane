import 'package:admin/models/boatModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BoatsController extends GetxController {
  List<Boat> boatsAll = [];
  List<Boat> boatQuery = [];
  CollectionReference boatsCol = FirebaseFirestore.instance.collection('boats');
  late TextEditingController filterController;
  var items = 6.obs;

  @override
  void onInit() async {
    super.onInit();
    filterController = TextEditingController();
    getAllBoats();
  }

  @override
  void onClose() {
    super.onClose();
    filterController.dispose();
  }

  getBoatsQuery(filtero) async {
    boatQuery = boatsAll.where((element) {
      return element.boatReference.contains(filtero) ||
          element.boatName.contains(filtero);
    }).toList();
    notifyChildrens();
  }

  getAllBoats() async {
    return await boatsCol
        .withConverter<Boat>(
          fromFirestore: (snapshots, _) => Boat.fromJson(snapshots.data()!),
          toFirestore: (boat, _) => boat.toJson(),
        )
        .get()
        .then((value) {
      value.docs.forEach((element) {
        boatsAll.add(element.data());
      });
    });
  }
/*
  Future<QuerySnapshot<Boat>> getBoats() async {
    return await FirebaseFirestore.instance
        .collection('boats')
        .withConverter<Boat>(
          fromFirestore: (snapshots, _) => Boat.fromJson(snapshots.data()!),
          toFirestore: (movie, _) => movie.toJson(),
        )
        .get();
  }*/

  deleteBoat(id) async {
    await FirebaseFirestore.instance.collection('boats').doc(id).delete();
    Get.toNamed("/Boats");
  }

  deleteDeclaration(id, month) async {
    await FirebaseFirestore.instance
        .collection('boats')
        .doc(id)
        .collection('revenue')
        .doc(month)
        .delete();
    Get.toNamed("/Boat?id=$id");
  }

  Future<QuerySnapshot> getBoatRevenue(x) async {
    return await FirebaseFirestore.instance
        .collection('boats')
        .doc(x)
        .collection('revenue')
        .get();
  }

  Future<DocumentSnapshot<Boat>> getBoat(x) async {
    return await FirebaseFirestore.instance
        .collection('boats')
        .doc(x)
        .withConverter<Boat>(
          fromFirestore: (snapshots, _) => Boat.fromJson(snapshots.data()!),
          toFirestore: (boat, _) => boat.toJson(),
        )
        .get();
  }

  getListTile(title, message) {
    Clipboard.setData(ClipboardData(text: title!));
    if (title != null) {
      Clipboard.setData(ClipboardData(text: title!));
      Get.snackbar("", "",
          titleText: Text(message!,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              textScaleFactor: 2));
    } else {
      Get.snackbar("", "",
          titleText: Text("لم يتم النسخ، الخانة فارخة",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              textScaleFactor: 2));
    }
  }
}
