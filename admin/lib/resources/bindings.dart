import 'package:admin/forms/declarationNew.dart';
import 'package:get/get.dart';

class DeclarationInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeclarationInputController>(
      () => DeclarationInputController(),
    );
  }
}
