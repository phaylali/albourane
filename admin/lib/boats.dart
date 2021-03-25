import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';

class BoatsLibrary extends StatelessWidget {
  // final fC = Get.put(DocumentsController());

  final FirebaseFirestore firestoro = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Feather.file_plus),
          onPressed: () {
            Get.toNamed("/NewBoat");
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
                              child: Text("القوارب",
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
                            future: firestoro.collection('boats').get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                    child: Text("Something went wrong"));
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
                                            label: Text('اللوحة',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1),
                                          ),
                                          DataColumn(
                                            label: Text('الاسم',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1),
                                          ),
                                          DataColumn(
                                            label: Text('المسؤول',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1),
                                          ),
                                          DataColumn(
                                            label: Text('بطاقة المسؤول',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1),
                                          ),
                                          DataColumn(
                                            label: Text('المنطقة',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1),
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
                                                          final String id =
                                                              item.id;
                                                          Get.toNamed(
                                                            "/Boat?id=$id",
                                                          );
                                                        },
                                                      ), //Extracting from Map element the value
                                                      DataCell(
                                                        Text(
                                                          "${item['name']}",
                                                        ),
                                                        onTap: () {
                                                          final String id =
                                                              item.id;
                                                          Get.toNamed(
                                                            "/Boat?id=$id",
                                                          );
                                                        },
                                                      ),
                                                      DataCell(Text(
                                                        "${item['owner']}",
                                                      )),
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
