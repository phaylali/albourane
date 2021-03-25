import 'dart:ui';
import 'package:admin/error404.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';

class BoatPage extends StatelessWidget {
  final FirebaseFirestore firestoro = FirebaseFirestore.instance;
  final String id = Get.parameters['id']!;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton:
            FloatingActionButton(child: Icon(Feather.save), onPressed: () {}),
        body: FutureBuilder<DocumentSnapshot>(
            future: firestoro.collection('boats').doc(id).get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("هناك مشكل ما"));
              }
              if (snapshot.connectionState == ConnectionState.done) {
                DocumentSnapshot? d = snapshot.data;

                if (d!.exists) {
                  Map<String?, dynamic>? data = d.data()!;
                  return SafeArea(
                    child: Scaffold(
                        body: Center(
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('${data['name']}',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('${data['reference']}',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 40,
                                        width: 60,
                                        child: OutlinedButton(
                                          child: Icon(Feather.home),
                                          onPressed: () {
                                            Get.toNamed('/');
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 40,
                                        width: 60,
                                        child: OutlinedButton(
                                          child: Icon(Feather.arrow_left),
                                          onPressed: () {
                                            Get.back();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Flex(
                                      direction: Axis.vertical,
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: ListView(
                                            //direction: Axis.vertical,
                                            children: [
                                              Center(
                                                child: Text("معلومات",
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2),
                                              ),
                                              DataTable(columns: [
                                                DataColumn(label: Container()),
                                                DataColumn(label: Container()),
                                              ], rows: [
                                                DataRow(cells: [
                                                  DataCell(
                                                    Text(
                                                      'المسؤول',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                      maxLines: 3,
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Text(
                                                      '${data['owner']}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                      maxLines: 3,
                                                    ),
                                                  ),
                                                ]),
                                                DataRow(cells: [
                                                  DataCell(
                                                    Text(
                                                      'بطاقة المسؤول',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                      maxLines: 3,
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Text(
                                                      '${data['ownerCIN']}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                      maxLines: 3,
                                                    ),
                                                  ),
                                                ]),
                                                DataRow(cells: [
                                                  DataCell(
                                                    Text(
                                                      'المنطقة',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                      maxLines: 3,
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Text(
                                                      '${data['region']}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                      maxLines: 3,
                                                    ),
                                                  ),
                                                ]),
                                              ]),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              OutlinedButton(
                                                  onPressed: () => GetPlatform
                                                          .isMobile
                                                      ? Get.defaultDialog(
                                                          title: 'كبر الصورة',
                                                          content: Expanded(
                                                            child:
                                                                InteractiveViewer(
                                                              child: Center(
                                                                  child: Image
                                                                      .network(
                                                                          '${data['image']}')),
                                                            ),
                                                          ))
                                                      : null,
                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<
                                                              OutlinedBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30)))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: Center(
                                                        child: Image.network(
                                                            '${data['image']}')),
                                                  )),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Center(
                                                child: Text("المالكون",
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2),
                                              ),
                                              DataTable(columns: [
                                                DataColumn(
                                                  label: Center(
                                                    child: Text('الاسم',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Center(
                                                    child: Text('رقم البطاقة',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2),
                                                  ),
                                                ),
                                              ], rows: [
                                                wrt(
                                                    context,
                                                    "1",
                                                    '${data['warit1']}',
                                                    '${data['warit1ID']}'),
                                                wrt(
                                                  context,
                                                  "2",
                                                  data['warit2'] == null
                                                      ? "لايوجد"
                                                      : '${data['warit2']}',
                                                  data['warit2ID'] == null
                                                      ? "لايوجد"
                                                      : '${data['warit2ID']}',
                                                ),
                                              ]),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Center(
                                                child: Text("الورثة",
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              ExpansionTile(
                                                collapsedBackgroundColor:
                                                    Theme.of(context)
                                                        .primaryColor,
                                                title: Center(
                                                  child: Text("لائحة الورثة",
                                                      textAlign:
                                                          TextAlign.center,
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption),
                                                ),
                                                children: [
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Expanded(
                                                        child: DataTable(
                                                          rows: [
                                                            wrt(
                                                              context,
                                                              "3",
                                                              data['warit3'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit3']}',
                                                              data['warit3ID'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit3ID']}',
                                                            ),
                                                            wrt(
                                                              context,
                                                              "4",
                                                              data['warit4'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit4']}',
                                                              data['warit4ID'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit4ID']}',
                                                            ),
                                                            wrt(
                                                              context,
                                                              "5",
                                                              data['warit5'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit5']}',
                                                              data['warit5ID'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit5ID']}',
                                                            ),
                                                            wrt(
                                                              context,
                                                              "6",
                                                              data['warit6'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit6']}',
                                                              data['warit6ID'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit6ID']}',
                                                            ),
                                                            wrt(
                                                              context,
                                                              "7",
                                                              data['warit7'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit7']}',
                                                              data['warit7ID'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit7ID']}',
                                                            ),
                                                            wrt(
                                                              context,
                                                              "8",
                                                              data['warit8'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit8']}',
                                                              data['warit8ID'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit8ID']}',
                                                            ),
                                                            wrt(
                                                              context,
                                                              "9",
                                                              data['warit9'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit9']}',
                                                              data['warit9ID'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit9ID']}',
                                                            ),
                                                            wrt(
                                                              context,
                                                              "10",
                                                              data['warit10'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit10']}',
                                                              data['warit10ID'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit10ID']}',
                                                            ),
                                                            wrt(
                                                              context,
                                                              "11",
                                                              data['warit11'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit11']}',
                                                              data['warit11ID'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit11ID']}',
                                                            ),
                                                            wrt(
                                                              context,
                                                              "12",
                                                              data['warit12'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit12']}',
                                                              data['warit12ID'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit12ID']}',
                                                            ),
                                                            wrt(
                                                              context,
                                                              "13",
                                                              data['warit13'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit13']}',
                                                              data['warit13ID'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit13ID']}',
                                                            ),
                                                            wrt(
                                                              context,
                                                              "14",
                                                              data['warit14'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit14']}',
                                                              data['warit14ID'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit14ID']}',
                                                            ),
                                                            wrt(
                                                              context,
                                                              "15",
                                                              data['warit15'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit15']}',
                                                              data['warit15ID'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit15ID']}',
                                                            ),
                                                            wrt(
                                                              context,
                                                              "16",
                                                              data['warit16'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit16']}',
                                                              data['warit16ID'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit16ID']}',
                                                            ),
                                                            wrt(
                                                              context,
                                                              "17",
                                                              data['warit17'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit17']}',
                                                              data['warit17ID'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit17ID']}',
                                                            ),
                                                            wrt(
                                                              context,
                                                              "18",
                                                              data['warit18'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit18']}',
                                                              data['warit18ID'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit18ID']}',
                                                            ),
                                                            wrt(
                                                              context,
                                                              "19",
                                                              data['warit19'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit19']}',
                                                              data['warit19ID'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit19ID']}',
                                                            ),
                                                            wrt(
                                                              context,
                                                              "20",
                                                              data['warit20'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit20']}',
                                                              data['warit20ID'] ==
                                                                      null
                                                                  ? "لايوجد"
                                                                  : '${data['warit20ID']}',
                                                            ),
                                                          ],
                                                          columns: [
                                                            DataColumn(
                                                              label: Center(
                                                                child: Text(
                                                                    'الاسم',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .subtitle2),
                                                              ),
                                                            ),
                                                            DataColumn(
                                                              label: Center(
                                                                child: Text(
                                                                    'رقم البطاقة',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .subtitle2),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                  );
                } else {
                  return NoProduct(
                    title: "لا يوجد قارب في هذا الرابط",
                    subtitle: "صحح الرابط او عد الى الصفحة الرئيسية",
                  );
                }
              }

              // return
              return SafeArea(
                child: Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
              );
            }),
      ),
    );
  }

  DataRow wrt(
      BuildContext context, String wrtNo, String wrtName, String wrtID) {
    return DataRow(cells: [
      DataCell(
        Text(
          "$wrtName",
          style: Theme.of(context).textTheme.bodyText1,
          maxLines: 3,
        ),
      ),
      DataCell(
        Text(
          "$wrtID",
          style: Theme.of(context).textTheme.bodyText1,
          maxLines: 3,
        ),
      ),
    ]);
  }
}
