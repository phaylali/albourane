import 'package:admin/controllers/homeController.dart';
import 'package:admin/resources/icons.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class HomePage extends GetView<HomeController> {
  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    HtmlEditorController controller = HtmlEditorController();
    //ZefyrController controller = ZefyrController();
    return MainBody(
      title: 'لوحة التحكم',
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 20,
        runSpacing: 20,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: OutlinedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50, width: 50, child: OmniIcons().boat),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'القوارب',
                    textScaleFactor: 2,
                  )
                ],
              ),
              onPressed: () {
                Get.toNamed('/Boats');
              },
            ),
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: OutlinedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50, width: 50, child: OmniIcons().seaman),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'البحارة',
                    textScaleFactor: 2,
                  )
                ],
              ),
              onPressed: () {
                Get.toNamed('/Seamen');
              },
            ),
          ),
          SizedBox(
            width: 1000,
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
                              'reload',
                            )
                          ],
                        ),
                        onPressed: () {
                          controller.reloadWeb();
                        },
                      ),
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
                              'getText',
                            )
                          ],
                        ),
                        onPressed: () {
                          controller.getText().then((value) => print(value));
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

                    controller: controller, //required
                    htmlEditorOptions: HtmlEditorOptions(
                      hint: "اكتب شيئا هنا",
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
        ],
      ),
    );
  }
}
