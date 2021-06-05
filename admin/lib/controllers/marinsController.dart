import 'package:admin/models/marinModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MarinsController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<QuerySnapshot<Marin>> getMarins() async {
    return await FirebaseFirestore.instance
        .collection('seamen')
        .withConverter<Marin>(
          fromFirestore: (snapshots, _) => Marin.fromJson(snapshots.data()!),
          toFirestore: (movie, _) => movie.toJson(),
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
