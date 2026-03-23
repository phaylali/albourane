import 'package:admin/controllers/marin_new_controller.dart';
import 'package:admin/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarinInput extends GetView<MarinInputController> {
  const MarinInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      title: 'بحار جديد',
      fab: 'تسجيل',
      function: () {
        controller.addMarin();
      },
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
                                      "الاسم العائلي",
                                    ))),
                            keyboardType: TextInputType.text,
                            controller: controller.lastNameController),
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
                                      "الاسم الشخصي",
                                    ))),
                            keyboardType: TextInputType.name,
                            controller: controller.firstNameController),
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
                          keyboardType: TextInputType.url,
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
                                    "الضمان الاجتماعي",
                                  ))),

                          //keyboardType: TextInputType.name,
                          controller: controller.cnssController,
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
