import 'dart:collection';

import 'package:admin/controllers/articleNewController.dart';
import 'package:admin/resources/icons.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class ArticleInput extends GetView<ArticleInputController> {
  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: 'مقال جديد',
      child: Wrap(
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
          SizedBox(
            width: context.width * 0.8,
            height: 1000,
            child: OutlinedButton(
              onPressed: null,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      OutlinedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 20, width: 20, child: OmniIcons().boat),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'تحديث',
                            )
                          ],
                        ),
                        onPressed: () {
                          controller.contentController.reloadWeb();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  HtmlEditor(
                    htmlToolbarOptions: HtmlToolbarOptions(
                      toolbarType: ToolbarType.nativeGrid,
                      defaultToolbarButtons: [
                        StyleButtons(),
                        FontSettingButtons(),
                        FontButtons(),
                        ColorButtons(),
                        ParagraphButtons(),
                        ListButtons(),
                        InsertButtons(
                          video: true,
                          audio: true,
                          table: true,
                        ),
                        OtherButtons()
                      ],
                    ),

                    controller: controller.contentController, //required
                    htmlEditorOptions: HtmlEditorOptions(
                        hint: "اكتب شيئا هنا",
                        webInitialScripts: UnmodifiableListView([
                          WebScript(
                              name: "editorBG",
                              script:
                                  "document.getElementsByClassName('note-editable')[0].style.backgroundColor='blue';"),
                        ])
                        //initalText: "text content initial, if any",
                        ),
                    otherOptions: OtherOptions(
                      height: 400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: SizedBox(
                height: 70,
                width: 300,
                child: OutlinedButton(
                    onPressed: () {
                      controller.addArticle()();
                    },
                    child: ListTile(
                      title: Text(
                        'اضف المقال',
                        textAlign: TextAlign.center,
                      ),
                    ))),
          ),
        ],
      ),
    );
  }
}
