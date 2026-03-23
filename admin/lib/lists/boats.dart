import 'package:admin/controllers/boats_controller.dart';
import 'package:admin/controllers/null_controller.dart';
import 'package:admin/models/boat_model.dart';
import 'package:admin/resources/icons.dart';
import 'package:admin/widgets/boat_widgets.dart';
import 'package:admin/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class Boats extends GetView<BoatsController> {
  const Boats({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      fab: 'قارب جديد',
      function: () {
        Get.toNamed('/Boats/NewBoat');
      },
      button: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: 'القوارب',
      child: BoatsWidget(
        add: false,
        boats: const [],
        control: NullController(),
      ),
    );
  }
}

class BoatsWidget extends GetView<BoatsController> {
  const BoatsWidget({super.key, required this.add, required this.boats, required this.control});
  final bool add;
  final List<Boat> boats;
  final GetxController control;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 70,
            width: 500,
            child: OutlinedButton(
                onPressed: null,
                child: ListTile(
                  title: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp("[a-zA-Z0-9-/]")),
                    ],
                    decoration: const InputDecoration(
                        label: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "اختر القارب",
                            ))),
                    controller: controller.filterController,
                    onChanged: (value) {
                      controller.getBoatsQuery(value);
                      controller.update();
                    },
                  ),
                )),
          ),
          const SizedBox(
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
                                } else {
                                  Get.snackbar('', '',
                                      titleText: const Text(
                                        "القارب موجود في الائحة",
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.center,
                                      ));
                                }
                              },
                              textCancel: 'الغاء',
                            );
                          }))
                    .toList()
                    .cast<Widget>(),
              );
            },
          ),
          if (controller.boatsAll.isNotEmpty)
            const SizedBox(
              height: 20,
            ),
          SizedBox(
            height: 70,
            width: 500,
            child: OutlinedButton(
                onPressed: null,
                child: ListTile(
                  title: Text(
                    'عدد القوارب',
                    style: Theme.of(context).textTheme.titleLarge,
                    textDirection: TextDirection.rtl,
                  ),
                  leading: Text(
                    controller.boatsAll.length.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          if (controller.boatsAll.isNotEmpty)
            SizedBox(
              width: 500,
              height: 70,
              child: OutlinedButton(
                onPressed: () {
                  controller.items.value = controller.items.value + 10;
                  controller.update();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                          height: 30, width: 30, child: OmniIcons().plus),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    const SizedBox(
                      width: 100,
                      child: Text("نتائج أكثر",
                          textAlign: TextAlign.center, textScaler: TextScaler.linear(1.5)),
                    ),
                  ],
                ),
              ),
            ),
          if (controller.boatsAll.isNotEmpty)
            const SizedBox(
              height: 20,
            ),
          if (controller.boatsAll.isNotEmpty)
            SizedBox(
              width: 500,
              height: 70,
              child: OutlinedButton(
                onPressed: () {
                  if (controller.items.value > 6) {
                    controller.items.value = controller.items.value - 10;
                  }
                  controller.update();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                          height: 30, width: 30, child: OmniIcons().plus),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    const SizedBox(
                      width: 100,
                      child: Text("نتائج أقل",
                          textAlign: TextAlign.center, textScaler: TextScaler.linear(1.5)),
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
