import 'package:admin/controllers/declarationInputController.dart';
import 'package:admin/controllers/marinsController.dart';

import 'package:admin/models/marinModel.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:admin/widgets/marinWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Marins extends GetView<MarinsController> {
  const Marins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainBody(
        title: "البحارة",
        child: SingleChildScrollView(
          child: NewWidget(
            add: false,
            marins: [],
          ),
        ));
  }
}

class NewWidget extends GetView<MarinsController> {
  NewWidget({required this.add, required this.marins});

  final bool add;
  final List<Marin> marins;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        OutlinedButton(
            onPressed: null,
            child: ListTile(
              title: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9-/]")),
                ],
                decoration: InputDecoration(
                  labelText: "اختر البحارة",
                ),
                controller: controller.filterController,
                onChanged: (value) {
                  controller.getMarinsQuery(value);
                  controller.update();
                },
              ),
            )),
        SizedBox(
          height: 20,
        ),
        GetBuilder<MarinsController>(
          builder: (controller) {
            return Wrap(
              alignment: WrapAlignment.spaceEvenly,
              direction: Axis.horizontal,
              runSpacing: 20,
              spacing: 20,
              children: controller.marinQuery
                  .take(6)
                  .map((item) => add == false
                      ? MarinPreview(item, () {
                          Get.toNamed(
                            "/Seaman?id=${item.url}",
                          );
                        })
                      : MarinPreview(item, () {
                          Get.defaultDialog(
                            title: 'هل أنت متؤكد من إضافة هذا البحار؟',
                            textConfirm: 'تأكيد',
                            middleText:
                                '${item.marinLastName} ${item.marinFirstName} : ${item.marinReference}',
                            onConfirm: () {
                              if (!marins.contains(item)) {
                                marins.add(item);

                                controller.update();
                                Get.put(DeclarationInputController()).update();
                              } else
                                Get.snackbar('', '',
                                    titleText: Text(
                                      "البحار موجود في الائحة",
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.center,
                                    ));
                            },
                            textCancel: 'الغاء',
                            /*onCancel: () {
              Get.back();
            }*/
                          );
                        }))
                  .toList()
                  .cast<Widget>(),
            );
          },
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
