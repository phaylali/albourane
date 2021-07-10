import 'package:admin/controllers/boatsController.dart';
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
                        .take(6)
                        .map((item) => BoatPreview(
                              item,
                            ))
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
