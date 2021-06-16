import 'package:admin/controllers/boatNewController.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BoatInput extends GetView<BoatInputController> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState>? drawerKey = GlobalKey();

    return Scaffold(
      key: drawerKey,
      floatingActionButton: Fab(drawerKey: drawerKey),
      endDrawer: Drawer(
        child: CustomDrawer(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Wrap(
                      //alignment: WrapAlignment.spaceEvenly,
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
                                  decoration: InputDecoration(
                                    labelText: "name",
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
                                  decoration: InputDecoration(
                                    labelText: "reference",
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
                                  decoration: InputDecoration(
                                    labelText: "region",
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
                                  decoration: InputDecoration(
                                    labelText: "percentage",
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
                                  decoration: InputDecoration(
                                    labelText: "image",
                                  ),
                                  keyboardType: TextInputType.name,
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
                                  decoration: InputDecoration(
                                    labelText: "owner",
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
                                  decoration: InputDecoration(
                                    labelText: "cni",
                                  ),
                                  keyboardType: TextInputType.name,
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
                                  decoration: InputDecoration(
                                    labelText: "phone",
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
                                    controller.addBoat();
                                  },
                                  child: ListTile(
                                    title: Text(
                                      'اضف القارب',
                                      textAlign: TextAlign.center,
                                    ),
                                  ))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
