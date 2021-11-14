import 'package:admin/controllers/boatsController.dart';
import 'package:admin/controllers/marinsController.dart';
import 'package:admin/lists/boats.dart';
import 'package:admin/lists/marins.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:monet_colors/monet_colors.dart';

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
  MonetColors? colors;
  RxInt pageselected = 0.obs;
  final pages = [
    //FirstPage(),
    Boats(),
    Marins(),
  ];
  setupRoute() {
    switch (Get.currentRoute) {
      case '/':
        pageselected.value = 0;
        break;
      case '/Boats':
        pageselected.value = 1;
        break;
      case '/Boats/NewBoat':
        pageselected.value = 1;
        break;
      case '/Seamen':
        pageselected.value = 2;
        break;
      case '/Seamen/NewSeaman':
        pageselected.value = 2;
        break;
      case '/Settings':
        pageselected.value = 3;
        break;
      default:
        pageselected.value = 0;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getColors();
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
  getColors() async {
    colors = (await Monet.get())!;
  }

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

    Future.delayed(Duration(seconds: 2), () {
      Get.toNamed('/');
    });
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }
}
