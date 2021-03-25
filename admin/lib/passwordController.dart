import 'package:get/get.dart';

class PasswordController extends GetxController {
  static PasswordController get to => Get.find();
  RxBool hidden = true.obs;

  void change() {
    hidden.toggle();
    update();
  }
}
