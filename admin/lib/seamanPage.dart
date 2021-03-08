import 'dart:ui';

import 'package:admin/error404.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';

class SeamanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String id = Get.parameters['id']!;
    final FirebaseFirestore firestoro = FirebaseFirestore.instance;

    return FutureBuilder<DocumentSnapshot>(
        future: firestoro.collection('seamen').doc(id).get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            DocumentSnapshot? d = snapshot.data;

            if (d!.exists) {
              Map<String?, dynamic>? data = d.data()!;
              return SafeArea(
                child: Scaffold(
                  body: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SelectableText(
                                        '${data['name']}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SelectableText(
                                        '${data['reference']}',
                                      ),
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
                        SizedBox(
                          height: 10,
                        ),
                        OutlinedButton(
                            onPressed: () => GetPlatform.isMobile
                                ? Get.defaultDialog(
                                    title: 'Zoom In Document',
                                    content: Expanded(
                                      child: InteractiveViewer(
                                        child: Center(
                                            child: Image.network(
                                                '${data['image']}')),
                                      ),
                                    ))
                                : null,
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
                          height: 10,
                        ),
                        SizedBox(
                          height: 500,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)))),
                            child: Center(
                                child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'More Details',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'CNSS : ',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SelectableText(
                                      '${data['cnss']}',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'CIN : ',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SelectableText(
                                      '${data['cin']}',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Phone: ',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SelectableText(
                                      '${data['phone']}',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
              );
            } else {
              return NoProduct(
                title:
                    "There Is No Seaman With This ID, Or The Seaman Is Removed",
                subtitle: "Check The Url For Errors Or Go To The Home Page",
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
        });
  }
}
