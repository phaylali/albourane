import 'package:admin/models/boatModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoatEditController extends GetxController {
  CollectionReference boatsCol = FirebaseFirestore.instance.collection('boats');

  late TextEditingController phoneController,
      percController,
      nameController,
      referenceController,
      regionController,
      cniController,
      ownerController,
      imgController;

  var filter = '3'.obs;

  @override
  void onInit() async {
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

  setControllers(x) async {
    return await boatsCol
        .doc(x)
        .withConverter<Boat>(
          fromFirestore: (snapshots, _) => Boat.fromJson(snapshots.data()!),
          toFirestore: (boat, _) => boat.toJson(),
        )
        .get()
        .then((value) {
      final boat = value.data();
      if (boat != null) {
        phoneController.value = TextEditingValue(text: boat.boatOwnerPhone);
        percController.value =
            TextEditingValue(text: boat.boatCoopPerc.toString());

        nameController.value = TextEditingValue(text: boat.boatName);
        referenceController.value = TextEditingValue(text: boat.boatReference);
        regionController.value = TextEditingValue(text: boat.boatRegion);
        cniController.value = TextEditingValue(text: boat.boatOwnerCni);
        ownerController.value = TextEditingValue(text: boat.boatOwner);
        imgController.value = TextEditingValue(text: boat.boatImage);
      } else {
        print('fuck');
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    phoneController.dispose();
    nameController.dispose();
    percController.dispose();
    referenceController.dispose();
    regionController.dispose();
    cniController.dispose();
    ownerController.dispose();
    imgController.dispose();
  }

  correctBoat() async {
    final perc = double.parse(percController.text);
    final id = referenceController.text.replaceAll('/', '-');

    return await boatsCol.doc(id).get().then((value) {
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
            titleText: Text(
              "تم تصحيح القارب بنجاح",
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
    });
  }
}
