import 'dart:ui';
import 'package:admin/error404.dart';
import 'package:admin/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Future<DocumentSnapshot> getDocDoc(x) async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  return await _firestore.collection('documents').doc(x).get();
}

class DocumentPage extends StatelessWidget {
  final String id = Get.parameters['id']!;
  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "صفحة وثيقة",
      subtitle: FutureBuilder<DocumentSnapshot>(
        future: getDocDoc(id),
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
                "${item!['name']}" + "     " + "${item.id}",
              ));
            }
          } else if (snapshot.hasError) {
            Text('no data');
          }
          return CircularProgressIndicator();
        },
      ),
      child: FutureBuilder<DocumentSnapshot>(
          future: getDocDoc(id),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              DocumentSnapshot? d = snapshot.data;

              if (d!.exists) {
                Map<String?, dynamic>? data = d.data()!;
                return Center(
                  child: ListView(
                    children: [
                      OutlinedButton(
                          onPressed: () => GetPlatform.isMobile
                              ? Get.defaultDialog(
                                  title: 'Zoom In Document',
                                  content: Expanded(
                                    child: InteractiveViewer(
                                      child: Center(
                                          child: Image.network(
                                              '${data['preview']}')),
                                    ),
                                  ))
                              : null,
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30)))),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                                child: Image.network('${data['preview']}')),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 500,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<OutlinedBorder>(
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
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Attachment : ',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    icon: Icon(Feather.file),
                                    onPressed: () {
                                      launch(
                                          'http://www.africau.edu/images/default/sample.pdf');
                                    },
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Description : ',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: Text(
                                  '${data['description']}',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return NoProduct(
                  title:
                      "There Is No Document With This ID, Or The Document Is Removed",
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
          }),
    );
  }
}
