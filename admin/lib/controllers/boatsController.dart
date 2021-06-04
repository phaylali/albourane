import 'package:admin/models/boatModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BoatsController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<QuerySnapshot<Boat>> getBoats() async {
    final boatsRef =
        FirebaseFirestore.instance.collection('boats').withConverter<Boat>(
              fromFirestore: (snapshots, _) => Boat.fromJson(snapshots.data()!),
              toFirestore: (boat, _) => boat.toJson(),
            );

    return boatsRef.get();
  }

  Future<DocumentSnapshot<Boat>> getBoat(x) async {
    final boatRef = FirebaseFirestore.instance
        .collection('boats')
        .doc(x)
        .withConverter<Boat>(
          fromFirestore: (snapshots, _) => Boat.fromJson(snapshots.data()!),
          toFirestore: (boat, _) => boat.toJson(),
        );

    return boatRef.get();
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
