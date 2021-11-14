import 'package:admin/controllers/marinNewController.dart';
import 'package:admin/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarinInput extends GetView<MarinInputController> {
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
            SizedBox(
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
                            decoration: InputDecoration(
                                label: Align(
                                    child: Text(
                                      "الاسم العائلي",
                                    ),
                                    alignment: Alignment.centerRight)),
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
                            decoration: InputDecoration(
                                label: Align(
                                    child: Text(
                                      "الاسم الشخصي",
                                    ),
                                    alignment: Alignment.centerRight)),
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
                          decoration: InputDecoration(
                              label: Align(
                                  child: Text(
                                    "التسجيل",
                                  ),
                                  alignment: Alignment.centerRight)),
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
                          decoration: InputDecoration(
                              label: Align(
                                  child: Text(
                                    "الضمان الاجتماعي",
                                  ),
                                  alignment: Alignment.centerRight)),

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
                          decoration: InputDecoration(
                              label: Align(
                                  child: Text(
                                    "رقم البطاقة",
                                  ),
                                  alignment: Alignment.centerRight)),
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
                          decoration: InputDecoration(
                              label: Align(
                                  child: Text(
                                    "الهاتف",
                                  ),
                                  alignment: Alignment.centerRight)),
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
                          decoration: InputDecoration(
                              label: Align(
                                  child: Text(
                                    "الصورة",
                                  ),
                                  alignment: Alignment.centerRight)),
                          keyboardType: TextInputType.url,
                          controller: controller.imgController,
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
