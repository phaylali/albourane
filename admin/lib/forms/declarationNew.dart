import 'package:admin/controllers/dateController.dart';
//import 'package:admin/controllers/marinsController.dart';
//import 'package:admin/lists/marins.dart';
import 'package:admin/models/boatModel.dart';
import 'package:admin/models/marinModel.dart';
import 'package:admin/models/marinMonthModel.dart';
import 'package:admin/models/monthModel.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:admin/widgets/marinWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;

class DeclarationInputController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController revenueController,
      salesController,
      carbController,
      filterController;

  RxDouble revenue = 0.0.obs;
  RxInt sales = 0.obs;
  RxDouble carb = 0.0.obs;
  var filter = '6'.obs;
  List<Marin> marinzo = [];
  List<Marin> marinQuery = [];
  List<Marin> marinFinal = [];
  var baharaz = [].obs;

  @override
  void onInit() {
    super.onInit();
    revenueController = TextEditingController();
    salesController = TextEditingController();
    carbController = TextEditingController();
    filterController = TextEditingController();
    getMarins();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    revenueController.dispose();
    salesController.dispose();
    carbController.dispose();
    filterController.dispose();
  }

  getMarins() async {
    return await FirebaseFirestore.instance
        .collection('seamen')
        .withConverter<Marin>(
          fromFirestore: (snapshots, _) => Marin.fromJson(snapshots.data()!),
          toFirestore: (movie, _) => movie.toJson(),
        )
        .get()
        .then((value) {
      final by = value.docs;
      by.forEach((element) {
        marinzo.add(element.data());
      });
    });
  }

  Future<DocumentSnapshot<Month>> getOldMarins(boat) async {
    final hy = await FirebaseFirestore.instance
        .collection('boats')
        .doc(boat)
        .collection('revenue')
        .get();

    return FirebaseFirestore.instance
        .collection('boats')
        .doc(boat)
        .collection('revenue')
        .doc(hy.docs.last.id)
        .withConverter<Month>(
          fromFirestore: (snapshots, _) => Month.fromJson(snapshots.data()!),
          toFirestore: (boat, _) => boat.toJson(),
        )
        .get();
  }

  addDeclaration(boat, doc, start, finish, coopPerc) async {
    marinFinal.forEach((element) {
      baharaz.add(element.marinReference.replaceAll('/', '-'));
    });
    final rev = double.parse(revenueController.text);
    final salezo = int.parse(salesController.text);
    final carbo = double.parse(carbController.text);
    final cnss = rev * 6 / 100;
    final amo = rev * 1.7 / 100;
    final totalcnss = cnss + amo;
    final taxehalle = rev * 4 / 100;
    final coop = rev * coopPerc / 100;
    final taxeregion = rev * 0.16 / 100;
    final totalglobal = cnss + amo + taxehalle + taxeregion + coop;
    final charges = carbo + taxeregion + coop + taxehalle;
    final net = rev - totalcnss - charges;
    final patron = net * 40 / 100;
    final equipage = net * 60 / 100;
    final pie = equipage / marinFinal.length;

    return await FirebaseFirestore.instance
        .collection('boats')
        .doc(boat)
        .collection('revenue')
        .withConverter<Month>(
          fromFirestore: (snapshots, _) => Month.fromJson(snapshots.data()!),
          toFirestore: (month, _) => month.toJson(),
        )
        .doc(doc)
        .set(Month(
            bahara: baharaz,
            monthFinish: finish,
            monthEquipageNumber: marinFinal.length,
            monthRevenue: rev,
            monthSales: salezo,
            monthStart: start,
            monthAmo: amo,
            monthAutres: 0.00,
            monthCarb: carbo,
            monthChargesCommun: charges,
            monthCnss: cnss,
            monthCoop: coop,
            monthEquipage: equipage,
            monthEquipagePerc: 60,
            monthNet: net,
            monthPatron: patron,
            monthPatronPerc: 40,
            monthPeage: 0.00,
            monthPie: pie,
            monthTaxeHalle: taxehalle,
            monthTaxeRegion: taxeregion,
            monthTotalCnss: totalcnss,
            monthTotalGlobal: totalglobal))
        .then((value) {
      marinFinal.forEach((element) async {
        final mar = element.marinReference.replaceAll('/', '-');
        FirebaseFirestore.instance
            .collection('seamen')
            .doc(mar)
            .collection('revenue')
            .withConverter<MarinMonth>(
              fromFirestore: (snapshots, _) =>
                  MarinMonth.fromJson(snapshots.data()!),
              toFirestore: (month, _) => month.toJson(),
            )
            .doc(doc)
            .set(MarinMonth(boatReference: boat, marinPie: pie));
      });
    });
  }

  addSearchList(filtero) async {
    marinQuery = marinzo.where((element) {
      return element.marinReference.contains(filtero);
    }).toList();
    notifyChildrens();
  }

  Future<DocumentSnapshot<Boat>> getBoat(x) async {
    return await FirebaseFirestore.instance
        .collection('boats')
        .doc(x)
        .withConverter<Boat>(
          fromFirestore: (snapshots, _) => Boat.fromJson(snapshots.data()!),
          toFirestore: (boat, _) => boat.toJson(),
        )
        .get();
  }
}

