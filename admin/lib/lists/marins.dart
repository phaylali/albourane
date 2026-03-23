import 'package:admin/controllers/marins_controller.dart';
import 'package:admin/controllers/null_controller.dart';
import 'package:admin/models/marin_model.dart';
import 'package:admin/resources/icons.dart';
import 'package:admin/widgets/skeleton.dart';
import 'package:admin/widgets/marin_widgets.dart';
import 'package:admin/widgets/other_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Marins extends GetView<MarinsController> {
  const Marins({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      title: 'البحارة',
      fab: 'بحار جديد',
      function: () {
        Get.toNamed('/Seamen/NewSeaman');
      },
      button: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.primary,
      ),
      child: MarinsWidgets(
        add: false,
        marins: const [],
        control: NullController(),
      ),
    );
  }
}

class MarinsWidgets extends GetView<MarinsController> {
  const MarinsWidgets({super.key, 
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
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9-/]")),
                  ],
                  decoration: const InputDecoration(
                      label: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "اختر البحار",
                    ),
                  )),
                  controller: controller.filterController,
                  onChanged: (value) {
                    controller.getMarinsQuery(value);
                    controller.update();
                  },
                ),
              )),
        ),
        const SizedBox(
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
                          Get.dialog(MarinDialog(
                              controller: controller,
                              item: item,
                              marins: marins,
                              control: control));
                        }))
                  .toList()
                  .cast<Widget>(),
            );
          },
        ),
        if (controller.marinsAll.isNotEmpty)
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
                  'عدد البحارة',
                  style: Theme.of(context).textTheme.titleLarge,
                  textDirection: TextDirection.rtl,
                ),
                leading: Text(
                  controller.marinsAll.length.toString(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        if (controller.marinsAll.isNotEmpty)
          SizedBox(
            width: 70,
            height: 500,
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
        if (controller.marinsAll.isNotEmpty)
          const SizedBox(
            height: 20,
          ),
        if (controller.marinsAll.isNotEmpty)
          SizedBox(
            width: 70,
            height: 500,
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
    );
  }
}
