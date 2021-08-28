import 'package:admin/controllers/boatsController.dart';
//import 'package:admin/controllers/declarationController.dart';
import 'package:admin/controllers/marinsController.dart';
import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoggedIn = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String usersCollection = "users";
  var marins = "".obs;
  var boats = "".obs;
  var user = FirebaseAuth.instance.currentUser.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
  }

/*
  check() {
    user.value != null ? Get.toNamed('/') : Get.toNamed('/Login');

    notifyChildrens();
  }

  void getInfo() async {
    final marinz = await FirebaseFirestore.instance.collection('seamen').get();
    final boatz = await FirebaseFirestore.instance.collection('boats').get();
    marins.value = marinz.docs.length.toString();
    print(marins + marins.value);
    boats.value = boatz.docs.length.toString();
    print(boats + boats.value);
    notifyChildrens();
  }
*/
  void signIn() async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        _clearControllers();
        Get.put(MarinsController()).onInit();
        Get.put(BoatsController()).onInit();
        Get.put(HomeController()).onInit();
        notifyChildrens();
        Get.toNamed('/');
      });
    } catch (e) {
      Get.snackbar("خطأ", e.toString());
      print(email.text.trim() + password.text.trim());
    }
  }

  void signOut() async {
    await auth.signOut();

    Get.put(MarinsController()).marinsAll.clear();
    Get.put(MarinsController()).marinQuery.clear();
    Get.put(BoatsController()).boatsAll.clear();
    Get.put(BoatsController()).boatQuery.clear();

    Get.put(BoatsController()).update();
    Get.put(MarinsController()).update();
    Get.put(HomeController()).update();
    notifyChildrens();
    Get.toNamed('/Login');
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }
}

showLoading() {
  Get.defaultDialog(
      title: "Loading...",
      content: CircularProgressIndicator(),
      barrierDismissible: true);
}