class DeclarationInput extends GetView<DeclarationInputController> {
  final String id = Get.parameters['id']!;
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
                      return Row(
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
                                          controller:
                                              controller.revenueController,
                                          onSaved: (value) {
                                            controller.revenue =
                                                value! as RxDouble;
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
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          decoration: InputDecoration(
                                            labelText: "عدد المبيعات",
                                          ),
                                          keyboardType: TextInputType.number,
                                          controller:
                                              controller.salesController,
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
                                            controller.carb =
                                                value! as RxDouble;
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
                                      child: FutureBuilder<
                                              DocumentSnapshot<Month>>(
                                          future: controller.getOldMarins(b
                                              .boatReference
                                              .replaceAll('/', '-')),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasError) {
                                              return Center(
                                                child: Text(
                                                    snapshot.error.toString()),
                                              );
                                            }

                                            if (!snapshot.hasData) {
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              return Row(
                                                children: [
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Expanded(
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text(
                                                            'البحارة القدماء',
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Wrap(
                                                              alignment:
                                                                  WrapAlignment
                                                                      .spaceEvenly,
                                                              direction: Axis
                                                                  .horizontal,
                                                              runSpacing: 20,
                                                              spacing: 20,
                                                              children: snapshot
                                                                  .data!
                                                                  .data()!
                                                                  .bahara
                                                                  .map((item) =>
                                                                      Text(
                                                                          item))
                                                                  .toList()
                                                                  .cast<
                                                                      Widget>()),
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
                                                child:
                                                    CircularProgressIndicator());
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
                                              alignment:
                                                  WrapAlignment.spaceEvenly,
                                              direction: Axis.horizontal,
                                              runSpacing: 20,
                                              spacing: 20,
                                              children: _.marinFinal
                                                  .map((item) =>
                                                      MarinPreview(item))
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
                                                  FilteringTextInputFormatter
                                                      .allow(
                                                          RegExp("[A-Z0-9-/]")),
                                                ],
                                                decoration: InputDecoration(
                                                  labelText: "اختر البحارة",
                                                ),
                                                controller:
                                                    controller.filterController,
                                                onChanged: (value) {
                                                  controller
                                                      .addSearchList(value);
                                                  controller.update();
                                                },
                                              ),
                                            )),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        SingleChildScrollView(
                                          child: GetBuilder<
                                              DeclarationInputController>(
                                            builder: (_) {
                                              return Wrap(
                                                alignment:
                                                    WrapAlignment.spaceEvenly,
                                                direction: Axis.horizontal,
                                                runSpacing: 20,
                                                spacing: 20,
                                                children: _.marinQuery
                                                    .map((item) => MarinAdd(
                                                        item, _.marinFinal, _))
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
                                            DateController d =
                                                Get.put(DateController());

                                            controller.addDeclaration(
                                                '${b.boatReference.replaceAll('/', '-')}',
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
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      );
                    }),
              ),
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
