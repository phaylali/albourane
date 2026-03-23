import 'package:admin/controllers/declaration_edit_controller.dart';
import 'package:admin/lists/marins.dart';
import 'package:admin/models/boat_model.dart';
import 'package:admin/models/month_model.dart';
import 'package:admin/widgets/marin_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DeclarationEdit extends GetView<DeclarationEditController> {
  final String id = Get.parameters['id']!;
  final String month = Get.parameters['m']!;

  DeclarationEdit({super.key});
  @override
  Widget build(BuildContext context) {
    controller.setControllers(id, month);
    return FutureBuilder<DocumentSnapshot<Boat>>(
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
                      trailing: const Text('اسم القارب'),
                      title: Text(b.boatName),
                    )),
              ),
              SizedBox(
                width: 300,
                height: 70,
                child: OutlinedButton(
                    onPressed: null,
                    child: ListTile(
                      trailing: const Text('لوحة القارب'),
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
                          FilteringTextInputFormatter.allow(RegExp("[0-9 .]")),
                        ],
                        decoration: const InputDecoration(
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
                        decoration: const InputDecoration(
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
                      trailing: const Text(''),
                      title: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9 .]")),
                        ],
                        decoration: const InputDecoration(
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
                        trailing: const Text(
                          "تاريخ البداية",
                          textScaler: TextScaler.linear(0.9),
                        ),
                        title: Text(controller.start.value))),
              ),
              SizedBox(
                width: 300,
                height: 70,
                child: OutlinedButton(
                    onPressed: null,
                    child: ListTile(
                        trailing: const Text(
                          "تاريخ النهاية",
                          textScaler: TextScaler.linear(0.9),
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
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          'البحارة القدماء',
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
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
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
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
                  onPressed: null,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const ListTile(
                          title: Text(
                        "البحارة المختارون",
                        textAlign: TextAlign.center,
                      )),
                      const SizedBox(
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
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: OutlinedButton(
                  onPressed: null,
                  child: MarinsWidgets(
                    add: true,
                    marins: controller.marinFinal,
                    control: controller,
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                    height: 70,
                    width: 300,
                    child: OutlinedButton(
                        onPressed: () {
                          controller.addDeclaration(
                              id,
                              month,
                              controller.start.value,
                              controller.finish.value,
                              b.boatCoopPerc);
                        },
                        child: const ListTile(
                          title: Text(
                            'صحح التقرير',
                            textAlign: TextAlign.center,
                          ),
                        ))),
              ),
            ],
          );
        });
  }
}
