import 'package:admin/controllers/articleNewController.dart';
import 'package:code_editor/code_editor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleInput extends GetView<ArticleInputController> {
  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController(text: 'hello!');
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 20,
      runSpacing: 20,
      children: [
        SizedBox(
          width: 300,
          height: 70,
          child: OutlinedButton(
              onPressed: null,
              child: ListTile(
                title: TextFormField(
                    decoration: InputDecoration(
                      labelText: "العنوان",
                    ),
                    keyboardType: TextInputType.name,
                    controller: controller.titleController),
              )),
        ),
        SizedBox(
          width: 300,
          height: 70,
          child: OutlinedButton(
              onPressed: null,
              child: ListTile(
                title: TextFormField(
                  decoration: InputDecoration(
                    labelText: "الصورة",
                  ),
                  keyboardType: TextInputType.url,
                  controller: controller.thumbController,
                ),
              )),
        ),
        OutlinedButton(
            onPressed: null,
            child: ListTile(
              title: TextFormField(
                decoration: InputDecoration(
                  labelText: "content",
                ),
                keyboardType: TextInputType.text,
                controller: controller.contentController,
              ),
            )),
        OutlinedButton(
          onPressed: null,
          child: CodeEditor(
            model: EditorModel(files: [
              FileEditor(
                name: "page1.html",
                language: "html",
                code: //[

                    "<!DOCTYPE html><html amp><head><meta charset='utf-8'><meta name='viewport' content='width=device-width,minimum-scale=1,initial-scale=1'><meta name='description' content='This is the Google AMP Boilerplate.'><link rel='preload' as='script' href='https://cdn.ampproject.org/v0.js'><script async src='https://cdn.ampproject.org/v0.js'></script><style amp-custom></style><style amp-boilerplate>body{-webkit-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-moz-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-ms-animation:-amp-start 8s steps(1,end) 0s 1 normal both;animation:-amp-start 8s steps(1,end) 0s 1 normal both}@-webkit-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-moz-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-ms-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-o-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}</style><noscript><style amp-boilerplate>body{-webkit-animation:none;-moz-animation:none;-ms-animation:none;animation:none}</style></noscript><link rel='canonical' href='...'><title>My Google AMP Page</title></head><body><h1>Hello World</h1></body></html>",

                //].join("\n"),
              ),
            ]),
            edit: true,
            disableNavigationbar: false,
            onSubmit: (String? language, String? value) {
              print("language = $language");
              print("value = '$value'");
            },
            textEditingController: myController,
          ),
        ),
        Center(
          child: SizedBox(
              height: 70,
              width: 300,
              child: OutlinedButton(
                  onPressed: () {
                    controller.addNewArticle();
                  },
                  child: ListTile(
                    title: Text(
                      'اضف المقال',
                      textAlign: TextAlign.center,
                    ),
                  ))),
        ),
      ],
    );
  }
}
