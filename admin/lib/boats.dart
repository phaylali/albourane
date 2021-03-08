// ignore: import_of_legacy_library_into_null_safe
import 'package:admin/docsController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';

class BoatsLibrary extends StatelessWidget {
  final fC = Get.put(DocumentsController());
  BoatsLibrary({
    required this.title,
  });
  final String title;

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
                              child: Text(
                                title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                ),
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
                      SizedBox(
                        width: 300,
                        child: FutureBuilder<QuerySnapshot>(
                            future: firestoro.collection('boats').get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text("Something went wrong");
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                QuerySnapshot? d = snapshot.data;

                                if (d!.docs.isNotEmpty) {
                                  return Center(
                                    child: Wrap(
                                      spacing: 20,
                                      runSpacing: 20,
                                      children: d.docs
                                          .map((item) => SizedBox(
                                                height: 100,
                                                width: 300,
                                                child: OutlinedButton(
                                                  onPressed: () {
                                                    final String id = item.id;
                                                    Get.toNamed(
                                                      "/Boat?id=$id",
                                                    );
                                                  },
                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<
                                                              OutlinedBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30)))),
                                                  child: Flex(
                                                    direction: Axis.horizontal,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 100,
                                                        child: Center(
                                                            child: Text(
                                                          "${item['reference']}",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                      ),
                                                      Expanded(
                                                        child: Center(
                                                            child: Text(
                                                          "${item['name']}",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ))
                                          .toList()
                                          .cast<Widget>(),
                                    ),
                                  );
                                  /*ListView.builder(
                                    itemCount: d.docs.length,
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        height: 100,
                                        width: 300,
                                        child: OutlinedButton(
                                          onPressed: () {
                                            final String id = d.docs[index].id;
                                            Get.toNamed(
                                              "/Boat?id=$id",
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 100,
                                                child: Center(
                                                    child: Text(
                                                  "${d.docs[index]['reference']}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                              ),
                                              Expanded(
                                                child: Center(
                                                    child: Text(
                                                  "${d.docs[index]['name']}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );*/
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
