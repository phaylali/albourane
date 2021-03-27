import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class DocsLibrary extends StatelessWidget {
  final FirebaseFirestore firestoro = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Feather.file_plus),
          onPressed: () {
            Get.toNamed("/NewDocument");
          },
        ),
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
                              child: Text("الوثائق",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.headline6),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: FutureBuilder<QuerySnapshot>(
                            future: firestoro.collection('documents').get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                    child: Text("هناك خطأ في قاعدة البيانات"));
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                QuerySnapshot? d = snapshot.data;

                                if (d!.docs.isNotEmpty) {
                                  return Center(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: DataTable(
                                        sortAscending: true,
                                        sortColumnIndex: 0,
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
                                                'الاسم',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Expanded(
                                              child: Text(
                                                'التاريخ',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Expanded(
                                              child: Text(
                                                'مقتطف من الوثيقة',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ],
                                        rows: d.docs
                                            .map(
                                              ((item) => DataRow(
                                                    cells: <DataCell>[
                                                      DataCell(
                                                          Text(
                                                            "${item.id}",
                                                          ), onTap: () {
                                                        final String id =
                                                            item.id;
                                                        Get.toNamed(
                                                          "/Document?id=$id",
                                                        );
                                                      }, onLongPress: () {
                                                        Clipboard.setData(
                                                            ClipboardData(
                                                                text:
                                                                    "${item.id}"));
                                                        Get.snackbar("", "",
                                                            titleText: Text(
                                                              "تم نسخ الرقم",
                                                              textDirection:
                                                                  TextDirection
                                                                      .rtl,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ));
                                                      }), //Extracting from Map element the value
                                                      DataCell(
                                                          Text(
                                                            "${item['name']}",
                                                          ), onLongPress: () {
                                                        Clipboard.setData(
                                                            ClipboardData(
                                                                text:
                                                                    "${item['name']}"));
                                                        Get.snackbar("", "",
                                                            titleText: Text(
                                                              "تم نسخ الاسم",
                                                              textDirection:
                                                                  TextDirection
                                                                      .rtl,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ));
                                                      }),

                                                      DataCell(
                                                          Text(
                                                            "${item['date']}",
                                                          ), onLongPress: () {
                                                        Clipboard.setData(
                                                            ClipboardData(
                                                                text:
                                                                    "${item['date']}"));
                                                        Get.snackbar("", "",
                                                            titleText: Text(
                                                              "تم نسخ التاريخ",
                                                              textDirection:
                                                                  TextDirection
                                                                      .rtl,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ));
                                                      }),
                                                      DataCell(
                                                          SizedBox(
                                                            height: 50,
                                                            width: 50,
                                                            child:
                                                                Image.network(
                                                              "${item['preview']}",
                                                              height: 50,
                                                              width: 50,
                                                            ),
                                                          ), onTap: () {
                                                        Get.defaultDialog(
                                                            title: 'كبر الصورة',
                                                            content: Expanded(
                                                              child:
                                                                  InteractiveViewer(
                                                                child: Center(
                                                                    child: Image
                                                                        .network(
                                                                            '${item['preview']}')),
                                                              ),
                                                            ));
                                                      }),
                                                    ],
                                                  )),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  );
                                }
                              }
                              return SafeArea(
                                child: Scaffold(
                                  body: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  ),
                                ),
                              );
                            }),
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
        ),
      ),
    );
  }
}
