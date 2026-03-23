import 'package:admin/controllers/boat_edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoatEdit extends GetView<BoatEditController> {
  final String id = Get.parameters['id']!;

  BoatEdit({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setControllers(id);
    return Wrap(
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
                  decoration: const InputDecoration(
                    labelText: "الاسم",
                  ),
                  keyboardType: TextInputType.name,
                  controller: controller.nameController,
                ),
              )),
        ),
        SizedBox(
          width: 300,
          height: 70,
          child: OutlinedButton(
              onPressed: null,
              child: ListTile(
                title: TextFormField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: "التسجيل",
                  ),
                  keyboardType: TextInputType.number,
                  controller: controller.referenceController,
                ),
              )),
        ),
        SizedBox(
          width: 300,
          height: 70,
          child: OutlinedButton(
              onPressed: null,
              child: ListTile(
                title: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "المنطقة",
                  ),
                  keyboardType: TextInputType.name,
                  controller: controller.regionController,
                ),
              )),
        ),
        SizedBox(
          width: 300,
          height: 70,
          child: OutlinedButton(
              onPressed: null,
              child: ListTile(
                title: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "نسبة الاقتطاع",
                  ),
                  keyboardType: TextInputType.number,
                  controller: controller.percController,
                ),
              )),
        ),
        SizedBox(
          width: 300,
          height: 70,
          child: OutlinedButton(
              onPressed: null,
              child: ListTile(
                title: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "الصورة",
                  ),
                  keyboardType: TextInputType.url,
                  controller: controller.imgController,
                ),
              )),
        ),
        SizedBox(
          width: 300,
          height: 70,
          child: OutlinedButton(
              onPressed: null,
              child: ListTile(
                title: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "اسم المالك",
                  ),
                  keyboardType: TextInputType.name,
                  controller: controller.ownerController,
                ),
              )),
        ),
        SizedBox(
          width: 300,
          height: 70,
          child: OutlinedButton(
              onPressed: null,
              child: ListTile(
                title: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "رقم البطاقة",
                  ),
                  //keyboardType: TextInputType.name,
                  controller: controller.cniController,
                ),
              )),
        ),
        SizedBox(
          width: 300,
          height: 70,
          child: OutlinedButton(
              onPressed: null,
              child: ListTile(
                title: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "الهاتف",
                  ),
                  keyboardType: TextInputType.phone,
                  controller: controller.phoneController,
                ),
              )),
        ),
        Center(
          child: SizedBox(
              height: 70,
              width: 300,
              child: OutlinedButton(
                  onPressed: () {
                    controller.correctBoat();
                  },
                  child: const ListTile(
                    title: Text(
                      'صحح القارب',
                      textAlign: TextAlign.center,
                    ),
                  ))),
        ),
      ],
    );
  }
}
