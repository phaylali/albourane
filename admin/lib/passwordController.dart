import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  RxBool hidden = true.obs;
  Rx<FocusNode> passwordNode = FocusNode().obs;
  Rx<FocusNode> passwordToggleNode = FocusNode().obs;
  Rx<FocusNode> emailNode = FocusNode().obs;

  void change() {
    hidden.toggle();
    update();
  }
}
