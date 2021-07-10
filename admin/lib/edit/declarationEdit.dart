import 'package:admin/controllers/declarationEditController.dart';
import 'package:admin/models/boatModel.dart';
import 'package:admin/models/monthModel.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:admin/widgets/marinWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DeclarationEdit extends GetView<DeclarationEditController> {
  final String id = Get.parameters['id']!;
  final String month = Get.parameters['m']!;
  @override
  Widget build(BuildContext context) {
    controller.setControllers(id, month);
    return MainBody(
        title: 'تصحيح التصريح',
        child: FutureBuilder<DocumentSnapshot<Boat>>(
            future: controller.getBoat(id),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }

              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final b = snapshot.data!.data()!;
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
                          trailing: Text('اسم القارب'),
                          title: Text(b.boatName),
                        )),
                  ),
                  SizedBox(
                    width: 300,
                    height: 70,
                    child: OutlinedButton(
                        onPressed: null,
                        child: ListTile(
                          trailing: Text('لوحة القارب'),
                          title: Text(b.boatReference),
                        )),
                  ),
                  SizedBox(
                    width: 300,
                    height: 70,
                    child: OutlinedButton(
                        onPressed: null,
                        child: ListTile(
                          title: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9 .]")),
                            ],
                            decoration: InputDecoration(
                              labelText: "المدخول الشهري",
                            ),
                            keyboardType: TextInputType.number,
                            controller: controller.revenueController,
                            onSaved: (value) {
                              controller.revenue = value! as RxDouble;
                            },
                            /*validator: (value) {
                                    return controller.validateEmail(value!);
                                  },*/
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
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              labelText: "عدد المبيعات",
                            ),
                            keyboardType: TextInputType.number,
                            controller: controller.salesController,
                            onSaved: (value) {
                              controller.sales = value! as RxInt;
                            },
                            /*
                                  validator: (value) {
                                    return controller.validateEmail(value!);
                                  },*/
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 300,
                    height: 70,
                    child: OutlinedButton(
                        onPressed: null,
                        child: ListTile(
                          trailing: Text(''),
                          title: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9 .]")),
                            ],
                            decoration: InputDecoration(
                              /*border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),*/
                              labelText: "المحروقات",
                            ),
                            keyboardType: TextInputType.number,
                            controller: controller.carbController,
                            onSaved: (value) {
                              controller.carb = value! as RxDouble;
                            },
                            /*
                                  validator: (value) {
                                    return controller.validateEmail(value!);
                                  },*/
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 300,
                    height: 70,
                    child: OutlinedButton(
                        onPressed: null,
                        child: ListTile(
                            trailing: Text(
                              "تاريخ البداية",
                              textScaleFactor: 0.9,
                            ),
                            title: Text(controller.start.value))),
                  ),
                  SizedBox(
                    width: 300,
                    height: 70,
                    child: OutlinedButton(
                        onPressed: null,
                        child: ListTile(
                            trailing: Text(
                              "تاريخ النهاية",
                              textScaleFactor: 0.9,
                            ),
                            title: Text(controller.finish.value))),
                  ),
                  SizedBox(
                    child: OutlinedButton(
                        onPressed: null,
                        child: FutureBuilder<DocumentSnapshot<Month>>(
                            future: controller.getOldMarins(id, month),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              }

                              if (!snapshot.hasData) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              'البحارة القدماء',
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Wrap(
                                                alignment:
                                                    WrapAlignment.spaceEvenly,
                                                direction: Axis.horizontal,
                                                runSpacing: 20,
                                                spacing: 20,
                                                children: snapshot.data!
                                                    .data()!
                                                    .bahara
                                                    .map((item) => Text(item))
                                                    .toList()
                                                    .cast<Widget>()),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ],
                                );
                              }

                              return const Center(
                                  child: CircularProgressIndicator());
                            })),
                  ),
                  SizedBox(
                    child: OutlinedButton(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          ListTile(
                              title: Text(
                            "البحارة المختارون",
                            textAlign: TextAlign.center,
                          )),
                          SizedBox(
                            height: 20,
                          ),
                          GetBuilder<DeclarationEditController>(
                            builder: (_) {
                              return Wrap(
                                alignment: WrapAlignment.spaceEvenly,
                                direction: Axis.horizontal,
                                runSpacing: 20,
                                spacing: 20,
                                children: _.marinFinal
                                    .map((item) => MarinPreview(item, () {
                                          _.marinFinal.remove(item);
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
                      onPressed: null,
                    ),
                  ),
                  SizedBox(
                    child: OutlinedButton(
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
                                        RegExp("[A-Z0-9-/]")),
                                  ],
                                  decoration: InputDecoration(
                                    labelText: "اختر البحارة",
                                  ),
                                  controller: controller.filterController,
                                  onChanged: (value) {
                                    controller.addSearchList(value);
                                    controller.update();
                                  },
                                ),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          SingleChildScrollView(
                            child: GetBuilder<DeclarationEditController>(
                              builder: (_) {
                                return Wrap(
                                  alignment: WrapAlignment.spaceEvenly,
                                  direction: Axis.horizontal,
                                  runSpacing: 20,
                                  spacing: 20,
                                  children: _.marinQuery
                                      .map((item) =>
                                          MarinAdd(item, _.marinFinal, _))
                                      .toList()
                                      .cast<Widget>(),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      onPressed: null,
                    ),
                  ),
                  Center(
                    child: SizedBox(
                        height: 70,
                        width: 300,
                        child: OutlinedButton(
                            onPressed: () {
                              controller.addDeclaration(
                                  '$id',
                                  '$month',
                                  '${controller.start.value}',
                                  '${controller.finish.value}',
                                  b.boatCoopPerc);
                            },
                            child: ListTile(
                              title: Text(
                                'صحح التقرير',
                                textAlign: TextAlign.center,
                              ),
                            ))),
                  ),
                ],
              );
            }));
  }
}
