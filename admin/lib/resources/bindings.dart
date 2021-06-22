import 'package:admin/controllers/boatNewController.dart';
import 'package:admin/controllers/boatsController.dart';
import 'package:admin/controllers/dateController.dart';
import 'package:admin/controllers/declarationInputController.dart';
import 'package:admin/controllers/homeController.dart';
import 'package:admin/controllers/marinNewController.dart';
import 'package:admin/controllers/marinsController.dart';
import 'package:get/get.dart';

// HOME

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}

// DECLARATION

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

class DeclarationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeclarationInputController>(
      () => DeclarationInputController(),
    );
  }
}

// BOATS

class BoatInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BoatInputController>(
      () => BoatInputController(),
    );
  }
}

class BoatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BoatsController>(
      () => BoatsController(),
    );
  }
}

class BoatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BoatsController>(
      () => BoatsController(),
    );
  }
}

// MARINS

class MarinInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarinInputController>(
      () => MarinInputController(),
    );
  }
}

class MarinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarinsController>(
      () => MarinsController(),
    );
  }
}

class MarinsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarinsController>(
      () => MarinsController(),
    );
  }
}
