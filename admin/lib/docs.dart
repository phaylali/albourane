// ignore: import_of_legacy_library_into_null_safe
import 'package:admin/docsController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';

class DocsLibrary extends StatelessWidget {
  final fC = Get.put(DocumentsController());
  DocsLibrary({required this.title, required this.subtitle});
  final String title;
  final String subtitle;
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
                              child: Text(
                                title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                subtitle,
                              ),
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
                            child: ElevatedButton(
                              child: Icon(Feather.user),
                              onPressed: () {
                                Get.toNamed('/profile');
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 40,
                            width: 60,
                            child: ElevatedButton(
                              child: Icon(Feather.shopping_cart),
                              onPressed: () {
                                Get.toNamed('/cart');
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: FutureBuilder<QuerySnapshot>(
                            future: firestoro.collection('documents').get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text("Something went wrong");
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                QuerySnapshot? d = snapshot.data;

                                if (d!.docs.isNotEmpty) {
                                  return ListView.builder(
                                    itemCount: d.docs.length,
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        height: 200,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            final String id = d.docs[index].id;
                                            Get.toNamed(
                                              "/Document?id=$id",
                                            );
                                          },
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      OutlinedBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)))),
                                          child: Flex(
                                            direction: Axis.horizontal,
                                            children: [
                                              SizedBox(
                                                width: 100,
                                                child: Center(
                                                    child: Image.network(
                                                        "${d.docs[index]['preview']}")),
                                              ),
                                              Expanded(
                                                child: Flex(
                                                  direction: Axis.vertical,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    SizedBox(
                                                      height: 50,
                                                      child: Text(
                                                        "${d.docs[index].id}",
                                                        textAlign:
                                                            TextAlign.center,
                                                        textScaleFactor: 2,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Center(
                                                          child: Text(
                                                        "${d.docs[index]['name']}",
                                                        textScaleFactor: 1.5,
                                                      )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
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
