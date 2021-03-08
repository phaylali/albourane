// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';

class PasswordController extends GetxController {
  static PasswordController get to => Get.find();
  RxBool hidden = true.obs;

  void change() {
    hidden.toggle();
    update();
  }
}
