import 'package:admin/models/marinModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarinEditController extends GetxController {
  CollectionReference seamenCol =
      FirebaseFirestore.instance.collection('seamen');

  late TextEditingController phoneController,
      nameFirstController,
      nameLastController,
      referenceController,
      cniController,
      cnssController,
      imgController;

  var filter = '3'.obs;

  @override
  void onInit() async {
    super.onInit();
    phoneController = TextEditingController();

    nameFirstController = TextEditingController();
    nameLastController = TextEditingController();
    referenceController = TextEditingController();
    cniController = TextEditingController();
    cnssController = TextEditingController();
    imgController = TextEditingController();
  }

  setControllers(x) async {
    return await seamenCol
        .doc(x)
        .withConverter<Marin>(
          fromFirestore: (snapshots, _) => Marin.fromJson(snapshots.data()!),
          toFirestore: (marin, _) => marin.toJson(),
        )
        .get()
        .then((value) {
      final marin = value.data();
      if (marin != null) {
        phoneController.value = TextEditingValue(text: marin.phone);
        nameLastController.value = TextEditingValue(text: marin.marinLastName);
        nameFirstController.value =
            TextEditingValue(text: marin.marinFirstName);
        referenceController.value =
            TextEditingValue(text: marin.marinReference);

        cniController.value = TextEditingValue(text: marin.marinCin);
        cnssController.value = TextEditingValue(text: marin.marinCnss);
        imgController.value = TextEditingValue(text: marin.marinImage);
      } else {
        print('fuck');
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    phoneController.dispose();
    nameFirstController.dispose();
    nameLastController.dispose();
    referenceController.dispose();
    cniController.dispose();
    cnssController.dispose();
    imgController.dispose();
  }

  correctMarin() async {
    final id = referenceController.text.replaceAll('/', '-');

    return await seamenCol.doc(id).get().then((value) {
      return seamenCol
          .withConverter<Marin>(
            fromFirestore: (snapshots, _) => Marin.fromJson(snapshots.data()!),
            toFirestore: (marin, _) => marin.toJson(),
          )
          .doc(id)
          .set(Marin(
              marinFirstName: nameFirstController.text,
              marinReference: referenceController.text,
              marinCnss: cnssController.text,
              marinCin: cniController.text,
              phone: phoneController.text,
              marinImage: imgController.text,
              url: id,
              marinLastName: nameLastController.text))
          .then((value) {
        Get.snackbar("", "",
            titleText: Text(
              "تم تصحيح البحار بنجاح",
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
