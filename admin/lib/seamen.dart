import 'package:admin/widgets/mainBody.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeamenLibrary extends StatelessWidget {
  final FirebaseFirestore firestoro = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "البحارة",
      subtitle: Text("قاعدة بيانات البحارة"),
      child: FutureBuilder<QuerySnapshot>(
          future: firestoro.collection('seamen').get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("Something went wrong"));
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
                              'الرقم البحري',
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
                              'الضمان الاجتماعي',
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
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'رقم الهاتف',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'الصورة',
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
                                        "${item['reference']}",
                                      ),
                                      onTap: () {
                                        final String id = item.id;
                                        Get.toNamed(
                                          "/Seaman?id=$id",
                                        );
                                      },
                                    ),
                                    DataCell(
                                      Text(
                                        "${item['name']}",
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "${item['cnss']}",
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "${item['cin']}",
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "${item['phone']}",
                                      ),
                                    ),
                                    DataCell(
                                        SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: Image.network(
                                            "${item['image']}",
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
                                                      '${item['image']}')),
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
