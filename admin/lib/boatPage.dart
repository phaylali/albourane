import 'dart:ui';
import 'package:admin/error404.dart';
import 'package:admin/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<DocumentSnapshot> getBoatDoc(x) async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  return await _firestore.collection('boats').doc(x).get();
}

class BoatPage extends StatelessWidget {
  final String id = Get.parameters['id']!;
  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "صفحة القارب",
      subtitle: FutureBuilder<DocumentSnapshot>(
        future: getBoatDoc(id),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              DocumentSnapshot? item = snapshot.data;
              return Center(
                  // here only return is missing
                  child: Text(
                "${item!['name']}" + "     " + "${item['reference']}",
              ));
            }
          } else if (snapshot.hasError) {
            Text('no data');
          }
          return CircularProgressIndicator();
        },
      ),
      child: FutureBuilder<DocumentSnapshot>(
          future: getBoatDoc(id),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("هناك مشكل ما"));
            }
            if (snapshot.connectionState == ConnectionState.done) {
              DocumentSnapshot? d = snapshot.data;

              if (d!.exists) {
                Map<String?, dynamic>? data = d.data()!;
                return Center(
                  child: Container(
                    child: ListView(
                      children: [
                        Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(columns: [
                              DataColumn(label: Container()),
                              DataColumn(label: Container()),
                            ], rows: [
                              DataRow(cells: [
                                DataCell(
                                  Center(
                                    child: Text(
                                      '${data['owner']}',
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                DataCell(Center(
                                  child: Text(
                                    'المسؤول',
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                              ]),
                              DataRow(cells: [
                                DataCell(
                                  Center(
                                    child: Text(
                                      '${data['ownerCIN']}',
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text(
                                      'بطاقة المسؤول',
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: [
                                DataCell(
                                  Center(
                                    child: Text(
                                      '${data['region']}',
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text(
                                      'المنطقة',
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ]),
                            ]),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        OutlinedButton(
                            onPressed: () => Get.defaultDialog(
                                title: 'كبر الصورة',
                                content: Container(
                                  child: InteractiveViewer(
                                    child: Center(
                                        child:
                                            Image.network('${data['image']}')),
                                  ),
                                )),
                            style: ButtonStyle(
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)))),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Center(
                                  child: Image.network('${data['image']}')),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(columns: [
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'الرقم',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'اسم المالك',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'رقم البطاقة',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ], rows: [
                              wrt(context, "1", '${data['warit1']}',
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
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ExpansionTile(
                          collapsedBackgroundColor:
                              Theme.of(context).primaryColor,
                          title: Center(
                            child: Text("لائحة الورثة",
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                                style: Theme.of(context).textTheme.caption),
                          ),
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: Center(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: DataTable(
                                        rows: [
                                          wrt(
                                            context,
                                            "3",
                                            data['warit3'] == null
                                                ? "لايوجد"
                                                : '${data['warit3']}',
                                            data['warit3ID'] == null
                                                ? "لايوجد"
                                                : '${data['warit3ID']}',
                                          ),
                                          wrt(
                                            context,
                                            "4",
                                            data['warit4'] == null
                                                ? "لايوجد"
                                                : '${data['warit4']}',
                                            data['warit4ID'] == null
                                                ? "لايوجد"
                                                : '${data['warit4ID']}',
                                          ),
                                          wrt(
                                            context,
                                            "5",
                                            data['warit5'] == null
                                                ? "لايوجد"
                                                : '${data['warit5']}',
                                            data['warit5ID'] == null
                                                ? "لايوجد"
                                                : '${data['warit5ID']}',
                                          ),
                                          wrt(
                                            context,
                                            "6",
                                            data['warit6'] == null
                                                ? "لايوجد"
                                                : '${data['warit6']}',
                                            data['warit6ID'] == null
                                                ? "لايوجد"
                                                : '${data['warit6ID']}',
                                          ),
                                          wrt(
                                            context,
                                            "7",
                                            data['warit7'] == null
                                                ? "لايوجد"
                                                : '${data['warit7']}',
                                            data['warit7ID'] == null
                                                ? "لايوجد"
                                                : '${data['warit7ID']}',
                                          ),
                                          wrt(
                                            context,
                                            "8",
                                            data['warit8'] == null
                                                ? "لايوجد"
                                                : '${data['warit8']}',
                                            data['warit8ID'] == null
                                                ? "لايوجد"
                                                : '${data['warit8ID']}',
                                          ),
                                          wrt(
                                            context,
                                            "9",
                                            data['warit9'] == null
                                                ? "لايوجد"
                                                : '${data['warit9']}',
                                            data['warit9ID'] == null
                                                ? "لايوجد"
                                                : '${data['warit9ID']}',
                                          ),
                                          wrt(
                                            context,
                                            "10",
                                            data['warit10'] == null
                                                ? "لايوجد"
                                                : '${data['warit10']}',
                                            data['warit10ID'] == null
                                                ? "لايوجد"
                                                : '${data['warit10ID']}',
                                          ),
                                          wrt(
                                            context,
                                            "11",
                                            data['warit11'] == null
                                                ? "لايوجد"
                                                : '${data['warit11']}',
                                            data['warit11ID'] == null
                                                ? "لايوجد"
                                                : '${data['warit11ID']}',
                                          ),
                                          wrt(
                                            context,
                                            "12",
                                            data['warit12'] == null
                                                ? "لايوجد"
                                                : '${data['warit12']}',
                                            data['warit12ID'] == null
                                                ? "لايوجد"
                                                : '${data['warit12ID']}',
                                          ),
                                          wrt(
                                            context,
                                            "13",
                                            data['warit13'] == null
                                                ? "لايوجد"
                                                : '${data['warit13']}',
                                            data['warit13ID'] == null
                                                ? "لايوجد"
                                                : '${data['warit13ID']}',
                                          ),
                                          wrt(
                                            context,
                                            "14",
                                            data['warit14'] == null
                                                ? "لايوجد"
                                                : '${data['warit14']}',
                                            data['warit14ID'] == null
                                                ? "لايوجد"
                                                : '${data['warit14ID']}',
                                          ),
                                          wrt(
                                            context,
                                            "15",
                                            data['warit15'] == null
                                                ? "لايوجد"
                                                : '${data['warit15']}',
                                            data['warit15ID'] == null
                                                ? "لايوجد"
                                                : '${data['warit15ID']}',
                                          ),
                                          wrt(
                                            context,
                                            "16",
                                            data['warit16'] == null
                                                ? "لايوجد"
                                                : '${data['warit16']}',
                                            data['warit16ID'] == null
                                                ? "لايوجد"
                                                : '${data['warit16ID']}',
                                          ),
                                          wrt(
                                            context,
                                            "17",
                                            data['warit17'] == null
                                                ? "لايوجد"
                                                : '${data['warit17']}',
                                            data['warit17ID'] == null
                                                ? "لايوجد"
                                                : '${data['warit17ID']}',
                                          ),
                                          wrt(
                                            context,
                                            "18",
                                            data['warit18'] == null
                                                ? "لايوجد"
                                                : '${data['warit18']}',
                                            data['warit18ID'] == null
                                                ? "لايوجد"
                                                : '${data['warit18ID']}',
                                          ),
                                          wrt(
                                            context,
                                            "19",
                                            data['warit19'] == null
                                                ? "لايوجد"
                                                : '${data['warit19']}',
                                            data['warit19ID'] == null
                                                ? "لايوجد"
                                                : '${data['warit19ID']}',
                                          ),
                                          wrt(
                                            context,
                                            "20",
                                            data['warit20'] == null
                                                ? "لايوجد"
                                                : '${data['warit20']}',
                                            data['warit20ID'] == null
                                                ? "لايوجد"
                                                : '${data['warit20ID']}',
                                          ),
                                        ],
                                        columns: [
                                          DataColumn(
                                            label: Expanded(
                                              child: Text(
                                                'الرقم',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Expanded(
                                              child: Text(
                                                'اسم الوارث',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Expanded(
                                              child: Text(
                                                'رقم البطاقة',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
    );
  }

  DataRow wrt(
      BuildContext context, String wrtNo, String wrtName, String wrtID) {
    return DataRow(cells: [
      DataCell(
        Container(
          child: Center(
            child: Text(
              "$wrtNo",
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          child: Center(
            child: Text(
              "$wrtName",
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          child: Center(
            child: Text(
              "$wrtID",
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ]);
  }
}
