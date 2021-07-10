import 'package:admin/controllers/marinsController.dart';

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
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                  onPressed: null,
                  child: ListTile(
                    title: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-Z0-9-/]")),
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
                        .map((item) => MarinPreview(item, () {
                              Get.toNamed(
                                "/Seaman?id=${item.url}",
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
          ),
        ));
  }
}
