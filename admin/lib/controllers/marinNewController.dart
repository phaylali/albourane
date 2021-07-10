import 'package:admin/models/marinModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarinInputController extends GetxController {
  late TextEditingController phoneController,
      lastNameController,
      firstNameController,
      referenceController,
      cnssController,
      cniController,
      imgController;
  CollectionReference seamenCol =
      FirebaseFirestore.instance.collection('seamen');

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    lastNameController = TextEditingController();
    firstNameController = TextEditingController();
    referenceController = TextEditingController();
    cnssController = TextEditingController();
    cniController = TextEditingController();
    imgController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    phoneController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    referenceController.dispose();
    cnssController.dispose();
    cniController.dispose();
    imgController.dispose();
  }

  void onClear() {
    phoneController.clear();
    firstNameController.clear();
    lastNameController.clear();
    referenceController.clear();
    cnssController.clear();
    cniController.clear();
    imgController.clear();
  }

  addMarin() async {
    final id = referenceController.text.replaceAll('/', '-');

    return await seamenCol.doc(id).get().then((value) {
      if (value.exists) {
        Get.snackbar("", "",
            titleText: Text(
              "هذا البحار موجود",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
            messageText: Text(
              "لا يمكن اضافته مرة ثانية",
              textScaleFactor: 0.7,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ));
        Get.toNamed('/MarinEdit?id=$id');
      } else {
        return seamenCol
            .withConverter<Marin>(
              fromFirestore: (snapshots, _) =>
                  Marin.fromJson(snapshots.data()!),
              toFirestore: (marin, _) => marin.toJson(),
            )
            .doc(id)
            .set(Marin(
              marinCin: cniController.text,
              marinCnss: cnssController.text,
              marinFirstName: firstNameController.text,
              marinLastName: lastNameController.text,
              marinImage: imgController.text,
              marinReference: referenceController.text,
              url: id,
              phone: phoneController.text,
            ))
            .then((value) {
          Get.snackbar(
            "",
            "",
            titleText: Text(
              "تم تسجيل البحار بنجاح",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
            messageText: Text(
              ' ',
              textScaleFactor: 0.7,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
          );
          onClear();
        });
      }
    });
  }
}
