import 'package:admin/controllers/boatNewController.dart';
import 'package:admin/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoatInput extends GetView<BoatInputController> {
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
                                    "الاسم",
                                  ),
                                  alignment: Alignment.centerRight)),
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
                          decoration: InputDecoration(
                              label: Align(
                                  child: Text(
                                    "التسجيل",
                                  ),
                                  alignment: Alignment.centerRight)),
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
                          decoration: InputDecoration(
                              label: Align(
                                  child: Text(
                                    "المنطقة",
                                  ),
                                  alignment: Alignment.centerRight)),
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
                          decoration: InputDecoration(
                              label: Align(
                                  child: Text(
                                    "نسبة الاقتطاع",
                                  ),
                                  alignment: Alignment.centerRight)),
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
                          decoration: InputDecoration(
                              label: Align(
                                  child: Text(
                                    "اسم المالك",
                                  ),
                                  alignment: Alignment.centerRight)),
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
                          decoration: InputDecoration(
                              label: Align(
                                  child: Text(
                                    "رقم البطاقة",
                                  ),
                                  alignment: Alignment.centerRight)),
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
