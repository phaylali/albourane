import 'package:admin/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DocsLibrary extends StatelessWidget {
  final FirebaseFirestore firestoro = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "الوثائق",
      subtitle: Text("مكتبة الوثائق"),
      child: FutureBuilder<QuerySnapshot>(
          future: firestoro.collection('documents').get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("هناك خطأ في قاعدة البيانات"));
            }
            if (snapshot.connectionState == ConnectionState.done) {
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
                                      final String id = item.id;
                                      Get.toNamed(
                                        "/Document?id=$id",
                                      );
                                    }, onLongPress: () {
                                      Clipboard.setData(
                                          ClipboardData(text: "${item.id}"));
                                      Get.snackbar("", "",
                                          titleText: Text(
                                            "تم نسخ الرقم",
                                            textDirection: TextDirection.rtl,
                                            textAlign: TextAlign.center,
                                          ));
                                    }), //Extracting from Map element the value
                                    DataCell(
                                        Text(
                                          "${item['name']}",
                                        ), onLongPress: () {
                                      Clipboard.setData(ClipboardData(
                                          text: "${item['name']}"));
                                      Get.snackbar("", "",
                                          titleText: Text(
                                            "تم نسخ الاسم",
                                            textDirection: TextDirection.rtl,
                                            textAlign: TextAlign.center,
                                          ));
                                    }),

                                    DataCell(
                                        Text(
                                            "${item['date'].toDate().toString().split(" ").first}"
                                            //"${item['date']}",
                                            ), onLongPress: () {
                                      Clipboard.setData(ClipboardData(
                                          text:
                                              "${item['date'].toDate().toString().split(" ").first}"));
                                      Get.snackbar("", "",
                                          titleText: Text(
                                            "تم نسخ التاريخ",
                                            textDirection: TextDirection.rtl,
                                            textAlign: TextAlign.center,
                                          ));
                                    }),
                                    DataCell(
                                        SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: Image.network(
                                            "${item['preview']}",
                                            height: 50,
                                            width: 50,
                                          ),
                                        ), onTap: () {
                                      Get.defaultDialog(
                                          title: 'كبر الصورة',
                                          content: Expanded(
                                            child: InteractiveViewer(
                                              child: Center(
                                                  child: Image.network(
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
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
            );
          }),
    );
  }
}
