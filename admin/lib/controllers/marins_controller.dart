import 'package:admin/models/marin_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MarinsController extends GetxController {
  List<Marin> marinsAll = [];
  List<Marin> marinQuery = [];
  CollectionReference? seamenCol;
  late TextEditingController filterController;
  var items = 6.obs;

  @override
  void onInit() async {
    super.onInit();
    if (Firebase.apps.isNotEmpty) {
      seamenCol = FirebaseFirestore.instance.collection('seamen');
      getAllMarins();
    }
    filterController = TextEditingController();
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
    if (seamenCol == null) return;
    return await seamenCol!
        .withConverter<Marin>(
          fromFirestore: (snapshots, _) => Marin.fromJson(snapshots.data()!),
          toFirestore: (marin, _) => marin.toJson(),
        )
        .get()
        .then((value) {
      for (var element in value.docs) {
        marinsAll.add(element.data());
      }
    });
  }

  deleteMarin(id) async {
    await seamenCol?.doc(id).delete();
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
          titleText: const Text(
            "لم يتم النسخ، الخانة فارخة",
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ));
    }
  }
}
