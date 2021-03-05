import 'dart:async';

// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';

import 'product.dart';

class ProductsController extends GetxController {
  final necklace = true.obs;
  final braclet = true.obs;
  final ring = true.obs;
  final earrings = true.obs;
  final List<String> filters = ["necklace", "braclet", "ring", "earrings"].obs;
  Rx<List<ProductModel>> productsList = Rx<List<ProductModel>>();
  List<ProductModel> get products => productsList.value;
  final FirebaseFirestore firestoro = FirebaseFirestore.instance;

  onInit() {
    productsList.bindStream(productsStream(filters));
    productsList.refresh();
    super.onInit();
  }

  start() {
    productsList.bindStream(productsStream(filters));
  }

  upgrade(String type) {
    if (filters.contains(type)) {
      filters.remove(type);
    } else {
      filters.add(type);
    }
    refresh();
  }

  Stream<List<ProductModel>> productsStream(List<String> filterso) {
    return firestoro
        .collection('products')
        .where('type', whereIn: filterso)
        .snapshots(includeMetadataChanges: false)
        .map((QuerySnapshot query) {
      List<ProductModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(ProductModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }
}

class CountController extends GetxController {
  static CountController get to => Get.find();
  int counter = 0;
  void increment() {
    counter++;
    update(); // use update() to update counter variable on UI when increment be called
  }

  void decrement() {
    counter > 0 ? counter-- : print('No U');
    update(); // use update() to update counter variable on UI when increment be called
  }
}
