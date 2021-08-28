import 'package:admin/controllers/dateController.dart';
import 'package:admin/controllers/declarationInputController.dart';
import 'package:admin/lists/marins.dart';
import 'package:admin/models/boatModel.dart';
import 'package:admin/models/monthModel.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:admin/widgets/marinWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;

class DeclarationInput extends GetView<DeclarationInputController> {
  final String id = Get.parameters['id']!;
  @override
  Widget build(BuildContext context) {
    return MainBody(
        title: 'تصريح جديد',
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
                              labelText: "المحروقات",
                            ),
                            keyboardType: TextInputType.number,
                            controller: controller.carbController,
                            onSaved: (value) {
                              controller.carb = value! as RxDouble;
                            },
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
                          title: GetX<DateController>(
                            builder: (d) {
                              return Text(
                                '${d.firstDayOfMonthText}',
                              );
                            },
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
                            "تاريخ النهاية",
                            textScaleFactor: 0.9,
                          ),
                          title: GetX<DateController>(
                            builder: (d) {
                              return Text(
                                '${d.lastDayOfMonthText}',
                              );
                            },
                          ),
                        )),
                  ),
                  SizedBox(
                      width: 300,
                      height: 300,
                      child: OutlinedButton(
                        onPressed: null,
                        child: GetX<DateController>(
                          builder: (d) {
                            return dp.MonthPicker(
                              selectedDate: d.dateNow.value,
                              onChanged: d.renew,
                              firstDate: d.firstDate.value,
                              lastDate: d.lastDate.value,
                              datePickerStyles: d.styles.value,
                            );
                          },
                        ),
                      )),
                  SizedBox(
                    child: OutlinedButton(
                        onPressed: null,
                        child: FutureBuilder<DocumentSnapshot<Month>>(
                            future: controller.getOldMarins(b.url),
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
                          GetBuilder<DeclarationInputController>(
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
                      child: MarinsWidgets(
                        add: true,
                        marins: controller.marinFinal,
                        control: controller,
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
                              DateController d = Get.put(DateController());

                              controller.addDeclaration(
                                  '${b.url}',
                                  '${d.selectedMonthText.replaceAll('/', '-')}',
                                  '${d.firstDayOfMonthText}',
                                  '${d.lastDayOfMonthText}',
                                  b.boatCoopPerc);
                            },
                            child: ListTile(
                              title: Text(
                                'انتج التقرير',
                                textAlign: TextAlign.center,
                              ),
                            ))),
                  ),
                ],
              );
            }));
  }
}
