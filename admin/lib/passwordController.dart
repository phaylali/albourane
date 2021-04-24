import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  RxBool hidden = true.obs;
  Rx<FocusNode> passwordNode = FocusNode().obs;
  Rx<FocusNode> passwordToggleNode = FocusNode().obs;
  Rx<FocusNode> emailNode = FocusNode().obs;

  KeyboardActionsConfig config(BuildContext context) {
    return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        nextFocus: true,
        keyboardBarColor: Colors.grey[200],
        actions: [
          KeyboardActionsItem(
            focusNode: emailNode.value,
            displayArrows: true,
            displayActionBar: false,
          ),
          KeyboardActionsItem(
            focusNode: passwordToggleNode.value,
            displayArrows: true,
            displayActionBar: false,
          ),
          KeyboardActionsItem(
            focusNode: passwordNode.value,
            displayArrows: true,
            displayActionBar: false,
          ),
        ]);
  }

  void change() {
    hidden.toggle();
    update();
  }
}
