import 'package:admin/models/articleModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:intl/intl.dart' as intl;
import 'package:translator/translator.dart';

class ArticleInputController extends GetxController {
  late TextEditingController titleController, thumbController;
  late HtmlEditorController contentController;
  CollectionReference articlesCol =
      FirebaseFirestore.instance.collection('articles');

  final translator = GoogleTranslator();

  @override
  void onInit() {
    super.onInit();

    contentController = HtmlEditorController();
    titleController = TextEditingController();
    thumbController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    thumbController.dispose();
    titleController.dispose();

    contentController.clear();
  }

  addArticle() async {
    final title = translator
        .translate(titleController.text, from: 'ar', to: 'en')
        .toString()
        .replaceAll(' ', '-')
        .replaceAll(':', '-');
    final dateNow = intl.DateFormat.yMd().add_jm().format(DateTime.now());

    /*DateFormat('dd/MM/yyyy : ').format(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));*/
    return await articlesCol.doc(title).get().then((value) {
      if (value.exists) {
        Get.snackbar("", "",
            titleText: Text(
              "هذا المقال موجود",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
            messageText: Text(
              "لا يمكن اضافته مرة ثانية",
              textScaleFactor: 0.7,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ));
      } else {
        return contentController.getText().then((value) {
          articlesCol
              .withConverter<Article>(
                fromFirestore: (snapshots, _) =>
                    Article.fromJson(snapshots.data()!),
                toFirestore: (article, _) => article.toJson(),
              )
              .doc(title)
              .set(Article(
                  content: value,
                  date: dateNow,
                  thumbnail: thumbController.text,
                  title: titleController.text,
                  url: title))
              .then((valuez) {
            Get.snackbar("", "",
                titleText: Text(
                  "تم تسجيل المقال بنجاح",
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
                messageText: Text(
                  ' ',
                  textScaleFactor: 0.7,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ));
          });
        });
      }
    });
  }
}
