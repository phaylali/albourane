import 'package:admin/controllers/dateController.dart';
import 'package:admin/controllers/marinsController.dart';
import 'package:admin/forms/declarationNew.dart';
import 'package:get/get.dart';

class DeclarationInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeclarationInputController>(
      () => DeclarationInputController(),
    );
    Get.lazyPut<DateController>(
      () => DateController(),
    );
    Get.lazyPut<MarinsController>(
      () => MarinsController(),
    );
  }
}
