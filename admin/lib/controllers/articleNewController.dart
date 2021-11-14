import 'dart:io';
import 'dart:typed_data';

import 'package:admin/models/articleModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:code_editor/code_editor.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:html_editor_enhanced/html_editor.dart';
//import 'package:intl/intl.dart' as intl;
import 'package:translator/translator.dart';

class ArticleInputController extends GetxController {
  late TextEditingController titleController,
      thumbController,
      contentController;
  //late HtmlEditorController contentController;
  CollectionReference articlesCol =
      FirebaseFirestore.instance.collection('articles');

  final translator = GoogleTranslator();

  getArticle(x) async {
    return await FirebaseFirestore.instance
        .collection('articles')
        .doc(x)
        .withConverter<Article>(
          fromFirestore: (snapshots, _) => Article.fromJson(snapshots.data()!),
          toFirestore: (article, _) => article.toJson(),
        )
        .get();
  }

  @override
  void onInit() {
    super.onInit();

    contentController = TextEditingController();
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
    contentController.dispose();
  }

  void onClear() {
    contentController.clear();
    thumbController.clear();
    titleController.clear();
  }

  addPageNext() {
    /*List<String> contentOfPage1 = [
      "<!DOCTYPE html>",
      "<html lang='fr'>",
      "\t<body>",
      "\t\t<a href='page2.html'>go to page 2</a>",
      "\t</body>",
      "</html>",
    ];*/
    /*List<FileEditor> files = [
      new FileEditor(
        name: "page1.html",
        language: "html",
        code: contentOfPage1.join("\n"), // [code] needs a string
      ),
      new FileEditor(
        name: "page2.html",
        language: "html",
        code: "<a href='page1.html'>go back</a>",
      ),
      new FileEditor(
        name: "style.css",
        language: "css",
        code: "a { color: red; }",
      ),
    ];*/
  }

  // The model used by the CodeEditor widget, you need it in order to control it.
  // But, since 1.0.0, the model is not required inside the CodeEditor Widget.
  /*EditorModel model = new EditorModel(
    files: files, // the files created above
    // you can customize the editor as you want
    styleOptions: new EditorModelStyleOptions(
      fontSize: 13,
    ),
  );*/

  addNewArticle() async {
    if (!kIsWeb) {
      if (Platform.isIOS || Platform.isAndroid) {
        bool status = await Permission.storage.isGranted;

        if (!status) await Permission.storage.request();
      }
    }

    String code = [
      '<!DOCTYPE html>',
      '<html amp>',
      '<head>',
      '<meta charset="utf-8">',
      '<script async src="https://cdn.ampproject.org/v0.js"></script>',
      '<title>Hello, AMPs</title>',
      '<link rel="canonical" href="https://amp.dev/documentation/guides-and-tutorials/start/create/basic_markup/">',
      '<meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1">',
      '<style amp-boilerplate>body{-webkit-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-moz-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-ms-animation:-amp-start 8s steps(1,end) 0s 1 normal both;animation:-amp-start 8s steps(1,end) 0s 1 normal both}@-webkit-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-moz-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-ms-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-o-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}</style><noscript><style amp-boilerplate>body{-webkit-animation:none;-moz-animation:none;-ms-animation:none;animation:none}</style></noscript>',
      '</head>',
      '<body><h1 id="hello">Hello AMPHTML World!</h1></body>',
      '</html>',
    ].join("\n");
    // "<!DOCTYPE html><html amp><head><meta charset='utf-8'><meta name='viewport' content='width=device-width,minimum-scale=1,initial-scale=1'><meta name='description' content='This is the Google AMP Boilerplate.'><link rel='preload' as='script' href='https://cdn.ampproject.org/v0.js'><script async src='https://cdn.ampproject.org/v0.js'></script><style amp-custom></style><style amp-boilerplate>body{-webkit-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-moz-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-ms-animation:-amp-start 8s steps(1,end) 0s 1 normal both;animation:-amp-start 8s steps(1,end) 0s 1 normal both}@-webkit-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-moz-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-ms-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-o-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}</style><noscript><style amp-boilerplate>body{-webkit-animation:none;-moz-animation:none;-ms-animation:none;animation:none}</style></noscript><link rel='canonical' href='...'><title>My Google AMP Page</title></head><body><h1>Hello World</h1></body></html>";

    Uint8List data = Uint8List.fromList(code.codeUnits);

    String path = await FileSaver.instance.saveFile(
        titleController.text == ""
            ? "File1.html"
            : titleController.text + ".html",
        data,
        "html",
        mimeType: MimeType.TEXT);
    print(contentController.text);
    print(path);
  }

  addArticle() async {
    final title =
        await translator.translate(titleController.text, from: 'ar', to: 'en');

    //final dateNow = intl.DateFormat.yMd().add_jm().format(DateTime.now());

    /*DateFormat('dd/MM/yyyy : ').format(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));*/
    return await articlesCol
        .doc(title.toString().replaceAll(' ', '-').replaceAll(':', '-'))
        .get()
        .then((value) {
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
        Get.toNamed(
            "/Article?id=${title.toString().replaceAll(' ', '-').replaceAll(':', '-')}");
      } else {
        /*return contentController.getText().then((value) {
          articlesCol
              .withConverter<Article>(
                fromFirestore: (snapshots, _) =>
                    Article.fromJson(snapshots.data()!),
                toFirestore: (article, _) => article.toJson(),
              )
              .doc(title.toString().replaceAll(' ', '-').replaceAll(':', '-'))
              .set(Article(
                  content: value,
                  date: dateNow,
                  thumbnail: thumbController.text,
                  title: titleController.text,
                  url: title
                      .toString()
                      .replaceAll(' ', '-')
                      .replaceAll(':', '-')))
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
            onClear();
          });
        });*/
      }
    });
  }
}
