import 'package:admin/models/boat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoatInputController extends GetxController {
  late TextEditingController phoneController,
      percController,
      nameController,
      referenceController,
      regionController,
      cniController,
      ownerController,
      imgController;
  late CollectionReference boatsCol;

  @override
  void onInit() {
    super.onInit();
    if (Firebase.apps.isNotEmpty) {
      boatsCol = FirebaseFirestore.instance.collection('boats');
    }
    phoneController = TextEditingController();
    percController = TextEditingController();
    nameController = TextEditingController();
    referenceController = TextEditingController();
    regionController = TextEditingController();
    cniController = TextEditingController();
    ownerController = TextEditingController();
    imgController = TextEditingController();
  }


  @override
  void onClose() {
    phoneController.dispose();
    nameController.dispose();
    percController.dispose();
    referenceController.dispose();
    regionController.dispose();
    cniController.dispose();
    ownerController.dispose();
    imgController.dispose();
  }

  void onClear() {
    nameController.clear();
    referenceController.clear();
    ownerController.clear();
    cniController.clear();
    phoneController.clear();
    percController.clear();
    imgController.clear();
  }

  addBoat() async {
    final perc = double.parse(percController.text);
    final id = referenceController.text.replaceAll('/', '-');

    if (Firebase.apps.isEmpty) return;
    return await boatsCol.doc(id).get().then((value) {
      if (value.exists) {
        Get.snackbar("", "",
            titleText: const Text(
              "هذا القارب موجود",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
            messageText: const Text(
              "لا يمكن اضافته مرة ثانية",
              textScaler: TextScaler.linear(0.7),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ));
        Get.toNamed('/BoatEdit?id=$id');
      } else {
        return boatsCol
            .withConverter<Boat>(
              fromFirestore: (snapshots, _) => Boat.fromJson(snapshots.data()!),
              toFirestore: (boat, _) => boat.toJson(),
            )
            .doc(id)
            .set(Boat(
                boatName: nameController.text,
                boatReference: referenceController.text,
                boatOwner: ownerController.text,
                boatOwnerCni: cniController.text,
                boatOwnerPhone: phoneController.text,
                boatRegion: regionController.text,
                boatCoopPerc: perc,
                boatImage: imgController.text,
                url: id))
            .then((value) {
          Get.snackbar("", "",
              titleText: const Text(
                "تم تسجيل القارب بنجاح",
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
    });
  }
}
