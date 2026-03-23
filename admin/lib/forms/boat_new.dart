import 'package:admin/controllers/boat_new_controller.dart';
import 'package:admin/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoatInput extends GetView<BoatInputController> {
  const BoatInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      fab: 'تسجيل',
      function: () {
        controller.addBoat();
      },
      title: 'قارب جديد',
      button: Icon(
        Icons.save,
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: [
                SizedBox(
                  width: 500,
                  height: 70,
                  child: OutlinedButton(
                      onPressed: null,
                      child: ListTile(
                        title: TextFormField(
                          decoration: const InputDecoration(
                              label: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "الاسم",
                                  ))),
                          keyboardType: TextInputType.name,
                          controller: controller.nameController,
                        ),
                      )),
                ),
                SizedBox(
                  width: 500,
                  height: 70,
                  child: OutlinedButton(
                      onPressed: null,
                      child: ListTile(
                        title: TextFormField(
                          decoration: const InputDecoration(
                              label: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "التسجيل",
                                  ))),
                          keyboardType: TextInputType.phone,
                          controller: controller.referenceController,
                        ),
                      )),
                ),
                SizedBox(
                  width: 500,
                  height: 70,
                  child: OutlinedButton(
                      onPressed: null,
                      child: ListTile(
                        title: TextFormField(
                          decoration: const InputDecoration(
                              label: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "المنطقة",
                                  ))),
                          keyboardType: TextInputType.name,
                          controller: controller.regionController,
                        ),
                      )),
                ),
                SizedBox(
                  width: 500,
                  height: 70,
                  child: OutlinedButton(
                      onPressed: null,
                      child: ListTile(
                        title: TextFormField(
                          decoration: const InputDecoration(
                              label: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "نسبة الاقتطاع",
                                  ))),
                          keyboardType: TextInputType.number,
                          controller: controller.percController,
                        ),
                      )),
                ),
                SizedBox(
                  width: 500,
                  height: 70,
                  child: OutlinedButton(
                      onPressed: null,
                      child: ListTile(
                        title: TextFormField(
                          decoration: const InputDecoration(
                              label: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "اسم المالك",
                                  ))),
                          keyboardType: TextInputType.name,
                          controller: controller.ownerController,
                        ),
                      )),
                ),
                SizedBox(
                  width: 500,
                  height: 70,
                  child: OutlinedButton(
                      onPressed: null,
                      child: ListTile(
                        title: TextFormField(
                          decoration: const InputDecoration(
                              label: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "رقم البطاقة",
                                  ))),
                          //keyboardType: TextInputType.name,
                          controller: controller.cniController,
                        ),
                      )),
                ),
                SizedBox(
                  width: 500,
                  height: 70,
                  child: OutlinedButton(
                      onPressed: null,
                      child: ListTile(
                        title: TextFormField(
                          decoration: const InputDecoration(
                              label: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "الهاتف",
                                  ))),
                          keyboardType: TextInputType.phone,
                          controller: controller.phoneController,
                        ),
                      )),
                ),
                SizedBox(
                  width: 500,
                  height: 70,
                  child: OutlinedButton(
                      onPressed: null,
                      child: ListTile(
                        title: TextFormField(
                          decoration: const InputDecoration(
                              label: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "الصورة",
                                  ))),
                          keyboardType: TextInputType.url,
                          controller: controller.imgController,
                        ),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
