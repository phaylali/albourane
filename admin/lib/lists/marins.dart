import 'package:admin/controllers/marinsController.dart';
import 'package:admin/controllers/nullController.dart';
import 'package:admin/models/marinModel.dart';
import 'package:admin/resources/icons.dart';
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:
                      SizedBox(height: 30, width: 30, child: OmniIcons().plus),
                ),
                SizedBox(
                  width: 60,
                ),
                SizedBox(
                  width: 100,
                  child: Text("نتائج أكثر",
                      textAlign: TextAlign.center, textScaleFactor: 1.5),
                ),
              ],
            ),
          ),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:
                      SizedBox(height: 30, width: 30, child: OmniIcons().plus),
                ),
                SizedBox(
                  width: 60,
                ),
                SizedBox(
                  width: 100,
                  child: Text("نتائج أقل",
                      textAlign: TextAlign.center, textScaleFactor: 1.5),
                ),
              ],
            ),
          ),
        if (controller.marinsAll.isNotEmpty)
          SizedBox(
            height: 20,
          ),
        OutlinedButton(
          onPressed: () {
            Get.toNamed('/NewSeaman');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(height: 30, width: 30, child: OmniIcons().plus),
              ),
              SizedBox(
                width: 60,
              ),
              SizedBox(
                width: 100,
                child: Text("بحار جديد",
                    textAlign: TextAlign.center, textScaleFactor: 1.5),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
