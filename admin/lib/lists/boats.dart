import 'package:admin/controllers/boatsController.dart';
import 'package:admin/controllers/nullController.dart';
import 'package:admin/models/boatModel.dart';
import 'package:admin/resources/icons.dart';
import 'package:admin/widgets/boatWidgets.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class Boats extends GetView<BoatsController> {
  const Boats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainBody(
        title: "القوارب",
        child: SingleChildScrollView(
          child: BoatsWidget(
            add: false,
            boats: [],
            control: NullController(),
          ),
        ));
  }
}

class BoatsWidget extends GetView<BoatsController> {
  BoatsWidget({required this.add, required this.boats, required this.control});
  final bool add;
  final List<Boat> boats;
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
                  labelText: "اختر القارب",
                ),
                controller: controller.filterController,
                onChanged: (value) {
                  controller.getBoatsQuery(value);
                  controller.update();
                },
              ),
            )),
        SizedBox(
          height: 20,
        ),
        GetBuilder<BoatsController>(
          builder: (controller) {
            return Wrap(
              alignment: WrapAlignment.spaceEvenly,
              direction: Axis.horizontal,
              runSpacing: 20,
              spacing: 20,
              children: controller.boatQuery
                  .take(controller.items.value)
                  .map((item) => add == false
                      ? BoatPreview(item, () {
                          final String id =
                              item.boatReference.replaceAll('/', '-');
                          Get.toNamed(
                            "/Boat?id=$id",
                          );
                        })
                      : BoatPreview(item, () {
                          Get.defaultDialog(
                            title: 'هل أنت متؤكد من إضافة هذا القارب؟',
                            textConfirm: 'تأكيد',
                            middleText:
                                '${item.boatName} : ${item.boatReference}',
                            onConfirm: () {
                              if (!boats.contains(item)) {
                                boats.add(item);

                                controller.update();
                                Get.put(control).update();
                              } else
                                Get.snackbar('', '',
                                    titleText: Text(
                                      "القارب موجود في الائحة",
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
        if (controller.boatsAll.isNotEmpty)
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
        if (controller.boatsAll.isNotEmpty)
          SizedBox(
            height: 20,
          ),
        if (controller.boatsAll.isNotEmpty)
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
        if (controller.boatsAll.isNotEmpty)
          SizedBox(
            height: 20,
          ),
        OutlinedButton(
          onPressed: () {
            Get.toNamed('/NewBoat');
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
                child: Text("قارب جديد",
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
