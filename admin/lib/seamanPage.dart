import 'dart:ui';
import 'package:admin/error404.dart';
import 'package:admin/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<DocumentSnapshot> getSeamanDoc(x) async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  return await _firestore.collection('seamen').doc(x).get();
}

class SeamanPage extends StatelessWidget {
  final String id = Get.parameters['id']!;
  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "صفحة البحار",
      subtitle: FutureBuilder<DocumentSnapshot>(
        future: getSeamanDoc(id),
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
          future: getSeamanDoc(id),
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
                    child: context.responsiveValue(
                        mobile: Row(
                          children: [
                            Expanded(
                                child: ListView(
                              children: [
                                Center(
                                  child: SeamanInfo(data: data),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(child: ImageOfSeaman(data: data)),
                              ],
                            ))
                          ],
                        ),
                        tablet: Row(
                          children: [
                            Expanded(
                                child: ListView(
                              children: [
                                Center(
                                  child: SeamanInfo(data: data),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(child: ImageOfSeaman(data: data)),
                              ],
                            ))
                          ],
                        ),
                        desktop: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: SeamanInfo(data: data),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(child: ImageOfSeaman(data: data)),
                          ],
                        )),
                  ),
                );
              } else {
                return NoProduct(
                  title: "لا يوجد بحار في هذا الرابط",
                  subtitle: "صحح الرابط او عد الى الصفحة الرئيسية",
                );
              }
            }

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
}

class ImageOfSeaman extends StatelessWidget {
  const ImageOfSeaman({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String?, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () => Get.defaultDialog(
            title: 'كبر الصورة',
            content: Expanded(
              child: InteractiveViewer(
                child: Center(child: Image.network('${data!['image']}')),
              ),
            )),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(child: Image.network('${data!['image']}')),
        ));
  }
}

class SeamanInfo extends StatelessWidget {
  const SeamanInfo({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String?, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(columns: [
        DataColumn(label: Container()),
        DataColumn(label: Container()),
      ], rows: [
        DataRow(cells: [
          DataCell(
            Center(
              child: Text(
                '${data!['name']}',
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          DataCell(Center(
            child: Text(
              'الاسم',
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          )),
        ]),
        DataRow(cells: [
          DataCell(
            Center(
              child: Text(
                '${data!['cin']}',
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          DataCell(
            Center(
              child: Text(
                'رقم البطاقة',
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
                '${data!['phone']}',
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          DataCell(
            Center(
              child: Text(
                'رقم الهاتف',
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
                '${data!['cnss']}',
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          DataCell(
            Center(
              child: Text(
                'الضمان الاجتماعي',
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}
