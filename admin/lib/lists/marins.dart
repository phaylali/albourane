import 'package:admin/controllers/marinsController.dart';
import 'package:admin/controllers/nullController.dart';
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
          child: MarinsWidgets(
            add: false,
            marins: [],
            control: NullController(),
          ),
        ));
  }
}

class MarinsWidgets extends GetView<MarinsController> {
  /// If the add boolean is false, make sure to use NullController().
  /// If the add boolean is true, you have to use a functional GetxController.
  MarinsWidgets({
    required this.control,
    required this.add,
    required this.marins,
  });

  final bool add;
  final List<Marin> marins;
  final GetxController control;
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
                  .take(controller.items.value)
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
                                Get.put(control).update();
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
        if (controller.marinsAll.isNotEmpty)
          OutlinedButton(
              onPressed: () {
                controller.items.value = controller.items.value + 10;
                controller.update();
              },
              child: ListTile(
                  title: Text(
                'مزيد من النتائج',
                textAlign: TextAlign.center,
              ))),
        if (controller.marinsAll.isNotEmpty)
          SizedBox(
            height: 20,
          ),
        if (controller.marinsAll.isNotEmpty)
          OutlinedButton(
              onPressed: () {
                if (controller.items.value > 6)
                  controller.items.value = controller.items.value - 10;
                controller.update();
              },
              child: ListTile(
                  title: Text(
                'نتائج أقل',
                textAlign: TextAlign.center,
              ))),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
