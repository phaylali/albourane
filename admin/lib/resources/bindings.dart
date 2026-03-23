import 'package:admin/controllers/article_new_controller.dart';
import 'package:admin/controllers/articles_controller.dart';
import 'package:admin/controllers/boat_edit_controller.dart';
import 'package:admin/controllers/boat_new_controller.dart';
import 'package:admin/controllers/boats_controller.dart';
import 'package:admin/controllers/date_controller.dart';
import 'package:admin/controllers/declaration_controller.dart';
import 'package:admin/controllers/declaration_edit_controller.dart';
import 'package:admin/controllers/declaration_input_controller.dart';
import 'package:admin/controllers/home_controller.dart';
import 'package:admin/controllers/marin_edit_controller.dart';
import 'package:admin/controllers/marin_new_controller.dart';
import 'package:admin/controllers/marins_controller.dart';
import 'package:get/get.dart';

// HOME

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<MarinsController>(
      () => MarinsController(),
    );
    Get.lazyPut<BoatsController>(
      () => BoatsController(),
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
    Get.lazyPut<DeclarationController>(
      () => DeclarationController(),
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

// ARTICLES

class ArticleInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticleInputController>(
      () => ArticleInputController(),
    );
  }
}

class ArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticlesController>(
      () => ArticlesController(),
    );
  }
}

class ArticlesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticlesController>(
      () => ArticlesController(),
    );
  }
}

class BoatEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BoatEditController>(
      () => BoatEditController(),
    );
  }
}

class MarinEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarinEditController>(
      () => MarinEditController(),
    );
  }
}

class DeclarationEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeclarationEditController>(
      () => DeclarationEditController(),
    );
  }
}
