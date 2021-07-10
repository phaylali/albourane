/*import 'dart:collection';

import 'package:admin/controllers/articleNewController.dart';
import 'package:admin/resources/icons.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

// ignore: must_be_immutable
class ArticleModify extends GetView<ArticleInputController> {
  final String id = Get.parameters['id']!;
  @override
  Widget build(BuildContext context) {
    controller.getArticle(id);
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
          kIsWeb
              ? Editor(
                  controller: controller,
                )
              : Center(
                  child: SizedBox(
                      height: 70,
                      width: 300,
                      child: OutlinedButton(
                          onPressed: () {
                            Get.dialog(Editor(
                              controller: controller,
                            ));
                          },
                          child: ListTile(
                            title: Text(
                              'اضف المحتوى',
                              textAlign: TextAlign.center,
                            ),
                          ))),
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

class Editor extends StatelessWidget {
  const Editor({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ArticleInputController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.8,
      height: 1000,
      child: OutlinedButton(
        onPressed: null,
        child: ListView(
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
                      SizedBox(height: 20, width: 20, child: OmniIcons().boat),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'تحديث',
                      )
                    ],
                  ),
                  onPressed: () {
                    if (kIsWeb) {
                      controller.contentController.reloadWeb();
                      //controllerz.reloadWeb();
                    } else {
                      controller.contentController.editorController!.reload();
                      //controllerz.editorController?.reload();
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: HtmlEditor(
                htmlToolbarOptions: HtmlToolbarOptions(
                  toolbarType: ToolbarType.nativeExpandable,
                  customToolbarButtons: [
                    Container(
                      height: kMinInteractiveDimension,
                      child: CustomDropdownButtonHideUnderline(
                        child: CustomDropdownButton<String>(
                          menuMaxHeight: MediaQuery.of(context).size.height / 3,
                          menuDirection: DropdownMenuDirection.down,
                          items: [
                            CustomDropdownMenuItem(
                              value: 'Tajawal',
                              child: PointerInterceptor(
                                  child: Text('Tajawal',
                                      style: TextStyle(
                                        fontFamily: 'Tajawal',
                                      ))),
                            ),
                            CustomDropdownMenuItem(
                              value: 'Courier New',
                              child: PointerInterceptor(
                                  child: Text('Courier New',
                                      style: TextStyle(fontFamily: 'Courier'))),
                            ),
                            CustomDropdownMenuItem(
                              value: 'sans-serif',
                              child: PointerInterceptor(
                                  child: Text('Sans Serif',
                                      style:
                                          TextStyle(fontFamily: 'sans-serif'))),
                            ),
                            CustomDropdownMenuItem(
                              value: 'Times New Roman',
                              child: PointerInterceptor(
                                  child: Text('Times New Roman',
                                      style: TextStyle(fontFamily: 'Times'))),
                            ),

                            //add your other fonts here!!
                          ],
                          value: 'Tajawal',
                          onChanged: (String? changed) async {
                            if (changed != null) {
                              controller.contentController
                                  .execCommand('fontName', argument: changed);
                            }
                          },
                        ),
                      ),
                    )
                  ],
                  defaultToolbarButtons: [
                    StyleButtons(),
                    FontSettingButtons(fontName: false),
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
                controller: controller.contentController,
                htmlEditorOptions: HtmlEditorOptions(
                    shouldEnsureVisible: true,
                    filePath: kIsWeb ? null : "assets/summernote.html",
                    autoAdjustHeight: false,
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
                  height: 600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/