import 'package:admin/models/articleModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ArticlesController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  deleteArticle(id) async {
    if (Firebase.apps.isEmpty) return;
    await FirebaseFirestore.instance.collection('articles').doc(id).delete();
    Get.toNamed("/Articles");
  }

  Future<QuerySnapshot<Article>?> getArticles() async {
    if (Firebase.apps.isEmpty) return null;
    return await FirebaseFirestore.instance
        .collection('articles')
        .withConverter<Article>(
          fromFirestore: (snapshots, _) => Article.fromJson(snapshots.data()!),
          toFirestore: (article, _) => article.toJson(),
        )
        .get();
  }

  Future<DocumentSnapshot<Article>?> getArticle(x) async {
    if (Firebase.apps.isEmpty) return null;
    return await FirebaseFirestore.instance
        .collection('articles')
        .doc(x)
        .withConverter<Article>(
          fromFirestore: (snapshots, _) => Article.fromJson(snapshots.data()!),
          toFirestore: (article, _) => article.toJson(),
        )
        .get();
  }

  getListTile(title, message) {
    Clipboard.setData(ClipboardData(text: title!));
    if (title != null) {
      Clipboard.setData(ClipboardData(text: title!));
      Get.snackbar("", "",
          titleText: Text(
            message!,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ));
    } else {
      Get.snackbar("", "",
          titleText: Text(
            "لم يتم النسخ، الخانة فارخة",
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ));
    }
  }
}
