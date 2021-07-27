import 'package:admin/models/marinModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MarinsController extends GetxController {
  List<Marin> marinsAll = [];
  List<Marin> marinQuery = [];
  CollectionReference seamenCol =
      FirebaseFirestore.instance.collection('seamen');
  late TextEditingController filterController;
  var items = 6.obs;

  @override
  void onInit() async {
    super.onInit();
    filterController = TextEditingController();

    getAllMarins();
  }

  @override
  void onClose() {
    super.onClose();
    filterController.dispose();
  }

  getMarinsQuery(filtero) async {
    marinQuery = marinsAll.where((element) {
      return element.marinReference.contains(filtero) ||
          element.marinFirstName.contains(filtero) ||
          element.marinLastName.contains(filtero);
    }).toList();

    notifyChildrens();
  }

  getAllMarins() async {
    return await seamenCol
        .withConverter<Marin>(
          fromFirestore: (snapshots, _) => Marin.fromJson(snapshots.data()!),
          toFirestore: (marin, _) => marin.toJson(),
        )
        .get()
        .then((value) {
      value.docs.forEach((element) {
        marinsAll.add(element.data());
      });
    });
  }

  deleteMarin(id) async {
    await seamenCol.doc(id).delete();
    Get.toNamed("/Seamen");
  }

  Future<QuerySnapshot<Marin>> getMarins() async {
    return await FirebaseFirestore.instance
        .collection('seamen')
        .withConverter<Marin>(
          fromFirestore: (snapshots, _) => Marin.fromJson(snapshots.data()!),
          toFirestore: (marin, _) => marin.toJson(),
        )
        .get();
  }

  Future<QuerySnapshot> getMarinRevenue(x) async {
    return await FirebaseFirestore.instance
        .collection('seamen')
        .doc(x)
        .collection('revenue')
        .get();
  }

  Future<DocumentSnapshot<Marin>> getMarin(x) async {
    return await FirebaseFirestore.instance
        .collection('seamen')
        .doc(x)
        .withConverter<Marin>(
          fromFirestore: (snapshots, _) => Marin.fromJson(snapshots.data()!),
          toFirestore: (marin, _) => marin.toJson(),
        )
        .get();
  }

  getListTile(title, message) {
    Clipboard.setData(ClipboardData(text: title!));
    if (title != null) {
      Clipboard.setData(ClipboardData(text: title!));
      Get.snackbar("", "",
          titleText: Text(
            message!,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ));
    } else {
      Get.snackbar("", "",
          titleText: Text(
            "لم يتم النسخ، الخانة فارخة",
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ));
    }
  }
}
