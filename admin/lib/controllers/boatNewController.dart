import 'package:admin/models/boatModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  @override
  void onInit() {
    super.onInit();
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
  void onReady() {
    super.onReady();
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

  checkBoat(id) async {}

  addBoat() async {
    final perc = double.parse(percController.text);
    final id = referenceController.text.replaceAll('/', '-');

    return await FirebaseFirestore.instance
        .collection('boat')
        .doc(id)
        .get()
        .then((value) {
      if (value.exists) {
        Get.snackbar("", "",
            titleText: Text(
              "هذا القارب موجود",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
            messageText: Text(
              "لا يمكن اضافته مرة ثانية",
              textScaleFactor: 0.7,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ));
      } else {
        return FirebaseFirestore.instance
            .collection('boats')
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
                boatImage: imgController.text))
            .then((value) {
          Get.snackbar("", "",
              titleText: Text(
                "تم تسجيل القارب بنجاح",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
              messageText: Text(
                ' ',
                textScaleFactor: 0.7,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ));
        });
      }
    });
  }
}
