import 'package:admin/controllers/boatNewController.dart';
import 'package:admin/controllers/dateController.dart';
import 'package:admin/controllers/declarationInputController.dart';
import 'package:admin/controllers/marinsController.dart';
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

class BoatInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BoatInputController>(
      () => BoatInputController(),
    );
  }
}
