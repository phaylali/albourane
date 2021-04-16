import 'package:admin/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoatsLibrary extends StatelessWidget {
  final FirebaseFirestore firestoro = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "القوارب",
      subtitle: Text("قاعدة بيانات القوارب"),
      child: FutureBuilder<QuerySnapshot>(
          future: firestoro.collection('boats').get(),
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
                              'اللوحة',
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
                              'المسؤول',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'بطاقة المسؤول',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'المنطقة',
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
                                          "/Boat?id=$id",
                                        );
                                      },
                                    ), //Extracting from Map element the value
                                    DataCell(
                                      Text(
                                        "${item['name']}",
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "${item['owner']}",
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "${item['ownerCIN']}",
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "${item['region']}",
                                      ),
                                    ),
                                    DataCell(
                                        SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: Image.network(
                                            "${item['image']}",
                                          ),
                                        ), onTap: () {
                                      Get.defaultDialog(
                                          title: 'كبر الصورة',
                                          content: Expanded(
                                            child: InteractiveViewer(
                                              child: Center(
                                                  child: Image.network(
                                                '${item['image']}',
                                              )),
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
